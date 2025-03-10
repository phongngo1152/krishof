package load_product.entity;

import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "StatusType")
public class StatusType {
    @Id
    @Column(name = "id")
    private Integer id;
    
    @Column(name = "status_name")
    private String status_name;
    @OneToMany(mappedBy = "statusType", fetch = FetchType.EAGER)
	private Set<Orders> order;

    // Constructors
    public StatusType() {
    }

    public Set<Orders> getOrderStatus() {
		return order;
	}

	public void setOrderStatus(Set<Orders> orderStatus) {
		this.order = orderStatus;
	}

	public StatusType(Integer id, String status_name, Set<Orders> orderStatus) {
		super();
		this.id = id;
		this.status_name = status_name;
		this.order = orderStatus;
	}

	public StatusType(Integer id, String name) {
        this.id = id;
        this.status_name = name;
    }

    // Getters and setters
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

	public String getStatus_name() {
		return status_name;
	}

	public void setStatus_name(String status_name) {
		this.status_name = status_name;
	}

   }
