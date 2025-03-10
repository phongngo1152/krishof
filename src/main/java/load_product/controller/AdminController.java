package load_product.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.StandardOpenOption;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

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
import org.springframework.web.multipart.MultipartFile;

import load_product.Dao.CategorizeDao;
import load_product.Dao.CategoryDao;
import load_product.Dao.ImageDao;
import load_product.Dao.OrderDao;
import load_product.Dao.OrderStatusDao;
import load_product.Dao.ProducerDao;
import load_product.Dao.ProductDao;
import load_product.Dao.UserDAO;
import load_product.Dao.UserRoleDao;
import load_product.entity.Categorize;
import load_product.entity.Category;
import load_product.entity.CustomUserDetails;
import load_product.entity.Images;
import load_product.entity.OrderDetail;
import load_product.entity.OrderStatus;
import load_product.entity.Orders;
import load_product.entity.Producer;
import load_product.entity.Product;
import load_product.entity.Role;
import load_product.entity.StatusType;
import load_product.entity.User;
import load_product.entity.User_Role;

@Controller
@RequestMapping("/admin")
public class AdminController {
	@Autowired
	private UserDAO userDAO;
	@Autowired
	private CategoryDao categoryDao;
	@Autowired
	private UserRoleDao userRoleDao;
	@Autowired
	private CategorizeDao categorizeDao;
	@Autowired
	private ProducerDao producerDao;
	@Autowired
	private ImageDao imageDao;
	@Autowired
	private ProductDao productDao;
	@Autowired
	private OrderDao orderDao;
	@Autowired
	private OrderStatusDao statusDao ;

