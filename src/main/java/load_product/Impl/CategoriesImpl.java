package load_product.Impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import load_product.Dao.CategoryDao;
import load_product.entity.Categorize;
import load_product.entity.Category;
@Repository
public class CategoriesImpl implements CategoryDao{
	@Autowired
	private SessionFactory sessionFactory;
	@Override
	public List<Category> getCategories() {
		Session session = sessionFactory.openSession();
		try {
			List list = session.createQuery("from Category").list();
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return null;
	}

	@Override
	public boolean insertCategories(Category category) {
		Session session = sessionFactory.openSession();
		try {
			session.beginTransaction();
			session.save(category);
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
	public boolean updateCategories(Category category) {
		Session session = sessionFactory.openSession();
		try {
			session.beginTransaction();
			session.update(category);
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
	public boolean deleteCategories(int id) {
		Session session = sessionFactory.openSession();
		try {
			session.beginTransaction();
			session.delete(getCategory(id));
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
	public Category getCategory(int id) {
		Session session = sessionFactory.openSession();
		try {
			Category category = session.get(Category.class, id);
			return category;
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return null;
	}

	@Override
	public List<Category> getCategoryByName(String categoryName) {
		Session session = sessionFactory.openSession();
		try {
			if(categoryName==null || categoryName.length()==0)
				categoryName = "%";
			else
				categoryName = "%"+categoryName+"%";
			
			List list = session.createQuery("from Category where name_cat like :categoryName")
					.setParameter("categoryName", categoryName)
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
	public List<Category> getNewCategoryPaginate(int page) {
		Session session = sessionFactory.openSession();
		int size_list = 8;
		try {
			List list = session.createQuery("from Category ORDER BY id DESC").setFirstResult(size_list*(page-1)).setMaxResults(8).list();
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
		int size_list = getCategories().size();
		int number_page = size_list/8+(size_list%8!=0?1:0);
		 List<Integer> list_page = new ArrayList();
		 for (int i = 1; i <= number_page; i++) {
			 	list_page.add(i);
		}
		return list_page;
	}

}
