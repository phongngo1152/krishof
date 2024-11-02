package load_product.Dao;

import java.util.List;

import load_product.entity.Categorize;
import load_product.entity.Producer;
import load_product.entity.Product;

public interface ProductDao {
	public List<Product> getProducts();
	public Product  getProduct(int proId);
	public boolean insertPruduct(Product product);
	public boolean updatePruduct(Product product);
	public boolean deletePruduct(int proId);
	public List<Product> getProductsbycategorize(int cateorize_id);
	public List<Product> getProductByName(String productName);
	public List<Product> getNewProducts();
	public List<Product> getNewProductsTop();
	public List<Product> getNewProductsPaginate(int page);
	public List<Integer> numberPage();
}
