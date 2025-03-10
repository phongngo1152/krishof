package load_product.entity;

import java.util.Date;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "Orders")
public class Orders {
	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer orderId;
	@Column(name = "Date_order")
	private Date date_order;
	@Column(name = "fullname")
	private String fullName;
	@Column(name = "address")
	private String address;
	@Column(name = "email")
	private String email;
	@Column(name = "telephone")
	private String telephone;
	@Column(name = "payments")
	private String payments;
	@Column(name = "transportation")
	private String transportation;
	@Column(name = "received_date")
	private Date received_date;
	@Column(name = "receive")
	private Integer receive;
	@ManyToOne
	@JoinColumn(name = "users_id", referencedColumnName = "id")
	private User user;
	@ManyToOne
	@JoinColumn(name = "status_id", referencedColumnName = "id")
	private StatusType statusType;
	@OneToMany(mappedBy = "orders", fetch = FetchType.EAGER)
	private Set<OrderDetail> orderDetails;

	public Orders(Integer orderId, Date date_order, String fullName, String address, String email, String telephone,
			String payments, String transportation, Date received_date, Integer receive, User user,
			StatusType statusType, Set<OrderDetail> orderDetails) {
		super();
		this.orderId = orderId;
		this.date_order = date_order;
		this.fullName = fullName;
		this.address = address;
		this.email = email;
		this.telephone = telephone;
		this.payments = payments;
		this.transportation = transportation;
		this.received_date = received_date;
		this.receive = receive;
		this.user = user;
		this.statusType = statusType;

		this.orderDetails = orderDetails;

	}

	public Orders(Integer orderId, Date date_order, String fullName, String address, String email, String telephone,
			String payments, String transportation, Date received_date, User user, Set<OrderDetail> orderDetails) {
		super();
		this.orderId = orderId;
		this.date_order = date_order;
		this.fullName = fullName;
		this.address = address;
		this.email = email;
		this.telephone = telephone;
		this.payments = payments;
		this.transportation = transportation;
		this.received_date = received_date;
		this.user = user;
		this.orderDetails = orderDetails;

	}

	public Orders() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Integer getOrderId() {
		return orderId;
	}

	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}

	public Date getDate_order() {
		return date_order;
	}

	public void setDate_order(Date date_order) {
		this.date_order = date_order;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public String getPayments() {
		return payments;
	}

	public void setPayments(String payments) {
		this.payments = payments;
	}

	public String getTransportation() {
		return transportation;
	}

	public void setTransportation(String transportation) {
		this.transportation = transportation;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Date getReceived_date() {
		return received_date;
	}

	public void setReceived_date(Date received_date) {
		this.received_date = received_date;
	}

	public Integer getReceive() {
		return receive;
	}

	public void setReceive(Integer receive) {
		this.receive = receive;
	}

	public Set<OrderDetail> getOrderDetails() {
		return orderDetails;
	}

	public void setOrderDetails(Set<OrderDetail> orderDetails) {
		this.orderDetails = orderDetails;
	}

	public StatusType getStatusType() {
		return statusType;
	}

	public void setStatusType(StatusType statusType) {
		this.statusType = statusType;
	}

}
