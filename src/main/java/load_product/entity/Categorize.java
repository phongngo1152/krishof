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
@Table(name = "categorize")
public class Categorize {
	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer categorizeId;
	@Column(name = "categorize")
	private String categorizeName;
	@OneToMany(mappedBy = "categorize")
	private Set<Product> products;
	public Categorize() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Categorize(Integer categorizeId, String categorizeName, Set<Product> products) {
		super();
		this.categorizeId = categorizeId;
		this.categorizeName = categorizeName;
		this.products = products;
	}
	public Integer getCategorizeId() {
		return categorizeId;
	}
	public void setCategorizeId(Integer categorizeId) {
		this.categorizeId = categorizeId;
	}
	public String getCategorizeName() {
		return categorizeName;
	}
	public void setCategorizeName(String categorizeName) {
		this.categorizeName = categorizeName;
	}
	public Set<Product> getProducts() {
		return products;
	}
	public void setProducts(Set<Product> products) {
		this.products = products;
	}
	
	
	
	
}
