package load_product.controller;

import java.awt.Color;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.ObjectInputFilter.Config;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.Set;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.QRCodeWriter;

import load_product.Dao.FavoriteDao;
import load_product.Dao.OrderDao;
import load_product.Dao.OrderDetailDao;
import load_product.Dao.OrderStatusDao;
import load_product.Dao.ProductDao;
import load_product.Dao.UserDAO;
import load_product.Dao.UserRoleDao;
import load_product.entity.CardProduct;
import load_product.entity.CustomUserDetails;
import load_product.entity.Favorite;
import load_product.entity.ImageUtils;
import load_product.entity.OrderDetail;
import load_product.entity.OrderStatus;
import load_product.entity.Orders;
import load_product.entity.Product;
import load_product.entity.StatusType;
import load_product.entity.User;
import load_product.entity.User_Role;
import load_product.service.VnPayService;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserDAO userDAO;
	@Autowired
	private UserRoleDao userRoleDao;
	@Autowired
	private OrderDao orderDao;
	@Autowired
	private OrderDetailDao detailDao;
	@Autowired
	private OrderStatusDao statusDao;
	@Autowired
	private FavoriteDao favoriteDao;
	@Autowired
	private ProductDao productDao;

	@Autowired
	private VnPayService paymentService;

	@InitBinder
	public void InitBinder(WebDataBinder binder) {
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(sf, true));
	}

	@RequestMapping("/user")
	public String userPage(Model model) {
		model.addAttribute("mess", "Welcome user page");
		CustomUserDetails user = (CustomUserDetails) SecurityContextHolder.getContext().getAuthentication()
				.getPrincipal();
		model.addAttribute("user", user);
		return "redirect:/LoadProducts";
	}

	@RequestMapping("/Order")
	public String Order(Model model, HttpSession session) {
		List<CardProduct> list_card = (List<CardProduct>) session.getAttribute("list_card");
		if (list_card == null) {
			list_card = new ArrayList<>();
			CardProduct cardProduct = new CardProduct();
			session.setAttribute("list_card", list_card);
		}
		boolean b = true;
		if (list_card.isEmpty()) {
			b = false;
		}
		model.addAttribute("list_card", list_card);
		model.addAttribute("b", b);
		float totalpricee = 0;
		for (CardProduct cardProduct : list_card) {
			totalpricee += cardProduct.getTotalQuantity();
		}
		Orders orders = new Orders();
		model.addAttribute("order", orders);
		model.addAttribute("currentDate", LocalDate.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd")));
		CustomUserDetails user = (CustomUserDetails) SecurityContextHolder.getContext().getAuthentication()
				.getPrincipal();
		Date dateOrder = Date.from(LocalDate.now().atStartOfDay(ZoneId.systemDefault()).toInstant());
		Date receivedDate = Date.from(LocalDate.now().plusDays(3).atStartOfDay(ZoneId.systemDefault()).toInstant());

		orders.setDate_order(dateOrder);
		orders.setReceived_date(receivedDate);
		User user2 = userDAO.findByUserName(user.getUsername());
		model.addAttribute("user", user2);
		return "order";
	}

	@RequestMapping("/infor")
	public String infor(Model model) {
		CustomUserDetails user = (CustomUserDetails) SecurityContextHolder.getContext().getAuthentication()
				.getPrincipal();
		model.addAttribute("user", user);
		return "infor";
	}

	@RequestMapping("/CheckoutQr")
	public String CheckoutQr(@ModelAttribute("order") Orders orders, Model model, HttpSession session) {

		return "checkoutqr";

	}

	@RequestMapping("/InsertOrder")
	public String InsertOrder(@ModelAttribute("order") Orders orders, Model model, HttpSession session) {

		boolean bl = orderDao.insertOrders(orders);
		StatusType statusType = new StatusType();
		statusType.setId(1);
		orders.setStatusType(statusType);
		List<CardProduct> list_card = (List<CardProduct>) session.getAttribute("list_card");
		for (CardProduct cardProduct : list_card) {
			OrderDetail detail = new OrderDetail();
			detail.setOrders(orders);
			detail.setTotalprice(cardProduct.getPrice() * cardProduct.getQuantity());
			detail.setQuantity(cardProduct.getQuantity());
			detail.setProduct(cardProduct);
			boolean b = detailDao.insertOrderDetails(detail);
			if (b == false) {
				return "redirect:/Order";
			}
		}
		if (bl) {
			return "redirect:/user/Succses?order_id=" + orders.getOrderId();

		}

		return "redirect:/Order";

	}

	@RequestMapping("/Succses")
	public String Succses(@ModelAttribute("order_id") Integer order_id, Model model, HttpSession session) {

		Orders orders = orderDao.getOrders(order_id);
		model.addAttribute("orders", orders);
		String payment = orders.getPayments();
		session.setAttribute("orders", orders);

		if (orders.getPayments().equals("Chuyển khoản")) {
			Orders orders2 = orderDao.getOrders(orders.getOrderId());
			model.addAttribute("payment", orders2.getPayments());
			model.addAttribute("statusType", orders.getStatusType());

			// return "redirect:/user/pay";
		}
		return "succses";

	}

	@RequestMapping("/Checkout")
	public String CheckoutPage(@ModelAttribute("order") Orders order, Model model) {
		CustomUserDetails user = (CustomUserDetails) SecurityContextHolder.getContext().getAuthentication()
				.getPrincipal();
		User user2 = userDAO.findByUserName(user.getUsername());
		model.addAttribute("user", user2);

		List<Integer> list_page = orderDao.numberPageUser(user2.getId());
		List<Orders> list = orderDao.getOrdersByUser(user2.getId(), 1);
//		for (Orders orders2 : list) {
//			System.out.println("aa:" + orders2.getOrderId());
//
//			orderStatus = statusDao.getOrderStatusbyOrder(orders2.getOrderId());
//			System.out.println("aaaa" + orderStatus);
//
//		}
//		System.out.println("sdasdasdasdsout");
//		System.out.println(orderStatus);
		model.addAttribute("order", order);
		model.addAttribute("list_page", list_page);
		model.addAttribute("list", list);

		return "checkout";
	}

	@RequestMapping("/PageCheckOut")
	public String PageOrderAdmin(@ModelAttribute("order") Orders order, Model model,
			@RequestParam("page") Integer page) {
		if (page == null) {
			page = 1;
		}
		CustomUserDetails user = (CustomUserDetails) SecurityContextHolder.getContext().getAuthentication()
				.getPrincipal();
		User user2 = userDAO.findByUserName(user.getUsername());

		List<Integer> list_page = orderDao.numberPageUser(user2.getId());
		List<Orders> list = orderDao.getOrdersByUser(user2.getId(), page);
		model.addAttribute("list_page", list_page);
		model.addAttribute("list", list);
		model.addAttribute("order", order);

		return "checkout";
	}

	@RequestMapping("/editOrder")
	public String editOrder(@ModelAttribute("order") Orders orders, Model model) {
		Orders orders2 = orderDao.getOrders(orders.getOrderId());
		orders2.setStatusType(orders.getStatusType());
		boolean bl = orderDao.updateOrder(orders2);
		if (bl) {
			CustomUserDetails user = (CustomUserDetails) SecurityContextHolder.getContext().getAuthentication()
					.getPrincipal();
			User user2 = userDAO.findByUserName(user.getUsername());
			model.addAttribute("user", user2);
			List<Integer> list_page = orderDao.numberPageUser(user2.getId());
			List<Orders> list = orderDao.getOrdersByUser(user2.getId(), 1);
			model.addAttribute("list_page", list_page);
			model.addAttribute("list", list);
			return "checkout";

		} else {
			System.out.println(orders.getStatusType().getStatus_name());
			System.out.println("21312312312312312312");

			model.addAttribute("err", orders.getStatusType().getId());
			CustomUserDetails user = (CustomUserDetails) SecurityContextHolder.getContext().getAuthentication()
					.getPrincipal();
			User user2 = userDAO.findByUserName(user.getUsername());
			model.addAttribute("user", user2);
//			List<Integer> list_page = orderDao.numberPage();
//			List<Orders> list = orderDao.getOrdersByUser(user2.getId(), 1);
			
			List<Integer> list_page = orderDao.numberPageUser(user2.getId());
			List<Orders> list = orderDao.getOrdersByUser(user2.getId(), 1);
			model.addAttribute("list_page", list_page);
			model.addAttribute("list", list);
			return "checkout";
		}

	}

	@RequestMapping("/OrderDetail")
	public String OrderDetail(@ModelAttribute("ords") Orders order, @RequestParam("orderId") int id, Model model) {
		CustomUserDetails user = (CustomUserDetails) SecurityContextHolder.getContext().getAuthentication()
				.getPrincipal();
		User user2 = userDAO.findByUserName(user.getUsername());
		model.addAttribute("user", user2);
		List<OrderDetail> list = detailDao.getOrderDetailsByOrderId(id);
		model.addAttribute("list", list);
		return "detailCheckout";
	}

	@RequestMapping("/InsertFavorite")
	public String insertFavorite(@RequestParam("proId") int proId, Model model) {
		// Lấy thông tin người dùng từ SecurityContext
		CustomUserDetails user = (CustomUserDetails) SecurityContextHolder.getContext().getAuthentication()
				.getPrincipal();
		User user2 = userDAO.findByUserName(user.getUsername());

		System.out.println(user.getId());

		Product product = productDao.getProduct(proId);

		if (product != null) {
			// Tạo đối tượng Favorite mới
			Favorite favorite = new Favorite();

			favorite.setUser(user2);
			favorite.setProduct(product);

			boolean bl = favoriteDao.insertFavorite(favorite);

			if (bl) {
				model.addAttribute("mess", "Add to Favorite Successful!");
			} else {
				model.addAttribute("err", "Add to Favorite Failed!");
			}
		} else {
			model.addAttribute("err", "Product not found!");
		}

		return "redirect:/Product";
	}

	@RequestMapping("/viewFavorites")
	public String viewFavorites(Model model) {
		// Lấy thông tin người dùng từ SecurityContext
		CustomUserDetails user = (CustomUserDetails) SecurityContextHolder.getContext().getAuthentication()
				.getPrincipal();

		List<Favorite> favoritesList = favoriteDao.getFavoritesByUser(user.getId());
		for (Favorite favorite : favoritesList) {
			System.out.println("123");
		}
		model.addAttribute("favoritesList", favoritesList);

		return "Favorite";

	}

	@RequestMapping("/deleteFavorite")
	public String deleteFavorite(@RequestParam("favorId") int favorId, Model model) {
		// Lấy thông tin người dùng từ SecurityContext
		CustomUserDetails user = (CustomUserDetails) SecurityContextHolder.getContext().getAuthentication()
				.getPrincipal();

		boolean bl = favoriteDao.deleteFavorite(favorId);
		if (bl) {
			model.addAttribute("mess", "Remove from Favorites Success!");
			System.out.println("2e1231231312312312");

			List<Favorite> favoritesList = favoriteDao.getFavoritesByUser(user.getId());
			model.addAttribute("favoritesList", favoritesList);

			return "Favorite";

		} else {
			model.addAttribute("err", "Remove from Favorites Failed!");

			List<Favorite> favoritesList = favoriteDao.getFavoritesByUser(user.getId()); // Lấy lại danh sách yêu thích
																							// mới
			model.addAttribute("favoritesList", favoritesList);

			return "Favorite";
		}
	}

	@RequestMapping("/removeFavorite")
	public String removeFavorite(@RequestParam("favorId") int favorId, Model model) {
		// Lấy thông tin người dùng từ SecurityContext
		CustomUserDetails user = (CustomUserDetails) SecurityContextHolder.getContext().getAuthentication()
				.getPrincipal();

		boolean bl = favoriteDao.deleteFavorite(favorId);
		if (bl) {
			model.addAttribute("mess", "Remove from Favorites Success!");
			System.out.println("2e1231231312312312");

			List<Favorite> favoritesList = favoriteDao.getFavoritesByUser(user.getId());
			model.addAttribute("favoritesList", favoritesList);

			return "redirect:/Product";

		} else {
			model.addAttribute("err", "Remove from Favorites Failed!");

			List<Favorite> favoritesList = favoriteDao.getFavoritesByUser(user.getId());
			model.addAttribute("favoritesList", favoritesList);

			return "redirect:/Product";
		}
	}

	@RequestMapping("/pay")
	public String initiatePayment(@ModelAttribute("orderId") Integer id, Model model, HttpServletResponse resp,
			HttpServletRequest req, HttpSession session) {
//		List<CardProduct> list_card = (List<CardProduct>) session.getAttribute("list_card");
//		if (list_card == null) {
//			list_card = new ArrayList<>();
//			CardProduct cardProduct = new CardProduct();
//			session.setAttribute("list_card", list_card);
//		}
//		boolean b = true;
//		if (list_card.isEmpty()) {
//			b = false;
//		}
//		float totalpricee = 0;
//		for (CardProduct cardProduct : list_card) {
//			totalpricee += cardProduct.getTotalQuantity();
//		}
		float totalpricee = 0;

		List<OrderDetail> details = detailDao.getOrderDetailsByOrderId(id);
		for (OrderDetail orderDetail : details) {
			totalpricee += orderDetail.getTotalprice();
		}

		String orderId = String.valueOf((int) Math.round(details.get(0).getOrders().getOrderId())); // Mã đơn hàng ngẫu
																									// nhiên
		String amount = String.valueOf((int) Math.round(totalpricee)); // Số tiền thanh toán (VNĐ)

		// Tạo URL thanh toán VNPay
		String vnpUrl = paymentService.createVnPayUrl(orderId, amount, req);
		System.out.println(vnpUrl);
		// Tạo mã QR từ URL thanh toán
		BufferedImage qrCodeImage = null;
		try {
			qrCodeImage = generateQRCodeImage(vnpUrl, 300, 300);
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("errorMessage", "Không thể tạo mã QR. Vui lòng thử lại.");
			return "payment"; // Trả về trang lỗi nếu gặp sự cố
		}

		// Chuyển đổi BufferedImage thành Base64
		String qrCodeBase64 = null;
		try {
			qrCodeBase64 = ImageUtils.convertToBase64(qrCodeImage);
		} catch (IOException e) {
			e.printStackTrace();
			model.addAttribute("errorMessage", "Lỗi khi chuyển đổi mã QR.");
			return "payment"; // Trả về trang lỗi nếu gặp sự cố
		}

		model.addAttribute("qrCodeImage", qrCodeBase64); // Thêm chuỗi Base64 vào model
		model.addAttribute("vnpUrl", vnpUrl); // Truyền URL thanh toán vào model
		return "payment"; // View hiển thị thông tin thanh toán và QR code
	}

	private BufferedImage generateQRCodeImage(String text, int width, int height) throws Exception {
		QRCodeWriter qrCodeWriter = new QRCodeWriter();
		Hashtable<EncodeHintType, String> hintMap = new Hashtable<>();
		hintMap.put(EncodeHintType.CHARACTER_SET, "UTF-8");

		BitMatrix bitMatrix = qrCodeWriter.encode(text, BarcodeFormat.QR_CODE, width, height, hintMap);
		return toBufferedImage(bitMatrix);
	}

	private BufferedImage toBufferedImage(BitMatrix matrix) {
		int width = matrix.getWidth();
		int height = matrix.getHeight();
		BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
		image.createGraphics();
		Graphics2D graphics = (Graphics2D) image.getGraphics();
		graphics.setColor(Color.WHITE);
		graphics.fillRect(0, 0, width, height);
		graphics.setColor(Color.BLACK);
		for (int i = 0; i < width; i++) {
			for (int j = 0; j < height; j++) {
				if (matrix.get(i, j)) {
					image.setRGB(i, j, Color.BLACK.getRGB());
				}
			}
		}
		return image;
	}

	@RequestMapping("/vnpay_return")
	public String vnpayReturn(HttpServletRequest request, Model model, HttpSession session) {
		// Lấy các tham số từ VNPay

		String vnp_SecureHash = request.getParameter("vnp_SecureHash");
		String vnp_TxnRef = request.getParameter("vnp_TxnRef");
		String vnp_ResponseCode = request.getParameter("vnp_ResponseCode");
		String vnp_Amount = request.getParameter("vnp_Amount");
		String vnp_BankCode = request.getParameter("vnp_BankCode");
		String vnp_OrderInfo = request.getParameter("vnp_OrderInfo");

		Orders orders = orderDao.getOrders(Integer.parseInt(vnp_TxnRef));
		model.addAttribute("order", orders);
		if (orders != null) {
			model.addAttribute("order", orders);
		} else {
			model.addAttribute("message", "No order found in session");
		}
		// Tạo Map chứa các tham số cần thiết để tính toán chữ ký
		Map<String, String> vnpParams = new HashMap<>();
		vnpParams.put("vnp_TxnRef", vnp_TxnRef);
		vnpParams.put("vnp_Version", request.getParameter("vnp_Version"));
		vnpParams.put("vnp_Command", request.getParameter("vnp_Command"));
		vnpParams.put("vnp_Amount", vnp_Amount);
		vnpParams.put("vnp_CurrCode", request.getParameter("vnp_CurrCode"));
		vnpParams.put("vnp_BankCode", vnp_BankCode);
		vnpParams.put("vnp_OrderInfo", vnp_OrderInfo);
		vnpParams.put("vnp_OrderType", request.getParameter("vnp_OrderType"));
		vnpParams.put("vnp_Locale", request.getParameter("vnp_Locale"));

		// Tính toán chữ ký từ các tham số
		String calculatedSecureHash = null;
		try {
			calculatedSecureHash = paymentService.generateHashData(vnpParams);
		} catch (Exception e) {
			e.printStackTrace();
			model.addAttribute("message", "Lỗi khi tính toán chữ ký.");
			return "paymentResult";
		}
		// Xử lý kết quả thanh toán
		if ("00".equals(vnp_ResponseCode)) {
			model.addAttribute("message", "Giao dịch thành công!");
		} else {
			model.addAttribute("message", "Giao dịch thất bại!");
		}

		return "paymentResult"; 
	}

	public static String getRandomNumber(int len) {
		Random rnd = new Random();
		String chars = "0123456789";
		StringBuilder sb = new StringBuilder(len);
		for (int i = 0; i < len; i++) {
			sb.append(chars.charAt(rnd.nextInt(chars.length())));
		}
		return sb.toString();
	}

}
