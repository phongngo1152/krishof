package load_product.Dao;

import java.util.List;

import load_product.entity.OrderDetail;
import load_product.entity.Producer;

public interface OrderDetailDao {
	public List<OrderDetail> getOrderDetails();
	public boolean insertOrderDetails(OrderDetail orderDetail);
	public boolean updateOrderDetail(OrderDetail orderDetail);
	public OrderDetail getOrderDetail(int id);
	public List<OrderDetail> getOrderDetailsByOrderId(int order_id);
	public float totalDetail(int order_id);

}
