package load_product.Impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import load_product.Dao.ProductDao;
import load_product.Dao.UserDAO;
import load_product.entity.Role;
import load_product.entity.User;
import load_product.entity.User_Role;

@Repository
public class UserDaoImpl implements UserDAO{
	@Autowired
	private SessionFactory sessionFactory;
	@Override
	public User findByUserName(String username) {
		Session session = sessionFactory.openSession();
		try {
			User user = (User) session.createQuery("from User where userName = :userName")
			.setParameter("userName", username)
			.uniqueResult();
			return user;
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return null;
	}
	@Override
	public boolean insertUser(User user,User_Role userrole) {
		Session session = sessionFactory.openSession();
		try {
			session.beginTransaction();
			session.save(user);
			session.save(userrole);
			session.getTransaction().commit();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		
		return false;
	}
	@Override
	public boolean insertUserRole(User_Role user) {
		// TODO Auto-generated method stub
		return false;
	}
	@Override
	public Role getRole(Long id) {
		Session session = sessionFactory.openSession();
		try {
			Role role = session.get(Role.class, id);
			return role;
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		}finally {
			session.close();
		}
		return null;
	}
	@Override
	public boolean updateuser(User user) {
		Session session = sessionFactory.openSession();
		try {
			session.beginTransaction();
			session.update(user);
			session.getTransaction().commit();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		}finally {
			session.close();
		}
		return false;
	}
	@Override
	public User findByUserId(Long userId) {
		Session session = sessionFactory.openSession();
		try {
			User user = session.get(User.class, userId);
			return user;
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		}finally {
			session.close();
		}
		return null;
	}
	@Override
	public List<User> getAllUser() {
		Session session = sessionFactory.openSession();
		try {
			List list = session.createQuery("from User where id != 1").list();
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return null;
	}
	@Override
	public boolean deleteUser(Long id,User_Role user_Role) {
		Session session = sessionFactory.openSession();
		try {
				session.beginTransaction();
				session.delete(user_Role);
				session.delete(findByUserId(id));
				session.getTransaction().commit();
				return true;
			
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		}finally {
			session.close();
		}
		return false;
	}
	@Override
	public List<User> getUserByName(String username) {
		Session session = sessionFactory.openSession();
		try {
			if(username==null || username.length()==0)
				username = "%";
			else
				username = "%"+username+"%";
			
			List list = session.createQuery("from User where userName like :username")
					.setParameter("username", username)
					.list();
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}		return null;
	}
	@Override
	public List<User> getNewUserPaginate(int page) {
		Session session = sessionFactory.openSession();
		int size_list = 8;
		try {
			List list = session.createQuery("from User ORDER BY id DESC").setFirstResult(size_list*(page-1)).setMaxResults(8).list();
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return null;
	}
	@Override
	public List<Integer> numberPage() {
		int size_list = getAllUser().size();
		int number_page = size_list/8+(size_list%8!=0?1:0);
		 List<Integer> list_page = new ArrayList();
		 for (int i = 1; i <= number_page; i++) {
			 	list_page.add(i);
		}
		return list_page;
	}	
	
}
