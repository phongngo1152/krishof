package load_product.Dao;

import java.util.List;

import load_product.entity.Categorize;
import load_product.entity.Category;

public interface CategorizeDao {
	public List<Categorize> getCategorizes();
	public boolean insertCategorizes(Categorize categorize);
	public boolean updateCategorizes(Categorize categorize);
	public boolean deleteCategorizes(int id);
	public Categorize getCategorize(int id);
	public List<Categorize> getCategorizeByName(String categorizeName);
	public List<Categorize> getNewCategorizePaginate(int page);
	public List<Integer> numberPage();
}
