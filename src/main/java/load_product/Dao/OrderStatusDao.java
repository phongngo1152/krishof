package load_product.Dao;

import java.util.List;

import load_product.entity.OrderStatus;
import load_product.entity.Product;

public interface OrderStatusDao {
    public List<OrderStatus> getOrderStatuses();
    public boolean insertOrderStatus(OrderStatus orderStatus);
    public boolean updateOrderStatus(OrderStatus orderStatus);
    public OrderStatus getOrderStatus(int id);

	public OrderStatus getOrderStatusbyOrder(int order_id);


}
