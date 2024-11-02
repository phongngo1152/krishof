package load_product.Dao;

import java.util.List;

import load_product.entity.Category;
import load_product.entity.Producer;
import load_product.entity.Product;

public interface ProducerDao {
	public List<Producer> getProducers();
	public boolean insertProducer(Producer producer);
	public boolean updateProducer(Producer producer);
	public boolean deleteProducer(int id);
	public Producer getProducer(int id);
	public List<Producer> getProducerByName(String producerName);
	public List<Producer> getNewProducersPaginate(int page);
	public List<Integer> numberPage();
}
