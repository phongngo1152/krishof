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
@Table(name = "Favorites")
public class Favorite {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;  // Mã ID của Favorite

    @ManyToOne
    @JoinColumn(name = "user_id", referencedColumnName = "id")
    private User user;  // Mối quan hệ với bảng User

    @ManyToOne
    @JoinColumn(name = "product_id", referencedColumnName = "id")
    private Product product;  // Mối quan hệ với bảng Product
    @Column(name = "is_favorite", nullable = false)
    private boolean isFavorite;  // Dùng kiểu primitive nếu không cần null
    // Constructors
    public Favorite() {}
    public Favorite(Integer id, User user, Product product, Boolean isFavorite) {
        this.id = id;
        this.user = user;
        this.product = product;
        this.isFavorite = isFavorite;
    }
    public Boolean getIsFavorite() {
		return isFavorite;
	}
	public void setIsFavorite(Boolean isFavorite) {
		this.isFavorite = isFavorite;
	}
	public Favorite(Integer id, User user, Product product) {
        this.id = id;
        this.user = user;
        this.product = product;
    }

    // Getters và Setters
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    @Override
    public String toString() {
        return "Favorite [id=" + id + ", user=" + user + ", product=" + product + "]";
    }
}
