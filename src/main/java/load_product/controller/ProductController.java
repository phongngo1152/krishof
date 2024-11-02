package load_product.controller;


import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;
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

import load_product.Dao.CategorizeDao;
import load_product.Dao.ImageDao;
import load_product.Dao.ProductDao;
import load_product.Dao.UserDAO;
import load_product.Dao.UserRoleDao;
import load_product.entity.CardProduct;
import load_product.entity.Categorize;
import load_product.entity.CustomUserDetails;
import load_product.entity.Images;
import load_product.entity.Orders;
import load_product.entity.Product;
import load_product.entity.Role;
import load_product.entity.User;
import load_product.entity.User_Role;

@Controller
public class ProductController {
	@Autowired
	private ProductDao productDao;
	@Autowired
	private CategorizeDao categorizeDao;
	@Autowired
	private UserDAO userDAO;
	@Autowired
	private ImageDao imageDao;
	@Autowired
	private UserRoleDao userRoleDao;
	@InitBinder
	public void InitBinder(WebDataBinder binder) {
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class,new CustomDateEditor(sf,true));
	}
	@RequestMapping(value = { "/", "/LoadProducts" })
	public String LoadBooks(Model model) {
		List<Product> list = productDao.getNewProductsTop();
		List<Categorize> list_cat = categorizeDao.getCategorizes();
		List<Product> list_new = productDao.getNewProducts();
		List<Integer> list_page = productDao.numberPage();
		model.addAttribute("list", list);
		model.addAttribute("list_cat", list_cat);
		model.addAttribute("list_new", list_new);
		model.addAttribute("list_page", list_page);
		return "home";
	}
	
	@RequestMapping("/PageProduct")
	public String PageProduct(Model model,@RequestParam("page") Integer page) {
		if (page ==null) {
			page =1;
		}
		List<Integer> list_page = productDao.numberPage();
		List<Product> list = productDao.getNewProductsPaginate(page);
		List<Categorize> list_cat = categorizeDao.getCategorizes();
		List<Product> list_new = productDao.getNewProducts();
		model.addAttribute("list_cat", list_cat);
		model.addAttribute("list_new", list_new);
		model.addAttribute("list_page", list_page);
		model.addAttribute("list", list);
		return "home";
	}
	@RequestMapping("/ProductByCatgorize")
	public String productbycatgorize(@RequestParam("catId") Integer catId,Model model) {
		List<Categorize> list_cat = categorizeDao.getCategorizes();
		model.addAttribute("list_cat", list_cat);
		List<Product> list = productDao.getProductsbycategorize(catId);
		model.addAttribute("list", list);
		List<Product> list_new = productDao.getNewProducts();
		model.addAttribute("list_new", list_new);
		return "product";
	}

	@RequestMapping("/Product")
	public String Loadproduct(Model model) {
		List<Categorize> list_cat = categorizeDao.getCategorizes();
		model.addAttribute("list_cat", list_cat);
		List<Product> list = productDao.getProducts();
		model.addAttribute("list", list);
		List<Product> list_new = productDao.getNewProducts();
		model.addAttribute("list_new", list_new);
		return "product";
	}
	@RequestMapping("/Blog")
	public String Blog(Model model) {
		List<Categorize> list_cat = categorizeDao.getCategorizes();
		model.addAttribute("list_cat", list_cat);
		return "blog";
	}
	@RequestMapping("/About")
	public String About(Model model) {
		List<Categorize> list_cat = categorizeDao.getCategorizes();
		model.addAttribute("list_cat", list_cat);
		return "about";
	}
	@RequestMapping("/Concat")
	public String Concat(Model model) {
		List<Categorize> list_cat = categorizeDao.getCategorizes();
		model.addAttribute("list_cat", list_cat);
		return "concat";
	}

	@RequestMapping("/Detailproduct")
	public String detailProduct(@RequestParam("proId") Integer proId, Model model) {
		Product product = productDao.getProduct(proId);
		List<Images> list = imageDao.getImagebyProId(proId);
		model.addAttribute("list", list);
		model.addAttribute("p", product);
		return "detailproduct";
	}
	@RequestMapping("/Card")
	public String card(Model model,HttpSession session) {
		
		List<CardProduct> list_card = (List<CardProduct>) session.getAttribute("list_card");
		if (list_card == null) {
			list_card = new ArrayList<>();
			CardProduct cardProduct = new CardProduct();
			session.setAttribute("list_card", list_card);
		}
		boolean b = true;
		if (list_card.isEmpty()) {
			b= false;
		}
		model.addAttribute("list", list_card);
		model.addAttribute("b", b);
		float totalpricee = 0;
		for (CardProduct cardProduct : list_card) {
			 totalpricee += cardProduct.getTotalQuantity();
		}
		model.addAttribute("totalpricee", totalpricee);
		return "orderdetail";
	}
	
	@RequestMapping("/Cardproduct")
	public String cardproduct(@RequestParam("proId") Integer proId, Model model, HttpSession session) {
		Product product = productDao.getProduct(proId);

		List<CardProduct> list_card = (List<CardProduct>) session.getAttribute("list_card");
		if (list_card == null) {
			list_card = new ArrayList<>();
			CardProduct cardProduct = new CardProduct();
			cardProduct.setProId(product.getProId());
			cardProduct.setName_product(product.getName_product());
			cardProduct.setAva(product.getAva());
			cardProduct.setPrice(product.getPrice());
			cardProduct.setQuantity(1);
			cardProduct.total();
			list_card.add(cardProduct);
			session.setAttribute("list_card", list_card);
		} else {
			boolean check = true;
			for (CardProduct cardProduct2 : list_card) {
				if (cardProduct2.getProId() == proId) {
					cardProduct2.setQuantity(cardProduct2.getQuantity() + 1);
					cardProduct2.total();
					check = false;
				} 
			}
			if (check) {
				CardProduct cardProduct = new CardProduct();
				cardProduct.setProId(product.getProId());
				cardProduct.setName_product(product.getName_product());
				cardProduct.setAva(product.getAva());
				cardProduct.setPrice(product.getPrice());
				cardProduct.setQuantity(1);
				cardProduct.total();
				list_card.add(cardProduct);
				session.setAttribute("list_card", list_card);
			}
		}
		model.addAttribute("list", list_card);
		return "redirect:/Card";
	}

	@RequestMapping("/Orderproduct")
	public String orderproduct(@RequestParam("proId") Integer proId, Model model) {
		Product product = productDao.getProduct(proId);
		List<Images> list = imageDao.getImagebyProId(proId);
		model.addAttribute("list", list);
		model.addAttribute("p", product);
		
		return "orderproduct";
	}
	
	@RequestMapping("/updateOrderQuantity")
	public String updateOrderQuantity(@RequestParam("Id") int Id,@RequestParam("quantity") int quantity, Model model,HttpSession session) {
		List<CardProduct> list_card = (List<CardProduct>) session.getAttribute("list_card");
		list_card.get(Id).setQuantity(quantity);
		list_card.get(Id).total();
		session.setAttribute("list_card", list_card);
		model.addAttribute("list", list_card);
		boolean b = true;
		if (list_card.isEmpty()) {
			b= false;
		}
		model.addAttribute("b", b);
		float totalpricee = 0;
		for (CardProduct cardProduct : list_card) {
			 totalpricee += cardProduct.getTotalQuantity();
		}
		model.addAttribute("totalpricee", totalpricee);
		return "orderdetail";
	}
	@RequestMapping("/DeleteOrder")
	public String deleteOrder(@RequestParam("Id") int Id, Model model,HttpSession session) {
		List<CardProduct> list_card = (List<CardProduct>) session.getAttribute("list_card");
		list_card.remove(Id);
		session.setAttribute("list_card", list_card);
		model.addAttribute("list", list_card);
		boolean b = true;
		if (list_card.isEmpty()) {
			b= false;
		}
		model.addAttribute("b", b);
		float totalpricee = 0;
		for (CardProduct cardProduct : list_card) {
			 totalpricee += cardProduct.getTotalQuantity();
		}
		model.addAttribute("totalpricee", totalpricee);
		return "orderdetail";
	}
	@RequestMapping("/createuser")
	public String createUSer(Model model) {
		User u = new User();
		model.addAttribute("u", u);
		return "createuser";
	}
	@RequestMapping("/InsertUser")
	public String insertUser(@ModelAttribute("u") User user,Model model) {
		Role role = userDAO.getRole((long) 2);
		User_Role rl = new User_Role();
		rl.setRole(role);
		rl.setUser(user);
		String pas = user.getPassWord();
		user.setPassWord(BCrypt.hashpw(pas, BCrypt.gensalt(12)));
		boolean bl = userDAO.insertUser(user, rl);
		if (bl) {
			model.addAttribute("mess", "Register Succes!");
			return "login";
			
		} else {
			
			model.addAttribute("err","Insert Faill!");
			model.addAttribute("u", user);
			return "createuser";
		}
	
	}
	
	
	
}
