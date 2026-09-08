package vn.iotstar.dao.impl;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.TypedQuery;
import vn.iotstar.config.JPAConfig;
import vn.iotstar.dao.UserDao;
import vn.iotstar.entity.User;
import java.util.List;


public class UserDaoImpl implements UserDao {

    private boolean checkExist(String field, String value) {
        EntityManager em = JPAConfig.getEntityManager();
        try {
            String jpql = "SELECT COUNT(u) FROM User u WHERE u." + field + " = :value";
            return em.createQuery(jpql, Long.class)
                    .setParameter("value", value)
                    .getSingleResult() > 0;
        } finally {
            em.close();
        }
    }

    @Override
    public User get(String username) {
        EntityManager em = JPAConfig.getEntityManager();
        try {
            TypedQuery<User> query = em.createQuery("SELECT u FROM User u WHERE u.userName = :userName", User.class);
            query.setParameter("userName", username);
            List<User> list = query.getResultList();
            if (list != null && !list.isEmpty()) {
                return list.get(0);
            }
            return null;
        } finally {
            em.close();
        }
    }

    @Override
    public void insert(User user) {
        EntityManager em = JPAConfig.getEntityManager();
        EntityTransaction trans = em.getTransaction();
        try {
            trans.begin();
            em.persist(user);
            trans.commit();
        } catch (Exception e) {
            if (trans.isActive()) trans.rollback();
            e.printStackTrace();
        } finally {
            em.close();
        }
    }
    @Override
    public void update(User user) {
        EntityManager em = JPAConfig.getEntityManager();
        try {
            em.getTransaction().begin();
            em.merge(user);
            em.getTransaction().commit();
        } catch (Exception e) {
            if (em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
            e.printStackTrace();
        } finally {
            em.close();
        }
    }

    @Override
    public boolean checkExistEmail(String email) {
        return checkExist("email", email);
    }

    @Override
    public boolean checkExistUsername(String username) {
        return checkExist("userName", username);
    }

    @Override
    public boolean checkExistPhone(String phone) {
        return checkExist("phone", phone);
    }

    @Override
    public User getByEmail(String email) {
        EntityManager em = JPAConfig.getEntityManager();
        try {
            TypedQuery<User> query = em.createQuery("SELECT u FROM User u WHERE u.email = :email", User.class);
            query.setParameter("email", email);
            return query.getResultStream().findFirst().orElse(null);
        } finally {
            em.close();
        }
    }

    @Override
    public void updateProfile(int userId, String fullName, String phone, String avatarName) {
        EntityManager em = JPAConfig.getEntityManager();
        EntityTransaction trans = em.getTransaction();
        try {
            trans.begin();
            User user = em.find(User.class, userId);
            if (user != null) {
                user.setFullName(fullName);
                user.setPhone(phone);
                if (avatarName != null) {
                    user.setAvatar(avatarName);
                }
                em.merge(user);
            }
            trans.commit();
        } catch (Exception e) {
            if (trans.isActive()) {
                trans.rollback();
            }
            e.printStackTrace();
        } finally {
            em.close();
        }
    }
}