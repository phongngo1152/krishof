package load_product.Impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import load_product.Dao.StatusTypeDao;
import load_product.entity.StatusType;

@Repository
public class StatusTypeImpl implements StatusTypeDao{
	@Autowired
    private SessionFactory sessionFactory;

	 @Override
	    public List<StatusType> getStatusTypes() {
	        Session session = sessionFactory.openSession();
	        try {
	            List<StatusType> list = session.createQuery("from StatusType", StatusType.class).list();
	            return list;
	        } catch (Exception e) {
	            e.printStackTrace();
	        } finally {
	            session.close();
	        }
	        return null;
	    }

	    @Override
	    public boolean insertStatusType(StatusType statusType) {
	        Session session = sessionFactory.openSession();
	        try {
	            session.beginTransaction();
	            session.save(statusType);
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
	    public boolean updateStatusType(StatusType statusType) {
	        Session session = sessionFactory.openSession();
	        try {
	            session.beginTransaction();
	            session.update(statusType);
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
	    public StatusType getStatusType(int id) {
	        Session session = sessionFactory.openSession();
	        try {
	            StatusType statusType = session.get(StatusType.class, id);
	            return statusType;
	        } catch (Exception e) {
	            e.printStackTrace();
	        } finally {
	            session.close();
	        }
	        return null;
	    }
}
