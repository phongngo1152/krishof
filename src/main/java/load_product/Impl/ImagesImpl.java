package load_product.Impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import load_product.Dao.ImageDao;
import load_product.entity.Categorize;
import load_product.entity.Images;
import load_product.entity.Product;
@Repository
public class ImagesImpl implements ImageDao{
	@Autowired
	private SessionFactory sessionFactory;
	@Override
	public List<Images> getImage() {
		Session session = sessionFactory.openSession();
		try {
			List list = session.createQuery("from Images").list();
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return null;
	}
	@Override
	public List<Images> getImagebyProId(int proId) {
		Session session = sessionFactory.openSession();
		try {
			List list = session.createQuery("from Images where pro_id = :proid").setParameter("proid", proId).list();
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
	public boolean insertImages(Images images) {
		Session session = sessionFactory.openSession();
		try {
			session.beginTransaction();
			session.save(images);
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
	public boolean updateImages(Images images) {
		Session session = sessionFactory.openSession();
		try {
			session.beginTransaction();
			session.update(images);
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
	public boolean deleteImages(int id) {
		Session session = sessionFactory.openSession();
		try {
			session.beginTransaction();
			session.delete(getImagesByID(id));
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
	public Images getImagesByID(int id) {
		Session session = sessionFactory.openSession();
		try {
			Images images = session.get(Images.class, id);
			return images;
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return null;
	}
	@Override
	public List<Images> getNewImagesPaginate(int page) {
		Session session = sessionFactory.openSession();
		int size_list = 8;
		try {
			List list = session.createQuery("from Images ORDER BY id DESC").setFirstResult(size_list*(page-1)).setMaxResults(8).list();
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
		int size_list = getImage().size();
		int number_page = size_list/8+(size_list%8!=0?1:0);
		 List<Integer> list_page = new ArrayList();
		 for (int i = 1; i <= number_page; i++) {
			 	list_page.add(i);
		}
		return list_page;	
	}

}
