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
@Table(name = "Images")
public class Images {
	@Id
	@Column(name = "id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer imageId;
	@Column(name = "image")
	private String nameImage;
	@ManyToOne
	@JoinColumn(name = "pro_id",referencedColumnName = "id")
	private Product product ;
	public Images() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Images(Integer imageId, String nameImage, Product product) {
		super();
		this.imageId = imageId;
		this.nameImage = nameImage;
		this.product = product;
	}
	public Integer getImageId() {
		return imageId;
	}
	public void setImageId(Integer imageId) {
		this.imageId = imageId;
	}
	public String getNameImage() {
		return nameImage;
	}
	public void setNameImage(String nameImage) {
		this.nameImage = nameImage;
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	
	
}
