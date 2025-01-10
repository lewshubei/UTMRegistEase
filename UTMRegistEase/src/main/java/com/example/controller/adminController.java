package com.example.controller;

import com.example.entity.Timetable;
import com.example.DBService.TimetableService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/admin")
public class adminController {
	
	

    @Autowired
    private TimetableService timetableService;

    // 1. List all timetables
    @GetMapping("/viewTimetable")
    public String listTimetables(Model model) {
        model.addAttribute("timetables", timetableService.getAllTimetables());
        
        return "admin/timetable"; // View to display list of timetables
    }

    // 2. Show form to add a new timetable
    @GetMapping("/addTimetable")
    public String showAddForm(Model model) {
        model.addAttribute("timetable", new Timetable());
        return "admin/addTimetable"; // View for adding a timetable
    }

    // 3. Save a new timetable
    @PostMapping("/addTimetable")
    public String saveTimetable(@ModelAttribute("timetable") Timetable timetable) {
        timetableService.saveTimetable(timetable);
        return "redirect:/admin/viewTimetable";
    }

    // 4. Show form to update an existing timetable
    @GetMapping("/editTimetable")
    public String showEditForm(Model model) {
    	model.addAttribute("timetables", timetableService.getAllTimetables());
        return "admin/editTimetable"; // View for editing a timetable
    }
    
    @GetMapping("/updateCourse")
    public String showUpdateCourseForm(@RequestParam("index") int index, Model model) {
        // Get the timetable entry by index and add it to the model
        Timetable timetable = timetableService.getTimetableById(index);
        model.addAttribute("timetable", timetable);
        model.addAttribute("index", index);
        return "updateCourse";  // Return the view name (JSP)
    }
    // 5. Update timetable
    @PostMapping("/updateCourse")
    public String updateTimetable(@RequestParam("index") int index, @ModelAttribute("timetable") Timetable timetable) {
        timetable.setId(index);  // Ensure the timetable ID is set
        timetableService.updateTimetable(timetable);  // Update the timetable in the database
        return "redirect:/admin/viewTimetable"; // Redirect to the timetable list page after update
    }

    // 6. Delete a timetable
    @PostMapping("/delete/{id}")
    public String deleteTimetable(@PathVariable int id) {
        timetableService.deleteTimetable(id);
        return "redirect:/admin/list";
    }

//    // 7. View details of a timetable
//    @GetMapping("/view/{id}")
//    public String viewTimetable(@PathVariable int id, Model model) {
//        model.addAttribute("timetable", timetableService.getTimetableById(id));
//        return "admin/details"; // View for showing timetable details
//    }

    // 8. Search timetables
    @GetMapping("/search")
    public String searchTimetables(@RequestParam("query") String query, Model model) {
        model.addAttribute("timetables", timetableService.searchTimetables(query));
        model.addAttribute("searchQuery", query);
        return "admin/viewTimetable"; // Reuse the list view to show search results
    }
}
