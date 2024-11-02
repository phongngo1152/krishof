package load_product.Impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import load_product.Dao.OrderDetailDao;
import load_product.entity.OrderDetail;
import load_product.entity.Producer;
@Repository
public class OrderdetailImpl implements OrderDetailDao{
	@Autowired
	private SessionFactory sessionFactory;
	@Override
	public List<OrderDetail> getOrderDetails() {
		Session session = sessionFactory.openSession();
		try {
			List list = session.createQuery("from OrderDetail").list();
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return null;
	}

	@Override
	public boolean insertOrderDetails(OrderDetail orderDetail) {
		Session session = sessionFactory.openSession();
		try {
			session.beginTransaction();
			session.save(orderDetail);
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
	public boolean updateOrderDetail(OrderDetail orderDetail) {
		Session session = sessionFactory.openSession();
		try {
			session.beginTransaction();
			session.update(orderDetail);
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
	public OrderDetail getOrderDetail(int id) {
		Session session = sessionFactory.openSession();
		try {
			OrderDetail detail = session.get(OrderDetail.class, id);
			return detail;
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return null;
	}

	@Override
	public List<OrderDetail> getOrderDetailsByOrderId(int order_id) {
		Session session = sessionFactory.openSession();
		try {
			List list = session.createQuery("from OrderDetail where order_id = :order_id").setParameter("order_id", order_id).list();
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			session.getTransaction().rollback();
		}finally {
			session.close();
		}
		return null;
	}

	@Override
	public float totalDetail(int order_id) {
		List<OrderDetail> list = getOrderDetailsByOrderId(order_id);
		float tt=0;
		for (OrderDetail orderDetail : list) {
			tt+=orderDetail.getTotalprice();
		}
		return tt;
	}

}
