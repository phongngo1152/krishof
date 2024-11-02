package load_product.Impl;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import load_product.Dao.ProductDao;
import load_product.entity.Product;
@Repository
public class ProductImpl implements ProductDao {
	@Autowired
	private SessionFactory sessionFactory;
	@Override
	public List<Product> getProducts() {
		Session session = sessionFactory.openSession();
		try {
			List list = session.createQuery("from Product").list();
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return null;
	}
	@Override
	public Product getProduct(int proId) {
		// TODO Auto-generated method stub
				Session session = sessionFactory.openSession();
				try {
					Product product = session.get(Product.class, proId);
					return product;
				} catch (Exception e) {
					e.printStackTrace();
					session.getTransaction().rollback();
				}finally {
					session.close();
				}
				return null;
	}
	@Override
	public boolean insertPruduct(Product product) {
		Session session = sessionFactory.openSession();
		try {
			session.beginTransaction();
			session.save(product);
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
	public boolean updatePruduct(Product product) {
		Session session = sessionFactory.openSession();
		try {
			session.beginTransaction();
			session.update(product);
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
	public boolean deletePruduct(int proId) {
		Session session = sessionFactory.openSession();
		try {
			session.beginTransaction();
			session.delete(getProduct(proId));
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
	public List<Product> getProductsbycategorize(int cateorize_id) {
		Session session = sessionFactory.openSession();
		try {
			List list = session.createQuery("from Product where categorize_id = :categorize_id").setParameter("categorize_id", cateorize_id).list();
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
	public List<Product> getProductByName(String productName) {
		Session session = sessionFactory.openSession();
		try {
			if(productName==null || productName.length()==0)
				productName = "%";
			else
				productName = "%"+productName+"%";
			
			List list = session.createQuery("from Product where name_product like :productName")
					.setParameter("productName", productName)
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
	public List<Product> getNewProducts() {
		Session session = sessionFactory.openSession();
		try {
			List list = session.createQuery("from Product ORDER BY id DESC").setMaxResults(4).list();
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return null;
	}
	@Override
	public List<Product> getNewProductsTop() {
		Session session = sessionFactory.openSession();
		try {
			List list = session.createQuery("from Product ORDER BY id DESC").setMaxResults(8).list();
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return null;
	}
	@Override
	public List<Product> getNewProductsPaginate(int page) {
		Session session = sessionFactory.openSession();
		int size_list = 8;
		try {
			List list = session.createQuery("from Product ORDER BY id DESC").setFirstResult(size_list*(page-1)).setMaxResults(8).list();
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
		int size_list = getProducts().size();
		int number_page = size_list/8+(size_list%8!=0?1:0);
		 List<Integer> list_page = new ArrayList();
		 for (int i = 1; i <= number_page; i++) {
			 	list_page.add(i);
		}
		return list_page;
	}

}