	@InitBinder
	public void InitBinder(WebDataBinder binder) {
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(sf, true));
	}

	@RequestMapping("/welcome")
	public String adminPage(Model model) {
		model.addAttribute("mess", "Welcome to admin page");
		List<Integer> list_page = userDAO.numberPage();
		List<User> list = userDAO.getNewUserPaginate(1);
		model.addAttribute("list", list);
		model.addAttribute("list_page", list_page);
		return "admin";
	}
	@RequestMapping("/PageUserAdmin")
	public String PageUserAdmin(Model model,@RequestParam("page") Integer page) {
		if (page ==null) {
			page =1;
		}
		List<Integer> list_page = userDAO.numberPage();
		List<User> list = userDAO.getNewUserPaginate(page);
		model.addAttribute("list_page", list_page);
		model.addAttribute("list", list);
		return "admin";
	}
	@RequestMapping("/UpdateUser")
	public String updateUser(@RequestParam("userName") String Name, Model model) {
		User user = userDAO.findByUserName(Name);
		model.addAttribute("u", user);
		return "updateuser";
	}

	@RequestMapping("/editUser")
	public String editUser(@ModelAttribute("u") User user, Model model) {
		String pas = user.getPassWord();
		user.setPassWord(BCrypt.hashpw(pas, BCrypt.gensalt(12)));
		Boolean bl = userDAO.updateuser(user);
		if (bl) {
			return "redirect:/admin/welcome";
		} else {

			model.addAttribute("err", "Update Faill!");
			model.addAttribute("u", user);
			return "updateuser";
		}
	}

	@RequestMapping("/deleteUser")
	public String deleteUser(@RequestParam("userId") Long id, Model model) {
		User_Role user_Role = userRoleDao.getUserRole(id);
		Boolean bl = userDAO.deleteUser(id, user_Role);
		if (bl) {
			return "redirect:/admin/welcome";
		} else {
			model.addAttribute("err", "Delete Faill!");
			List<User> list = userDAO.getAllUser();
			model.addAttribute("list", list);
			return "admin";
		}
	}

	@RequestMapping("/InsertAdmin")
	public String insertAdmin(@ModelAttribute("u") User user, Model model) {
		Role role = userDAO.getRole((long) 1);
		User_Role rl = new User_Role();
		rl.setRole(role);
		rl.setUser(user);
		String pas = user.getPassWord();
		user.setPassWord(BCrypt.hashpw(pas, BCrypt.gensalt(12)));
		boolean bl = userDAO.insertUser(user, rl);
		if (bl) {
			model.addAttribute("mess", "Register Succes!");
			return "redirect:/admin/welcome";

		} else {

			model.addAttribute("err", "Insert Faill!");
			model.addAttribute("u", user);
			return "createadmin";
		}
	}

	@RequestMapping("/createadmin")
	public String createAdmin(Model model) {
		User u = new User();
		model.addAttribute("u", u);
		return "createadmin";
	}
	@RequestMapping("/category")
	public String categoryPage(Model model) {
		List<Integer> list_page = categoryDao.numberPage();
		List<Category> list = categoryDao.getNewCategoryPaginate(1);
		model.addAttribute("list_page", list_page);
		model.addAttribute("list", list);
		return "admin_category";
	}
	
	@RequestMapping("/PageCategoryAdmin")
	public String PageCategoryAdmin(Model model,@RequestParam("page") Integer page) {
		if (page ==null) {
			page =1;
		}
		List<Integer> list_page = categoryDao.numberPage();
		List<Category> list = categoryDao.getNewCategoryPaginate(page);
		model.addAttribute("list_page", list_page);
		model.addAttribute("list", list);
		return "admin_category";
	}
	@RequestMapping("/createCategory")
	public String createCategory(Model model) {
		Category cat = new Category();
		model.addAttribute("cat", cat);
		return "createCategory";
	}

	@RequestMapping("/InsertCat")
	public String InsertCat(@ModelAttribute("cat") Category cat, Model model) {
		boolean bl = categoryDao.insertCategories(cat);
		if (bl) {
			model.addAttribute("mess", "Create Category Succes!");
			List<Integer> list_page = categoryDao.numberPage();
			List<Category> list = categoryDao.getNewCategoryPaginate(1);
			model.addAttribute("list_page", list_page);
			model.addAttribute("list", list);
			return "admin_category";
		} else {
			model.addAttribute("err", "Insert Faill!");
			model.addAttribute("cat", cat);
			return "createCategory";
		}
	}

	@RequestMapping("/UpdateCategory")
	public String updateCat(@RequestParam("catId") int id, Model model) {
		Category cat = categoryDao.getCategory(id);
		model.addAttribute("cat", cat);
		return "updateCategory";
	}

	@RequestMapping("/edittCat")
	public String edittCat(@ModelAttribute("cat") Category cat, Model model) {
		boolean bl = categoryDao.updateCategories(cat);
		if (bl) {
			model.addAttribute("mess", "Update Category Succes!");
			List<Integer> list_page = categoryDao.numberPage();
			List<Category> list = categoryDao.getNewCategoryPaginate(1);
			model.addAttribute("list_page", list_page);
			model.addAttribute("list", list);
			return "admin_category";
		} else {
			model.addAttribute("err", "Update Faill!");
			model.addAttribute("cat", cat);
			return "createCategory";
		}
	}

	@RequestMapping("/deleteCategory")
	public String deleteCategory(@RequestParam("catId") int id, Model model) {
		boolean bl = categoryDao.deleteCategories(id);
		if (bl) {
			model.addAttribute("mess", "Delete Category Succes!");
			List<Integer> list_page = categoryDao.numberPage();
			List<Category> list = categoryDao.getNewCategoryPaginate(1);
			model.addAttribute("list_page", list_page);
			model.addAttribute("list", list);
			return "admin_category";
		} else {
			model.addAttribute("err", "Delete Faill!");
			List<Integer> list_page = categoryDao.numberPage();
			List<Category> list = categoryDao.getNewCategoryPaginate(1);
			model.addAttribute("list_page", list_page);
			model.addAttribute("list", list);
			return "admin_category";
		}

	}
	@RequestMapping("/categorize")
	public String categorizePage(Model model) {
		List<Integer> list_page = categorizeDao.numberPage();
		List<Categorize> list = categorizeDao.getNewCategorizePaginate(1);
		model.addAttribute("list_page", list_page);
		model.addAttribute("list", list);
		return "admin_categorize";
	}
	@RequestMapping("/PageCategorizeAdmin")
	public String PageCategozeAdmin(Model model,@RequestParam("page") Integer page) {
		if (page ==null) {
			page =1;
		}
		List<Integer> list_page = categorizeDao.numberPage();
		List<Categorize> list = categorizeDao.getNewCategorizePaginate(page);
		model.addAttribute("list_page", list_page);
		model.addAttribute("list", list);
		return "admin_categorize";
	}
	@RequestMapping("/createCategorize")
	public String createCategorize(Model model) {
		Categorize cat = new Categorize();
		model.addAttribute("cat", cat);
		return "createCategorize";
	}

	@RequestMapping("/InsertCategorize")
	public String InsertCatgorize(@ModelAttribute("cat") Categorize cat, Model model) {
		boolean bl = categorizeDao.insertCategorizes(cat);
		if (bl) {
			model.addAttribute("mess", "Create Categorize Succes!");
			List<Integer> list_page = categorizeDao.numberPage();
			List<Categorize> list = categorizeDao.getNewCategorizePaginate(1);
			model.addAttribute("list_page", list_page);
			model.addAttribute("list", list);
			return "admin_categorize";
		} else {
			model.addAttribute("err", "Insert Faill!");
			model.addAttribute("cat", cat);
			return "createCategorize";
		}
	}

	@RequestMapping("/UpdateCategorize")
	public String updateCategorize(@RequestParam("catId") int id, Model model) {
		Categorize cat = categorizeDao.getCategorize(id);
		model.addAttribute("cat", cat);
		return "updateCategorize";
	}

	@RequestMapping("/edittCategorize")
	public String edittCategorize(@ModelAttribute("cat") Categorize cat, Model model) {
		boolean bl = categorizeDao.updateCategorizes(cat);
		if (bl) {
			model.addAttribute("mess", "Update Categorize Succes!");
			List<Integer> list_page = categorizeDao.numberPage();
			List<Categorize> list = categorizeDao.getNewCategorizePaginate(1);
			model.addAttribute("list_page", list_page);
			model.addAttribute("list", list);
			return "admin_categorize";
		} else {
			model.addAttribute("err", "Update Faill!");
			model.addAttribute("cat", cat);
			return "createCategorize";
		}
	}

	@RequestMapping("/deleteCategorize")
	public String deleteCategorize(@RequestParam("catId") int id, Model model) {
		boolean bl = categorizeDao.deleteCategorizes(id);
		if (bl) {
			model.addAttribute("mess", "Delete Categorize Succes!");
			List<Integer> list_page = categorizeDao.numberPage();
			List<Categorize> list = categorizeDao.getNewCategorizePaginate(1);
			model.addAttribute("list_page", list_page);
			model.addAttribute("list", list);
			return "admin_categorize";
		} else {
			model.addAttribute("err", "Delete Faill!");
			List<Integer> list_page = categorizeDao.numberPage();
			List<Categorize> list = categorizeDao.getNewCategorizePaginate(1);
			model.addAttribute("list_page", list_page);
			model.addAttribute("list", list);
			return "admin_categorize";
		}

	}
	@RequestMapping("/producer")
	public String producerPage(Model model) {
		List<Integer> list_page = producerDao.numberPage();
		List<Producer> list = producerDao.getNewProducersPaginate(1);
		model.addAttribute("list_page", list_page);
		model.addAttribute("list", list);
		return "admin_producer";
	}
	
	@RequestMapping("/PageOrderAdmin")
	public String PageOrderAdmin(Model model,@RequestParam("page") Integer page) {
		if (page ==null) {
			page =1;
		}
		List<Integer> list_page = orderDao.numberPage();
		List<Orders> list = orderDao.getNewOrderPaginate(page);
		model.addAttribute("list_page", list_page);
		model.addAttribute("list", list);
		return "admin_order";
	}
	@RequestMapping("/PageProducerAdmin")
	public String PageProducerAdmin(Model model,@RequestParam("page") Integer page) {
		if (page ==null) {
			page =1;
		}
		List<Integer> list_page = producerDao.numberPage();
		List<Producer> list = producerDao.getNewProducersPaginate(page);
		model.addAttribute("list_page", list_page);
		model.addAttribute("list", list);
		return "admin_producer";
	}
	@RequestMapping("/createProducer")
	public String createProducer(Model model) {
		Producer producer = new Producer();
		model.addAttribute("producer", producer);
		return "createProducer";
	}

	@RequestMapping("/InsertProducer")
	public String InsertProducer(@ModelAttribute("producer") Producer producer, Model model) {
		boolean bl = producerDao.insertProducer(producer);
		if (bl) {
			model.addAttribute("mess", "Create Producer Succes!");
			List<Integer> list_page = producerDao.numberPage();
			List<Producer> list = producerDao.getNewProducersPaginate(1);
			model.addAttribute("list_page", list_page);
			model.addAttribute("list", list);
			return "admin_producer";
		} else {
			model.addAttribute("err", "Insert Faill!");
			model.addAttribute("producer", producer);
			return "createProducer";
		}
	}

	@RequestMapping("/UpdateProducer")
	public String updateProducer(@RequestParam("proId") int id, Model model) {
		Producer producer = producerDao.getProducer(id);
		model.addAttribute("producer", producer);
		return "updateProducer";
	}

	@RequestMapping("/edittProducer")
	public String edittProducer(@ModelAttribute("producer") Producer producer, Model model) {
		boolean bl = producerDao.updateProducer(producer);
		if (bl) {
			model.addAttribute("mess", "Update producer Succes!");
			List<Integer> list_page = producerDao.numberPage();
			List<Producer> list = producerDao.getNewProducersPaginate(1);
			model.addAttribute("list_page", list_page);
			model.addAttribute("list", list);
			return "admin_producer";
		} else {
			model.addAttribute("err", "Update Faill!");
			model.addAttribute("producer", producer);
			return "createProducer";
		}
	}

	@RequestMapping("/deleteProducer")
	public String deleteProducer(@RequestParam("proId") int id, Model model) {
		boolean bl = producerDao.deleteProducer(id);
		if (bl) {
			model.addAttribute("mess", "Delete Producer Succes!");
			List<Integer> list_page = producerDao.numberPage();
			List<Producer> list = producerDao.getNewProducersPaginate(1);
			model.addAttribute("list_page", list_page);
			model.addAttribute("list", list);
			return "admin_producer";
		} else {
			model.addAttribute("err", "Delete Faill!");
			List<Integer> list_page = producerDao.numberPage();
			List<Producer> list = producerDao.getNewProducersPaginate(1);
			model.addAttribute("list_page", list_page);
			model.addAttribute("list", list);
			return "admin_producer";
		}

	}


	@RequestMapping("/image")
	public String imagePage(Model model) {
		List<Product> list = productDao.getNewProductsPaginate(1);
		List<Integer> list_page = productDao.numberPage();
		model.addAttribute("list_page", list_page);
		model.addAttribute("list", list);
		return "admin_image";
	}
	
	@RequestMapping("/PageImageAdmin")
	public String PageImageAdmin(Model model,@RequestParam("page") Integer page) {
		if (page ==null) {
			page =1;
		}
		List<Integer> list_page = productDao.numberPage();
		List<Product> list = productDao.getNewProductsPaginate(page);
		model.addAttribute("list_page", list_page);
		model.addAttribute("list", list);
		return "admin_image";
	}

	@RequestMapping("/createImage")
	public String createImage(Model model) {
		List<Product> list = productDao.getProducts();
		model.addAttribute("list", list);
		Images images = new Images();

		model.addAttribute("images", images);

		return "createImage";
	}

	@RequestMapping("/InsertImage")
	public String insertImage(@ModelAttribute("images") Images images, @RequestParam("imgFile") MultipartFile[] imgFile,
			Model model, HttpServletRequest request) {
		String path = request.getServletContext().getRealPath("resources/images");
		boolean blEnded = true;
		for (MultipartFile img : imgFile) {
			File f = new File(path);
			File destination = new File(f.getAbsolutePath() + "/" + img.getOriginalFilename());
//			if (!destination.exists()) {
//				try {
//					Files.write(destination.toPath(), img.getBytes(), StandardOpenOption.CREATE_NEW);
//					Images images1 = new Images();
//					images1.setProduct(images.getProduct());
//					images1.setNameImage(img.getOriginalFilename());
//					boolean bl = imageDao.insertImages(images1);
//					if (bl==false) {
//						model.addAttribute("err", "Insert Faill!");
//						model.addAttribute("images", images);
//						blEnded = false;
//						return "createImage";
//					} 
//				} catch (IOException e) {
//					// TODO Auto-generated catch block
//					e.printStackTrace();
//				}
//			}

			Images images1 = new Images();
			images1.setProduct(images.getProduct());
			images1.setNameImage(img.getOriginalFilename());
			try {
		        img.transferTo(destination);  
		    } catch (IOException e) {
		        e.printStackTrace();
		        model.addAttribute("err", "Error while saving image!");
		        return "createImage";
		    } 

			boolean bl = imageDao.insertImages(images1);
			if (bl == false) {
				model.addAttribute("err", "Insert Faill!");
				model.addAttribute("images", images);
				blEnded = false;
				return "createImage";
			}

		}

		if (blEnded) {
			model.addAttribute("mess", "Create Images Succes!");
			List<Product> list = productDao.getNewProductsPaginate(1);
			List<Integer> list_page = productDao.numberPage();
			model.addAttribute("list_page", list_page);
			model.addAttribute("list", list);
			return "admin_image";
		}
		return "createImage";
	}

	@RequestMapping("/UpdateImage")
	public String UpdateImage(@RequestParam("imageId") int id, Model model) {
		Images images = imageDao.getImagesByID(id);
		List<Product> list = productDao.getProducts();
		model.addAttribute("images", images);
		model.addAttribute("list", list);
		return "updateImage";
	}

	@RequestMapping("/editImage")
	public String editImage(@ModelAttribute("images") Images images, @RequestParam("imgFile") MultipartFile imgFile,
			Model model, HttpServletRequest request) {
		String path = request.getServletContext().getRealPath("resources/images");
		File f = new File(path);
		File destination = new File(f.getAbsolutePath() + "/" + imgFile.getOriginalFilename());
		images.setNameImage(imgFile.getOriginalFilename());
		boolean bl = imageDao.updateImages(images);
		try {
			imgFile.transferTo(destination);  
	    } catch (IOException e) {
	        e.printStackTrace();
	        model.addAttribute("err", "Error while saving image!");
	        return "updateImage";
	    } 
		if (bl) {
			model.addAttribute("mess", "Update Image Succes!");
			List<Product> list = productDao.getProducts();
			model.addAttribute("list", list);
			return "admin_image";
		} else {
			model.addAttribute("err", "Update Faill!");
			List<Product> list = productDao.getProducts();
			model.addAttribute("list", list);
			return "updateImage";
		}
	}

	@RequestMapping("/deleteImage")
	public String deleteImage(@RequestParam("imageId") int id, Model model) {
		boolean bl = imageDao.deleteImages(id);
		if (bl) {
			model.addAttribute("mess", "Delete image Succes!");
			List<Product> list = productDao.getProducts();
			model.addAttribute("list", list);
			return "admin_image";
		} else {
			model.addAttribute("err", "Delete Faill!");
			List<Product> list = productDao.getProducts();
			model.addAttribute("list", list);
			return "admin_image";
		}

	}
	@RequestMapping("/product")
	public String productPage(Model model) {
		List<Integer> list_page = productDao.numberPage();
		List<Product> list = productDao.getNewProductsPaginate(1);
		model.addAttribute("list_page", list_page);
		model.addAttribute("list", list);
		return "admin_product";
	}
	@RequestMapping("/PageProductAdmin")
	public String PageProductAdmin(Model model,@RequestParam("page") Integer page) {
		if (page ==null) {
			page =1;
		}
		List<Integer> list_page = productDao.numberPage();
		List<Product> list = productDao.getNewProductsPaginate(page);
		model.addAttribute("list_page", list_page);
		model.addAttribute("list", list);
		return "admin_product";
	}
	@RequestMapping("/createProduct")
	public String createProduct(Model model) {
		Product product = new Product();
		model.addAttribute("product", product);
		List<Categorize> list_categorize = categorizeDao.getCategorizes();
		model.addAttribute("list_categorize", list_categorize);
		List<Category> list_cat = categoryDao.getCategories();
		model.addAttribute("list_cat", list_cat);
		List<Producer> list_pro = producerDao.getProducers();
		model.addAttribute("list_pro", list_pro);
		return "createProduct";
	}

	@RequestMapping("/InsertProduct")
	public String InsertProduct(@ModelAttribute("product") Product product,
			@RequestParam("imgFile") MultipartFile imgFile, Model model, HttpServletRequest request) {
		String path = request.getServletContext().getRealPath("resources/images");
		File f = new File(path);
		File destination = new File(f.getAbsolutePath() + "/" + imgFile.getOriginalFilename());

		product.setAva(imgFile.getOriginalFilename());
		
		try {
	        imgFile.transferTo(destination);  
	    } catch (IOException e) {
	        e.printStackTrace();
	        model.addAttribute("err", "Error while saving image!");
	        return "createProduct";
	    }
		boolean bl = productDao.insertPruduct(product);
		if (bl) {
			model.addAttribute("mess", "Insert Product Succes!");
			List<Integer> list_page = productDao.numberPage();
			List<Product> list = productDao.getNewProductsPaginate(1);
			model.addAttribute("list_page", list_page);
			model.addAttribute("list", list);
			return "admin_product";
		} else {
			model.addAttribute("err", "Insert Faill!");
			model.addAttribute("product", product);
			return "createProduct";

		}
	}

	@RequestMapping("/UpdateProduct")
	public String UpdateProduct(@RequestParam("proId") int id, Model model) {
		Product product = productDao.getProduct(id);
		model.addAttribute("product", product);
		List<Categorize> list_categorize = categorizeDao.getCategorizes();
		model.addAttribute("list_categorize", list_categorize);
		List<Category> list_cat = categoryDao.getCategories();
		model.addAttribute("list_cat", list_cat);
		List<Producer> list_pro = producerDao.getProducers();
		model.addAttribute("list_pro", list_pro);
		return "updateProduct";
	}

	@RequestMapping("/deleteProduct")
	public String deleteProduct(@RequestParam("proId") int id, Model model) {
		boolean bl = productDao.deletePruduct(id);
		if (bl) {
			model.addAttribute("mess", "Delete Product Succes!");
			List<Integer> list_page = productDao.numberPage();
			List<Product> list = productDao.getNewProductsPaginate(1);
			model.addAttribute("list_page", list_page);
			model.addAttribute("list", list);
			return "admin_product";
		} else {
			model.addAttribute("err", "Delete Faill!");
			List<Integer> list_page = productDao.numberPage();
			List<Product> list = productDao.getNewProductsPaginate(1);
			model.addAttribute("list_page", list_page);
			model.addAttribute("list", list);
			return "admin_product";

		}
	}

	@RequestMapping("/editProduct")
	public String editProduct(@ModelAttribute("product") Product product,
			@RequestParam("imgFile") MultipartFile imgFile, Model model, HttpServletRequest request) {
		String path = request.getServletContext().getRealPath("resources/images");
		File f = new File(path);
		File destination = new File(f.getAbsolutePath() + "/" + imgFile.getOriginalFilename());
		try {
	        imgFile.transferTo(destination);  
	    } catch (IOException e) {
	        e.printStackTrace();
	        model.addAttribute("err", "Error while saving image!");
	        model.addAttribute("product", product);
			List<Categorize> list_categorize = categorizeDao.getCategorizes();
			model.addAttribute("list_categorize", list_categorize);
			List<Category> list_cat = categoryDao.getCategories();
			model.addAttribute("list_cat", list_cat);
			List<Producer> list_pro = producerDao.getProducers();
			model.addAttribute("list_pro", list_pro);
	        return "updateProduct";
	    }
		product.setAva(imgFile.getOriginalFilename());
		boolean bl = productDao.updatePruduct(product);
		if (bl) {
			model.addAttribute("mess", "Update Product Succes!");
			List<Integer> list_page = productDao.numberPage();
			List<Product> list = productDao.getNewProductsPaginate(1);
			model.addAttribute("list_page", list_page);
			model.addAttribute("list", list);
			return "admin_product";
		} else {
			model.addAttribute("err", "Update Faill!");
			model.addAttribute("product", product);
			List<Categorize> list_categorize = categorizeDao.getCategorizes();
			model.addAttribute("list_categorize", list_categorize);
			List<Category> list_cat = categoryDao.getCategories();
			model.addAttribute("list_cat", list_cat);
			List<Producer> list_pro = producerDao.getProducers();
			model.addAttribute("list_pro", list_pro);
			return "updateProduct";

		}
	}

	@RequestMapping("/searchCategorizeByName")
	public String searchCategorizeByName(@RequestParam("categorizeName") String categorizeName, Model model) {
		List<Categorize> list = categorizeDao.getCategorizeByName(categorizeName);
		model.addAttribute("list", list);
		return "admin_categorize";
	}

	@RequestMapping("/searchCategoryByName")
	public String searchCategoryByName(@RequestParam("categoryName") String categoryName, Model model) {
		List<Category> list = categoryDao.getCategoryByName(categoryName);
		model.addAttribute("list", list);
		return "admin_category";
	}

	@RequestMapping("/searchProducerByName")
	public String searchProducerByName(@RequestParam("producerName") String producerName, Model model) {
		List<Producer> list = producerDao.getProducerByName(producerName);
		model.addAttribute("list", list);
		return "admin_producer";
	}

	@RequestMapping("/searchProductByName")
	public String searchPproductByName(@RequestParam("productName") String productName, Model model) {
		List<Product> list = productDao.getProductByName(productName);
		model.addAttribute("list", list);
		return "admin_product";
	}
	@RequestMapping("/searchUserByName")
	public String searchUserByName(@RequestParam("userName") String userName, Model model) {
		List<User> list = userDAO.getUserByName(userName);
		model.addAttribute("list", list);
		return "admin";

	}
	@RequestMapping("/searchImageByName")
	public String searchImageByName(@RequestParam("productName") String productName, Model model) {
		List<Product> list = productDao.getProductByName(productName);
		model.addAttribute("list", list);
		return "admin_image";

	}
	
	@RequestMapping("/order")
	public String orderPage(Model model) {
		List<Integer> list_page = orderDao.numberPage();
		List<Orders> list = orderDao.getNewOrderPaginate(1);
		model.addAttribute("list_page", list_page);
		model.addAttribute("list", list);
		return "admin_order";
	}
	
	@RequestMapping("/UpdateOrder")
	public String UpdateOrder(@RequestParam("orderId") int id, Model model) {
		Orders orders = orderDao.getOrders(id);
		model.addAttribute("order", orders);

		return "updateOrder";
	}
	
	@RequestMapping("/editOrder")
	public String editOrder(@ModelAttribute("order") Orders orders, Model model) {
		
		// Chuyển đổi Date thành String với định dạng "yyyy-MM-dd"
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		String formattedDateOrder = dateFormat.format(orders.getDate_order());
		String formattedReceivedDate = dateFormat.format(orders.getReceived_date());

		// Đưa vào model để hiển thị trong giao diện (JSP hoặc Thymeleaf)
		model.addAttribute("formattedDateOrder", formattedDateOrder);
		model.addAttribute("formattedReceivedDate", formattedReceivedDate);


		boolean bl = orderDao.updateOrder(orders);
		if (bl) {
			model.addAttribute("mess", "Update Order Succes!");
			List<Integer> list_page = orderDao.numberPage();
			List<Orders> list = orderDao.getNewOrderPaginate(1);
			model.addAttribute("list_page", list_page);
			model.addAttribute("list", list);
			if (orders.getStatusType().getId() == 4) {
				return "admin_order";
			}
				model.addAttribute("order", orders);
				return "updateOrder";
			
			
		} else {
			model.addAttribute("err", "Update Faill!");
			List<Integer> list_page = orderDao.numberPage();
			List<Orders> list = orderDao.getNewOrderPaginate(1);
			model.addAttribute("list_page", list_page);
			model.addAttribute("list", list);
			return "admin_order";
		}
	}
	
}