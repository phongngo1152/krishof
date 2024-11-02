package load_product.Impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import load_product.Dao.CategorizeDao;
import load_product.entity.Categorize;
import load_product.entity.Category;
@Repository
public class CategorizeImpl implements CategorizeDao{
	@Autowired
	private SessionFactory sessionFactory;
	@Override
	public List<Categorize> getCategorizes() {
		Session session = sessionFactory.openSession();
		try {
			List list = session.createQuery("from Categorize").list();
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return null;
	}

	@Override
	public boolean insertCategorizes(Categorize categorize) {
		Session session = sessionFactory.openSession();
		try {
			session.beginTransaction();
			session.save(categorize);
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
	public boolean updateCategorizes(Categorize categorize) {
		Session session = sessionFactory.openSession();
		try {
			session.beginTransaction();
			session.update(categorize);
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
	public boolean deleteCategorizes(int id) {
		Session session = sessionFactory.openSession();
		try {
			session.beginTransaction();
			session.delete(getCategorize(id));
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
	public Categorize getCategorize(int id) {
		Session session = sessionFactory.openSession();
		try {
			Categorize categorize = session.get(Categorize.class, id);
			return categorize;
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return null;
	}

	@Override
	public List<Categorize> getCategorizeByName(String categorizeName) {
		Session session = sessionFactory.openSession();
		try {
			if(categorizeName==null || categorizeName.length()==0)
				categorizeName = "%";
			else
				categorizeName = "%"+categorizeName+"%";
			
			List list = session.createQuery("from Categorize where categorize like :categorizeName")
					.setParameter("categorizeName", categorizeName)
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
	public List<Categorize> getNewCategorizePaginate(int page) {
		Session session = sessionFactory.openSession();
		int size_list = 8;
		try {
			List list = session.createQuery("from Categorize ORDER BY id DESC").setFirstResult(size_list*(page-1)).setMaxResults(8).list();
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
		int size_list = getCategorizes().size();
		int number_page = size_list/8+(size_list%8!=0?1:0);
		 List<Integer> list_page = new ArrayList();
		 for (int i = 1; i <= number_page; i++) {
			 	list_page.add(i);
		}
		return list_page;	
	}

}
