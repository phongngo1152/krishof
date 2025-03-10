package load_product.Impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import load_product.Dao.FavoriteDao;
import load_product.entity.Favorite;

@Repository
public class FavoriteImpl implements FavoriteDao {

    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public List<Favorite> getFavorites() {
        Session session = sessionFactory.openSession();
        try {
            List<Favorite> list = session.createQuery("from Favorite", Favorite.class).list();
            return list;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return null;
    }

    @Override
    public boolean insertFavorite(Favorite favorite) {
        Session session = sessionFactory.openSession();
        try {
            session.beginTransaction();
            session.save(favorite);
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
    public boolean updateFavorite(Favorite favorite) {
        Session session = sessionFactory.openSession();
        try {
            session.beginTransaction();
            session.update(favorite);
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
    public Favorite getFavorite(int id) {
        Session session = sessionFactory.openSession();
        try {
            Favorite favorite = session.get(Favorite.class, id);
            return favorite;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return null;
    }

    @Override
    public List<Favorite> getFavoritesByUser(Long userId) {
        Session session = sessionFactory.openSession();
        try {
            List<Favorite> list = session.createQuery("from Favorite f where f.user.id = :userId", Favorite.class)
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
    public boolean deleteFavorite(int id) {
        Session session = sessionFactory.openSession();
        try {
            session.beginTransaction();
            Favorite favorite = session.get(Favorite.class, id);
            if (favorite != null) {
                session.delete(favorite);
                session.getTransaction().commit();
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
            session.getTransaction().rollback();
        } finally {
            session.close();
        }
        return false;
    }
    @Override
    public List<Favorite> getFavoritesByUserName(String userName) {
        Session session = sessionFactory.openSession();
        try {
            List<Favorite> list = session.createQuery("from Favorite f where f.user.userName = :userName", Favorite.class)
                                        .setParameter("userName", userName)
                                        .list();
            return list;
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return null;
        }
}
