package load_product.entity;

import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "Producer")
public class Producer {
	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer producerId;
	@Column(name = "name_producer")
	private String name_producer;
	@OneToMany(mappedBy = "producer")
	private Set<Product> products;
	public Producer() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Producer(Integer producerId, String name_producer, Set<Product> products) {
		super();
		this.producerId = producerId;
		this.name_producer = name_producer;
		this.products = products;
	}
	public Integer getProducerId() {
		return producerId;
	}
	public void setProducerId(Integer producerId) {
		this.producerId = producerId;
	}
	public String getName_producer() {
		return name_producer;
	}
	public void setName_producer(String name_producer) {
		this.name_producer = name_producer;
	}
	public Set<Product> getProducts() {
		return products;
	}
	public void setProducts(Set<Product> products) {
		this.products = products;
	}
	
}
