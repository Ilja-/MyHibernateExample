package impl;

import model.User;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import util.HibernateUtil;

public class UserDAOImpl implements UserDAO {
    @Override
    public void addUser(User user) {
        Session session = null;
        try {
            session = HibernateUtil.getSessionFactory().openSession();
            session.beginTransaction();
            session.save(user);
            session.getTransaction().commit();
        } catch (HibernateException e) {
            System.out.println(e.getMessage());
            System.out.println("ERROR");
        } finally {
            if (session != null && session.isOpen()) {
                session.close();
            }
        }
    }
}
