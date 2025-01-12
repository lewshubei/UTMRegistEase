package com.example.controller;

import com.example.entity.Timetable;
import com.example.entity.Course;
import com.example.DBService.TimetableService;
import com.example.DBService.CourseService;

import java.util.List;

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
        return "student/addCourse";
    }
    
 // 3. Save a new timetable
//    @PostMapping("/addCourse")
//    public String saveCourse(@ModelAttribute("course") Course course) {
//        courseService.saveCourse(course);
//        return "redirect:/student/viewRegisteredCourse";
//    }
    @PostMapping("/addCourse")
    public String saveCourse(@ModelAttribute("course") Course course) {
        courseService.saveCourse(course);
        return "redirect:/student/viewRegisteredCourse";
    }
    
 // Display the timetable
    @GetMapping("/viewRegisteredCourse")
    public String listRegistredCourse(Model model) {
        model.addAttribute("courses", courseService.getAllCourses());
        return "student/viewRegisteredCourse";
    }
   
    @GetMapping("/deleteCourse")
    public String deleteCourse(@RequestParam("id") int id) {
        courseService.deleteCourse(id); // Delete the course using the service
        return "redirect:/student/viewRegisteredCourse"; // Redirect back to the course view
    }
   
 // 8. Search timetables
    @GetMapping("/search")
    public String searchTimetables(@RequestParam("searchQuery") String query, Model model) {
    	List<Timetable> searchResults = timetableService.searchTimetables(query);
    	model.addAttribute("timetables", searchResults);
        model.addAttribute("searchQuery", query);
        return "student/searchTimetable"; // Reuse the list view to show search results
    }
    
    @GetMapping("/searchCourse")
    public String searchCourse(@RequestParam("searchQuery") String query, Model model) {
    	List<Timetable> searchResults = timetableService.searchTimetables(query);
    	model.addAttribute("timetables", searchResults);
        model.addAttribute("searchQuery", query);
        return "student/searchCourse"; // Reuse the list view to show search results
    }
    
    
    @GetMapping("/submittedCourse")
    public String listSubmittedCourse(Model model) {
        model.addAttribute("courses", courseService.getAllCourses());
        return "student/submittedCourse";
    }

    @PostMapping("/submittedCourse")
    public String submitCourses(Model model) {
        // Logic to handle course submission
        return "redirect:/student/submittedCourse";
    }


    
    
}
