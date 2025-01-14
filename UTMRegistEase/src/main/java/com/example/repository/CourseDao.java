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

	// 1. Retrieve all courses for a specific user
	public List<Course> findAllByUsername(String username) {
		try (Session session = sessionFactory.openSession()) {
			String hql = "from Course where username = :username";
			Query<Course> query = session.createQuery(hql, Course.class);
			query.setParameter("username", username);
			return query.list();
		}
	}

	// 2. Retrieve a course by ID and username
	public Course findByIdAndUsername(int id, String username) {
		try (Session session = sessionFactory.openSession()) {
			String hql = "from Course where id = :id and username = :username";
			Query<Course> query = session.createQuery(hql, Course.class);
			query.setParameter("id", id);
			query.setParameter("username", username);
			return query.uniqueResult();
		}
	}

	// 3. Retrieve all courses
	public List<Course> findAll() {
		try (Session session = sessionFactory.openSession()) {
			return session.createQuery("from Course", Course.class).list();
		}
	}

	// 4. Retrieve a course by ID
	public Course findById(int id) {
		try (Session session = sessionFactory.openSession()) {
			return session.get(Course.class, id);
		}
	}

	// 5. Add or update a course
	public void save(Course course) {
		Transaction transaction = null;
		try (Session session = sessionFactory.openSession()) {
			transaction = session.beginTransaction();
			session.saveOrUpdate(course); // Save or update the course
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			throw e;
		}
	}

	// 6. Delete a course by ID and username
	public void deleteByIdAndUsername(int id, String username) {
		Transaction transaction = null;
		try (Session session = sessionFactory.openSession()) {
			transaction = session.beginTransaction();
			String hql = "delete from Course where id = :id and username = :username";
			Query<?> query = session.createQuery(hql);
			query.setParameter("id", id);
			query.setParameter("username", username);
			int result = query.executeUpdate();
			if (result == 0) {
				throw new IllegalStateException("No course found with the specified ID and username.");
			}
			transaction.commit();
		} catch (Exception e) {
			if (transaction != null) {
				transaction.rollback();
			}
			throw e;
		}
	}

	// 7. Search courses or timetables by program, code, or name
	public List<Timetable> searchByProgramCodeOrName(String keyword) {
		try (Session session = sessionFactory.openSession()) {
			String hql = "from Timetable where lower(program) like :keyword "
					+ "or lower(code) like :keyword or lower(name) like :keyword";
			return session.createQuery(hql, Timetable.class)
					.setParameter("keyword", "%" + keyword.toLowerCase().trim() + "%").list();
		}
	}

	// 8. Retrieve courses by semester and username
	public List<Course> findCoursesBySemesterAndUsername(String semester, String username) {
	    try (Session session = sessionFactory.openSession()) {
	        String hql = "from Course where semester = :semester and username = :username";
	        Query<Course> query = session.createQuery(hql, Course.class);
	        query.setParameter("semester", semester);
	        query.setParameter("username", username);
	        return query.list();
	    }
	}
	
	public List<Course> findCoursesByUsernameAndAA(String academicName) {
	    try (Session session = sessionFactory.openSession()) {
	        System.out.println("Query academicName: " + academicName);

	        String hql = "FROM Course WHERE lower(aa) LIKE lower(:aaValue)";
	        List<Course> courses = session.createQuery(hql, Course.class)
	                                      .setParameter("aaValue", "%" + academicName + "%") // 模糊匹配
	                                      .list();
	        System.out.println("Query result: " + courses);
	        return courses;
	    }
	}
	
	public List<Course> findSlipByUsername(String username) {
	    try (Session session = sessionFactory.openSession()) {
	        String hql = "FROM Course WHERE username = :username";
	        Query<Course> query = session.createQuery(hql, Course.class);
	        query.setParameter("username", username);
	        return query.list();
	    }
	}

}
