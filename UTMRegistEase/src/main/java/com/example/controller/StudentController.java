package com.example.controller;

import com.example.entity.Timetable;
import com.example.entity.Course;
import com.example.DBService.TimetableService;
import com.example.DBService.CourseService;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/student")
public class StudentController {

    @Autowired
    private TimetableService timetableService;
    
    @Autowired
    private CourseService courseService;

    // Display the timetable
    @GetMapping("/viewTimetable")
    public String listTimetables(Model model) {
        model.addAttribute("timetables", timetableService.getAllTimetables());
        return "student/timetable";
    }

    // Handle course addition form
    @GetMapping("/addCourse")
    public String addCourseForm(Model model) {
        model.addAttribute("timetables", timetableService.getAllTimetables());
        model.addAttribute("course", new Course()); // Add an empty course object for the form
        return "student/addCourse";
    }

    // Save a new course for the logged-in user
    @PostMapping("/addCourse")
    public String saveCourse(@ModelAttribute("course") Course course) {
        course.setApproval_status("PENDING");
        course.setSemester("2025-1");
        courseService.saveCourse(course);
        return "redirect:/student/viewRegisteredCourse";
    }

    // Display the registered courses for the logged-in user
    @GetMapping("/viewRegisteredCourse")
    public String listRegisteredCourses(Model model) {
        model.addAttribute("courses", courseService.getAllCoursesForCurrentUser());
        return "student/viewRegisteredCourse";
    }

    // Delete a course for the logged-in user
    @GetMapping("/deleteCourse")
    public String deleteCourse(@RequestParam("id") int id) {
        courseService.deleteCourseForCurrentUser(id); // Delete the course only if it belongs to the current user
        return "redirect:/student/viewRegisteredCourse";
    }

    // Search timetables
    @GetMapping("/search")
    public String searchTimetables(@RequestParam("searchQuery") String query, Model model) {
        List<Timetable> searchResults = timetableService.searchTimetables(query);
        model.addAttribute("timetables", searchResults);
        model.addAttribute("searchQuery", query);
        return "student/searchTimetable";
    }

    // Search courses
    @GetMapping("/searchCourse")
    public String searchCourse(@RequestParam("searchQuery") String query, Model model) {
        List<Timetable> searchResults = timetableService.searchTimetables(query);
        model.addAttribute("timetables", searchResults);
        model.addAttribute("searchQuery", query);
        return "student/searchCourse";
    }

 // Display submitted courses for the logged-in user
    @GetMapping("/submittedCourse")
    public String listSubmittedCourses(Model model, HttpSession session) {
        // Check if courses are already submitted
        Boolean coursesSubmitted = (Boolean) session.getAttribute("coursesSubmitted");

        if (coursesSubmitted != null && coursesSubmitted) {
            // If courses are submitted, show the submitted courses
            model.addAttribute("courses", courseService.getAllCoursesForCurrentUser());
            return "student/submittedCourse";
        } else {
            // If not submitted, redirect to registered courses page
            return "redirect:/student/viewRegisteredCourse"; // Or a page where courses can still be selected
        }
    }

    // Submit all courses for the logged-in user
    @PostMapping("/submittedCourse")
    public String submitCourses(HttpSession session) {
        // Mark all courses as submitted for the current user
        courseService.submitAllCoursesForCurrentUser();

        // Set session attribute to track that courses have been submitted
        session.setAttribute("coursesSubmitted", true);

        // Redirect to the submitted courses page
        return "redirect:/student/submittedCourse";
    }

}
