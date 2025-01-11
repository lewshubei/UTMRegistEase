package com.example.DBService;

import com.example.entity.Course;
import com.example.repository.CourseDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CourseService {

    @Autowired
    private CourseDao courseDao;
    
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
        courseDao.save(course);
    }

    // 5. Delete a course by ID
    public void deleteCourse(int id) {
       courseDao.deleteById(id);
    }
    
 
    // 6. Search for courses by program, code, or name
    public List<Course> searchCourses(String keyword) {
        return courseDao.searchByProgramCodeOrName(keyword);
    }
    
   
}
