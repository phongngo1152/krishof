package load_product.Impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import load_product.Dao.ProducerDao;
import load_product.entity.Categorize;
import load_product.entity.Producer;
@Repository
public class ProducerImpl implements ProducerDao{
	@Autowired
	private SessionFactory sessionFactory;
	@Override
	public List<Producer> getProducers() {
		Session session = sessionFactory.openSession();
		try {
			List list = session.createQuery("from Producer").list();
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return null;
	}

	@Override
	public boolean insertProducer(Producer producer) {
		Session session = sessionFactory.openSession();
		try {
			session.beginTransaction();
			session.save(producer);
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
	public boolean updateProducer(Producer producer) {
		Session session = sessionFactory.openSession();
		try {
			session.beginTransaction();
			session.update(producer);
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
	public boolean deleteProducer(int id) {
		Session session = sessionFactory.openSession();
		try {
			session.beginTransaction();
			session.delete(getProducer(id));
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
	public Producer getProducer(int id) {
		Session session = sessionFactory.openSession();
		try {
			Producer producer = session.get(Producer.class, id);
			return producer;
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return null;
	}

	@Override
	public List<Producer> getProducerByName(String producerName) {
		Session session = sessionFactory.openSession();
		try {
			if(producerName==null || producerName.length()==0)
				producerName = "%";
			else
				producerName = "%"+producerName+"%";
			
			List list = session.createQuery("from Producer where name_producer like :producerName")
					.setParameter("producerName", producerName)
					.list();
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return null;
	}

	@Override
	public List<Producer> getNewProducersPaginate(int page) {
		Session session = sessionFactory.openSession();
		int size_list = 8;
		try {
			List list = session.createQuery("from Producer ORDER BY id DESC").setFirstResult(size_list*(page-1)).setMaxResults(8).list();
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
		int size_list = getProducers().size();
		int number_page = size_list/8+(size_list%8!=0?1:0);
		 List<Integer> list_page = new ArrayList();
		 for (int i = 1; i <= number_page; i++) {
			 	list_page.add(i);
		}
		return list_page;
	}

}
