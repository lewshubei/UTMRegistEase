package com.example.DBService;

import com.example.entity.Course;
import com.example.entity.Timetable;
import com.example.repository.CourseDao;
import com.example.repository.TimetableDao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CourseService {

    @Autowired
    private CourseDao courseDao;
    
    @Autowired
    private TimetableDao timetableDao;
    
    @Autowired
    public CourseService(CourseDao courseDao) {
        this.courseDao = courseDao;
    }

    // 1. Get all courses
    public List<Course> getAllCourses() {
        return courseDao.findAll();
    }

    // 2. Get a course by ID
    public Course getCourseById(int id) {
        return courseDao.findById(id);
    }

    // 3. Save a new course
    public void saveCourse(Course course) {
    	String username = SecurityContextHolder.getContext().getAuthentication().getName();
    	course.setUsername(username);
    	courseDao.save(course);
    }

    // 5. Delete a course by ID
    public void deleteCourse(int id) {
       courseDao.deleteById(id);
    }
    
 
    // 6. Search for courses by program, code, or name
//    public List<Course> searchCourses(String keyword) {
//        return courseDao.searchByProgramCodeOrName(keyword);
//    }
    
    public List<Timetable> searchTimetables(String keyword) {
        return timetableDao.searchByProgramCodeOrName(keyword);
    }
    
    public void submitAllCourses(List<Course> courses) {
        for (Course course : courses) {
            course.setSubmitted(true); // Mark as submitted
            courseDao.save(course); // Save the updated course
        }
    }
    
  

   
}
