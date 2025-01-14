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

    private final CourseDao courseDao;
    private final TimetableDao timetableDao;

    @Autowired
    public CourseService(CourseDao courseDao, TimetableDao timetableDao) {
        this.courseDao = courseDao;
        this.timetableDao = timetableDao;
    }

    // 1. Get all courses for the current user
    public List<Course> getAllCoursesForCurrentUser() {
        String username = SecurityContextHolder.getContext().getAuthentication().getName();
        return courseDao.findAllByUsername(username);
    }

    // 2. Get a specific course by ID for the current user
    public Course getCourseByIdForCurrentUser(int id) {
        String username = SecurityContextHolder.getContext().getAuthentication().getName();
        return courseDao.findByIdAndUsername(id, username);
    }

    // 3. Save a new course for the current user
    public void saveCourse(Course course) {
        String username = SecurityContextHolder.getContext().getAuthentication().getName();
        course.setUsername(username); // Associate the course with the current user
        courseDao.save(course);
    }

    // 4. Delete a course by ID for the current user
    public void deleteCourseForCurrentUser(int id) {
        String username = SecurityContextHolder.getContext().getAuthentication().getName();
        courseDao.deleteByIdAndUsername(id, username);
    }

    // 5. Search for timetables
    public List<Timetable> searchTimetables(String keyword) {
        return timetableDao.searchByProgramCodeOrName(keyword);
    }

    // 6. Submit all courses for the current user
    public void submitAllCoursesForCurrentUser() {
        String username = SecurityContextHolder.getContext().getAuthentication().getName();
        List<Course> userCourses = courseDao.findAllByUsername(username);
        for (Course course : userCourses) {
            course.setSubmitted(true); // Mark the course as submitted
            courseDao.save(course);    // Save the updated course
        }
    }
    
    
}
