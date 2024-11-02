package load_product.Dao;

import java.util.List;

import load_product.entity.Category;
import load_product.entity.Images;
import load_product.entity.Product;

public interface ImageDao {
	public List<Images> getImage();
	public List<Images> getImagebyProId(int proId);
	public boolean insertImages(Images images);
	public boolean updateImages(Images images);
	public boolean deleteImages(int id);
	public Images getImagesByID(int id);
	public List<Images> getNewImagesPaginate(int page);
	public List<Integer> numberPage();
}
