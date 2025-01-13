package com.example.repository;

import com.example.entity.Course;
import com.example.entity.Timetable;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class CourseDao {

    private final SessionFactory sessionFactory;

    @Autowired
    public CourseDao(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
    
   
    // 1. Retrieve all courses
    public List<Course> findAll() {
        try (Session session = sessionFactory.openSession()) {
            return session.createQuery("from Course", Course.class).list();
        }
    }

    // 2. Retrieve a course by ID
    public Course findById(int id) {
        try (Session session = sessionFactory.openSession()) {
            return session.get(Course.class, id);
        }
    }

    // 3. Add a new course
    public void save(Course course) {
        Transaction transaction = null;
        try (Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();
            session.save(course);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            throw e;
        }
    }


 // 5. Delete a course by ID
    public void deleteById(int id) {
        Transaction transaction = null;
        try (Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();
            Course course = session.get(Course.class, id); // Fetch the course
            if (course != null) {
                session.delete(course); // Delete the course
            }
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback(); // Rollback in case of an error
            }
            throw e; // Rethrow the exception
        }
    }

//    public List<Course> searchByProgramCodeOrName(String keyword) {
//        try (Session session = sessionFactory.openSession()) {
//            String query = "from Timetable where lower(program) like :keyword " +
//                           "or lower(code) like :keyword or lower(name) like :keyword";
//            return session.createQuery(query, Course.class)
//                          .setParameter("keyword", "%" + keyword.toLowerCase() + "%")
//                          .list();
//        }
//    }
    
    public List<Timetable> searchByProgramCodeOrName(String keyword) {
    	try (Session session = sessionFactory.openSession()) {
            String query = "from Timetable where lower(program) like :keyword " +
                           "or lower(code) like :keyword or lower(name) like :keyword";
            return session.createQuery(query, Timetable.class)
                          .setParameter("keyword", "%" + keyword.toLowerCase().trim() + "%")
                          .list();
        }
    }
}
