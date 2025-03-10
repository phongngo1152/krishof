package load_product.Impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import load_product.Dao.OrderStatusDao;
import load_product.entity.OrderStatus;
import load_product.entity.Orders;
@Repository
public class OrderStatusImpl implements OrderStatusDao{
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<OrderStatus> getOrderStatuses() {
		  Session session = sessionFactory.openSession();
	        try {
	            List<OrderStatus> list = session.createQuery("from OrderStatus", OrderStatus.class).list();
	            return list;
	        } catch (Exception e) {
	            e.printStackTrace();
	        } finally {
	            session.close();
	        }
	        return null;	}

	@Override
	public boolean insertOrderStatus(OrderStatus orderStatus) {
		 Session session = sessionFactory.openSession();
	        try {
	            session.beginTransaction();
	            session.save(orderStatus);
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
	public boolean updateOrderStatus(OrderStatus orderStatus) {
		 Session session = sessionFactory.openSession();
	        try {
	            session.beginTransaction();
	            session.update(orderStatus);
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
	public OrderStatus getOrderStatus(int id) {
		// TODO Auto-generated method stub
		Session session = sessionFactory.openSession();
        try {
            OrderStatus orderStatus = session.get(OrderStatus.class, id);
            return orderStatus;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return null;
	}

	@Override
	public OrderStatus getOrderStatusbyOrder(int order_id) {
		Session session = sessionFactory.openSession();
		try {
			OrderStatus orderStatus = (OrderStatus) session.createQuery("from OrderStatus where order_id = :order_id").setParameter("order_id", order_id).uniqueResult() ;
			return orderStatus;
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return null;
	}

}
