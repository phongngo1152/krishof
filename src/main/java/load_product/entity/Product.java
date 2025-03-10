package load_product.entity;

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
@Table(name = "Product")
public class Product {
	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer proId;
	@Column(name = "name_product")
	private String name_product;
	@Column(name = "price")
	private float price;
	@Column(name = "avarta")
	private String ava;
	@Column(name = "description")
	private String description;
	@ManyToOne
	@JoinColumn(name = "cat_id",referencedColumnName = "id")
	private Category category;
	@ManyToOne
	@JoinColumn(name = "producer_id",referencedColumnName = "id")
	private Producer producer;
	@ManyToOne
	@JoinColumn(name = "categorize_id",referencedColumnName = "id")
	private Categorize categorize;
	@OneToMany(mappedBy = "product",fetch = FetchType.EAGER)
	private Set<Images> images;
	@OneToMany(mappedBy = "product",fetch = FetchType.EAGER)
	private Set<OrderDetail> orderDetails;
	@OneToMany(mappedBy = "product",fetch = FetchType.EAGER)
	private Set<Favorite> favorites;

	public Set<Favorite> getFavorites() {
		return favorites;
	}
	public void setFavorites(Set<Favorite> favorites) {
		this.favorites = favorites;
	}
	public Product() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Product(Integer proId, String name_product, float price, String ava, String description, Category category,
			Producer producer, Categorize categorize, Set<Images> images) {
		super();
		this.proId = proId;
		this.name_product = name_product;
		this.price = price;
		this.ava = ava;
		this.description = description;
		this.category = category;
		this.producer = producer;
		this.categorize = categorize;
		this.images = images;
	}
	public Integer getProId() {
		return proId;
	}
	public void setProId(Integer proId) {
		this.proId = proId;
	}
	public String getName_product() {
		return name_product;
	}
	public void setName_product(String name_product) {
		this.name_product = name_product;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	public String getAva() {
		return ava;
	}
	public void setAva(String ava) {
		this.ava = ava;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Category getCategory() {
		return category;
	}
	public void setCategory(Category category) {
		this.category = category;
	}
	public Producer getProducer() {
		return producer;
	}
	public void setProducer(Producer producer) {
		this.producer = producer;
	}
	public Categorize getCategorize() {
		return categorize;
	}
	public void setCategorize(Categorize categorize) {
		this.categorize = categorize;
	}
	public Set<Images> getImages() {
		return images;
	}
	public void setImages(Set<Images> images) {
		this.images = images;
	}
	
}
