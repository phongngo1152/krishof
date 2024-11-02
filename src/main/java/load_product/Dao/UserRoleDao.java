package load_product.Dao;

import load_product.entity.User_Role;

public interface UserRoleDao {
	public boolean deleteUserRole(Long userId);
	public User_Role getUserRole(Long userId);
}
