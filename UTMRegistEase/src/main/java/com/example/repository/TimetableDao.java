package com.example.repository;

import com.example.entity.Timetable;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class TimetableDao {

    private final SessionFactory sessionFactory;

    @Autowired
    public TimetableDao(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    // 1. Retrieve all timetables
    public List<Timetable> findAll() {
        try (Session session = sessionFactory.openSession()) {
            return session.createQuery("from Timetable", Timetable.class).list();
        }
    }

    // 2. Retrieve a timetable by ID
    public Timetable findById(int id) {
        try (Session session = sessionFactory.openSession()) {
            return session.get(Timetable.class, id);
        }
    }

    // 3. Create a new timetable
    public void save(Timetable timetable) {
        Transaction transaction = null;
        try (Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();
            session.save(timetable);
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            throw e;
        }
    }

 // 4. Update an existing timetable
    public void update(Timetable timetable) {
        Transaction transaction = null;
        try (Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();

            // Perform the update using HQL
            Query query = session.createQuery(
                "UPDATE Timetable SET program = :program, code = :code, name = :name, " +
                "section = :section, day1 = :day1, time1 = :time1, venue1 = :venue1, " +
                "day2 = :day2, time2 = :time2, venue2 = :venue2, credit = :credit " +
                "WHERE id = :id"
            );
            query.setParameter("program", timetable.getProgram());
            query.setParameter("code", timetable.getCode());
            query.setParameter("name", timetable.getName());
            query.setParameter("section", timetable.getSection());
            query.setParameter("day1", timetable.getDay1());
            query.setParameter("time1", timetable.getTime1());
            query.setParameter("venue1", timetable.getVenue1());
            query.setParameter("day2", timetable.getDay2());
            query.setParameter("time2", timetable.getTime2());
            query.setParameter("venue2", timetable.getVenue2());
            query.setParameter("credit", timetable.getCredit());
            query.setParameter("id", timetable.getId());

            int rowsUpdated = query.executeUpdate();
            if (rowsUpdated == 0) {
                throw new RuntimeException("Timetable not found with ID: " + timetable.getId());
            }

            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            throw e;
        }
    }

    // 5. Delete a timetable by ID
    public void deleteById(int id) {
        Transaction transaction = null;
        try (Session session = sessionFactory.openSession()) {
            transaction = session.beginTransaction();
            Timetable timetable = session.get(Timetable.class, id);
            if (timetable != null) {
                session.delete(timetable);
            }
            transaction.commit();
        } catch (Exception e) {
            if (transaction != null) {
                transaction.rollback();
            }
            throw e;
        }
    }

    // Additional method: Search by program, code, or name
    public List<Timetable> searchByProgramCodeOrName(String keyword) {
        try (Session session = sessionFactory.openSession()) {
            String query = "from Timetable where lower(program) like :keyword " +
                           "or lower(code) like :keyword or lower(name) like :keyword " +
                           "or cast(credit as string) like :keyword";
            return session.createQuery(query, Timetable.class)
                          .setParameter("keyword", "%" + keyword.toLowerCase().trim() + "%")
                          .list();
        }
    }
}
