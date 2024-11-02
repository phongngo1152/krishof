package load_product.Dao;

import java.util.List;

import load_product.entity.Product;
import load_product.entity.Role;
import load_product.entity.User;
import load_product.entity.User_Role;

public interface UserDAO {
	public List<User> getAllUser();
	public User findByUserName(String username);
	public Role getRole(Long id);
	public boolean insertUser(User user,User_Role userrole);
	public boolean insertUserRole(User_Role user);
	public boolean updateuser(User user);
	public User findByUserId(Long userId);
	public boolean deleteUser(Long id,User_Role user_Role);
	public List<User> getUserByName(String username);

	
}
