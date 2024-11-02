package load_product.Dao;

import java.util.List;

import load_product.entity.Categorize;
import load_product.entity.Category;
import load_product.entity.Product;

public interface CategoryDao {
	public List<Category> getCategories();
	public boolean insertCategories(Category category);
	public boolean updateCategories(Category category);
	public boolean deleteCategories(int id);
	public Category getCategory(int id);
	public List<Category> getCategoryByName(String categoryName);
	public List<Category> getNewCategoryPaginate(int page);
	public List<Integer> numberPage();
}
