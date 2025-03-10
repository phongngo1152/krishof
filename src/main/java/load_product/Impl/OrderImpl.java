package load_product.Impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import load_product.Dao.OrderDao;
import load_product.entity.Orders;
import load_product.entity.Producer;
@Repository
public class OrderImpl implements OrderDao{
	@Autowired
	private SessionFactory sessionFactory;
	@Override
	public List<Orders> getOrders() {
		Session session = sessionFactory.openSession();
		try {
			List list = session.createQuery("from Orders").list();
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return null;
	}

	@Override
	public boolean insertOrders(Orders order) {
		Session session = sessionFactory.openSession();
		try {
			session.beginTransaction();
			session.save(order);
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
	public boolean updateOrder(Orders order) {
		Session session = sessionFactory.openSession();
		try {
			session.beginTransaction();
			session.update(order);
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
	public List<Orders> getNewOrderPaginate(int page) {
		Session session = sessionFactory.openSession();
		int size_list = 8;
		try {
			List list = session.createQuery("from Orders ORDER BY id DESC").setFirstResult(size_list*(page-1)).setMaxResults(8).list();
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
		int size_list = getOrders().size();
		int number_page = size_list/8+(size_list%8!=0?1:0);
		 List<Integer> list_page = new ArrayList();
		 for (int i = 1; i <= number_page; i++) {
			 	list_page.add(i);
		}
		return list_page;
	}

	@Override
	public Orders getOrders(int id) {
		Session session = sessionFactory.openSession();
		try {
			Orders orders = session.get(Orders.class, id);
			return orders;
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return null;
	}

	@Override
	public List<Orders> getOrdersByUser(Long id,int page) {
		
		
		
		Session session = sessionFactory.openSession();
		int size_list = 8;
		try {
			List list = session.createQuery("from Orders where users_id =: id ORDER BY id DESC").setParameter("id", id).setFirstResult(size_list*(page-1)).setMaxResults(8).list();
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return null;
		
		
	}
	public List<Orders> getOrdersByUserId(Long userId) {
	    Session session = sessionFactory.openSession();
	    try {
	        String hql = "FROM Orders WHERE users_id = :userId";
	        List<Orders> list = session.createQuery(hql, Orders.class)
	                                   .setParameter("userId", userId)
	                                   .list();
	        return list;
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        session.close();
	    }
	    return null;
	}
  
	@Override
	public List<Integer> numberPageUser(Long id) {
		int size_list = getOrdersByUserId(id).size();
		int number_page = size_list/8+(size_list%8!=0?1:0);
		 List<Integer> list_page = new ArrayList();
		 for (int i = 1; i <= number_page; i++) {
			 	list_page.add(i);
		}
		return list_page;
	}

}
