package load_product.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Set;

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

import load_product.Dao.OrderDao;
import load_product.Dao.OrderDetailDao;
import load_product.Dao.UserDAO;
import load_product.Dao.UserRoleDao;
import load_product.entity.CardProduct;
import load_product.entity.CustomUserDetails;
import load_product.entity.OrderDetail;
import load_product.entity.Orders;
import load_product.entity.User;
import load_product.entity.User_Role;

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
	private OrderDetailDao detailDao ;
	@InitBinder
	public void InitBinder(WebDataBinder binder) {
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class,new CustomDateEditor(sf,true));
	}
	@RequestMapping("/user")
	public String userPage(Model model) {
		model.addAttribute("mess", "Welcome user page");
		CustomUserDetails user =  (CustomUserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		model.addAttribute("user", user);
		return "redirect:/LoadProducts";
	}
	@RequestMapping("/Order")
	public String Order(Model model) {
		Orders orders = new Orders();
		model.addAttribute("order", orders);
		CustomUserDetails user =  (CustomUserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		User user2 = userDAO.findByUserName(user.getUsername());
		model.addAttribute("user", user2);
		return"order";
	}
	@RequestMapping("/infor")
	public String infor(Model model) {
		CustomUserDetails user =  (CustomUserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		model.addAttribute("user", user);
		return "infor";
	}
	@RequestMapping("/InsertOrder")
	public String InsertOrder(@ModelAttribute("order") Orders orders, Model model, HttpSession session) {
		boolean bl = orderDao.insertOrders(orders);
		List<CardProduct> list_card = (List<CardProduct>) session.getAttribute("list_card");
		for (CardProduct cardProduct : list_card) {
			OrderDetail detail=new OrderDetail();
			detail.setOrders(orders);
			detail.setTotalprice(cardProduct.getPrice()*cardProduct.getQuantity());
			detail.setQuantity(cardProduct.getQuantity());
			detail.setProduct(cardProduct);
			boolean b = detailDao.insertOrderDetails(detail);
			if (b==false) {
				return "redirect:/Order";
			}
		}
		if (bl) {
			model.addAttribute("mess", "Create orders Succes!");
			List<Integer> list_page = orderDao.numberPage();
			List<Orders> list = orderDao.getNewOrderPaginate(1);
			model.addAttribute("list_page", list_page);
			model.addAttribute("list", list);
			return "succses";

		} else {
			
			return "redirect:/Order";
		}
	}
	@RequestMapping("/Checkout")
	public String CheckoutPage(@ModelAttribute("ords") Orders order,Model model) {
		CustomUserDetails user =  (CustomUserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		User user2 = userDAO.findByUserName(user.getUsername());
		model.addAttribute("user", user2);
		
		List<Integer> list_page = orderDao.numberPage();
		List<Orders> list = orderDao.getOrdersByUser(user2.getId(),1);
		model.addAttribute("list_page", list_page);
		model.addAttribute("list", list);

		return "checkout";
	}
	
	@RequestMapping("/PageCheckOut")
	public String PageOrderAdmin(Model model,@RequestParam("page") Integer page) {
		if (page ==null) {
			page =1;
		}
		List<Integer> list_page = orderDao.numberPage();
		List<Orders> list = orderDao.getNewOrderPaginate(page);
		model.addAttribute("list_page", list_page);
		model.addAttribute("list", list);
		return "checkout";
	}
	@RequestMapping("/editOrder")
	public String editOrder(@ModelAttribute("ords") Orders orders, Model model) {
		Orders orders2 = orderDao.getOrders(orders.getOrderId());
		orders2.setReceive(orders.getReceive());
		boolean bl = orderDao.updateOrder(orders2);
		if (bl) {
			CustomUserDetails user =  (CustomUserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			User user2 = userDAO.findByUserName(user.getUsername());
			model.addAttribute("user", user2);
			List<Integer> list_page = orderDao.numberPage();
			List<Orders> list = orderDao.getOrdersByUser(user2.getId(),1);
			model.addAttribute("list_page", list_page);
			model.addAttribute("list", list);
			return "checkout";
			
			
		} else {
			model.addAttribute("err", "Update Faill!");
			CustomUserDetails user =  (CustomUserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
			User user2 = userDAO.findByUserName(user.getUsername());
			model.addAttribute("user", user2);
			List<Integer> list_page = orderDao.numberPage();
			List<Orders> list = orderDao.getOrdersByUser(user2.getId(),1);
			model.addAttribute("list_page", list_page);
			model.addAttribute("list", list);
			return "checkout";
		}
		
	}
	
	@RequestMapping("/OrderDetail")
	public String OrderDetail(@ModelAttribute("ords") Orders order,@RequestParam("orderId") int id,Model model) {
		CustomUserDetails user =  (CustomUserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		User user2 = userDAO.findByUserName(user.getUsername());
		model.addAttribute("user", user2);
		List<OrderDetail> list = detailDao.getOrderDetailsByOrderId(id);
		model.addAttribute("list", list);
		return "detailCheckout";
	}
	
	
	


}
