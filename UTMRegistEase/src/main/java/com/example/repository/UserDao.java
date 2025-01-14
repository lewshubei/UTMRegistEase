package com.example.repository;

import com.example.entity.User;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.hibernate.query.Query;
import org.springframework.transaction.annotation.Transactional;

@Repository
public class UserDao {
	@Autowired
    private SessionFactory sessionFactory;

    @Transactional
    public void save(User user) {
        Session session = sessionFactory.getCurrentSession();
        session.saveOrUpdate(user);
    }

    @Transactional
    public User findByUsername(String username) {
        Session session = sessionFactory.getCurrentSession();
        return session.get(User.class, username);
    }
    
    public User findByUsernameForSlip(String username) {
        try (Session session = sessionFactory.openSession()) {
            String hql = "from User where username = :username";
            Query<User> query = session.createQuery(hql, User.class);
            query.setParameter("username", username);
            return query.uniqueResult();
        }
    }
    
    public String findAcademicNameByUsername(String username) {
        try (Session session = sessionFactory.openSession()) {
            String hql = "SELECT u.academicName FROM User u WHERE u.username = :username";
            return session.createQuery(hql, String.class)
                          .setParameter("username", username)
                          .uniqueResult();
        }
    }
    
    public User findUserByUsername(String username) {
        try (Session session = sessionFactory.openSession()) {
            String hql = "FROM User WHERE username = :username";
            return session.createQuery(hql, User.class)
                          .setParameter("username", username)
                          .uniqueResult();
        }
    }
    
    public User findUserByStudentId(String studentId) {
        try (Session session = sessionFactory.openSession()) {
            String hql = "FROM User WHERE studentId = :studentId";
            return session.createQuery(hql, User.class)
                          .setParameter("studentId", studentId)
                          .uniqueResult();
        }
    }
}
