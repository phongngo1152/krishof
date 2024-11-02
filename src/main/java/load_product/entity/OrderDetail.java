package load_product.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "OrderDetail")
public class OrderDetail {
	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer orderDetailId;
	@Column(name = "Quantity")
	private int quantity;
	@Column(name = "total_price")
	private Float totalprice;
	@ManyToOne
	@JoinColumn(name = "order_id",referencedColumnName = "id")
	private Orders orders;
	@ManyToOne
	@JoinColumn(name = "pro_id",referencedColumnName = "id")
	private Product product ;
	public Float getTotalprice() {
		return totalprice;
	}
	public void setTotalprice(Float totalprice) {
		this.totalprice = totalprice;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public OrderDetail() {
		super();
		// TODO Auto-generated constructor stub
	}
	public OrderDetail(Integer orderDetailId, int quantity, Float price, Orders orders) {
		super();
		this.orderDetailId = orderDetailId;
		this.quantity = quantity;
		this.totalprice = price;
		this.orders = orders;
	}
	public Integer getOrderDetailId() {
		return orderDetailId;
	}
	public void setOrderDetailId(Integer orderDetailId) {
		this.orderDetailId = orderDetailId;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public Float getPrice() {
		return totalprice;
	}
	public void setPrice(Float price) {
		this.totalprice = price;
	}
	public Orders getOrders() {
		return orders;
	}
	public void setOrders(Orders orders) {
		this.orders = orders;
	}
	
}
