package load_product.Impl;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import load_product.Dao.ProductDao;
import load_product.Dao.UserDAO;
import load_product.Dao.UserRoleDao;
import load_product.entity.Role;
import load_product.entity.User;
import load_product.entity.User_Role;
@Repository
public class UserRoleImpl implements UserRoleDao {
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public boolean deleteUserRole(Long userId) {
		Session session = sessionFactory.openSession();
		try {
			session.beginTransaction();
			session.delete(getUserRole(userId));
			session.getTransaction().commit();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		} finally {
			session.close();
		}
		return false;
	}

	@Override
	public User_Role getUserRole(Long userId) {
		Session session = sessionFactory.openSession();
		try {
			User_Role role = (User_Role) session.createQuery("from User_Role where userId = :userId")
					.setParameter("userId", userId).uniqueResult();
			return role;
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		} finally {
			session.close();
		}
		return null;
	}

}
