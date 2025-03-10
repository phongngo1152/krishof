package load_product.Dao;

import java.util.List;

import load_product.entity.Categorize;
import load_product.entity.OrderDetail;
import load_product.entity.Orders;

public interface OrderDao {
	public List<Orders> getOrders();
	public List<Orders> getOrdersByUser(Long id,int page);
	public boolean insertOrders(Orders order);
	public boolean updateOrder(Orders order);
	public List<Orders> getNewOrderPaginate(int page);
	public List<Integer> numberPage();
	public Orders getOrders(int id);
	
	public List<Integer> numberPageUser(Long id);

}

