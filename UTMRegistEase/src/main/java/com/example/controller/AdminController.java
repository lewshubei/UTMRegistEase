package com.example.controller;

import com.example.DBService.TimetableList;
import com.example.model.Timetable;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@RequestMapping("/viewTimetable")
	public String viewTimetable(@RequestParam(value = "searchQuery", required = false) String searchQuery, Model model) {
	    List<Timetable> filteredList;

	    if (searchQuery != null && !searchQuery.isEmpty()) {
	        final String searchKey = searchQuery.toLowerCase(); // Ensure it's final for lambda usage
	        filteredList = TimetableList.getTimetableList().stream()
	            .filter(timetable -> timetable.getProgram().toLowerCase().contains(searchKey) ||
	                                 timetable.getCode().toLowerCase().contains(searchKey) ||
	                                 timetable.getName().toLowerCase().contains(searchKey))
	            .collect(Collectors.toList());
	        System.out.println("Search Query: " + searchQuery);
	        System.out.println("Filtered List Size: " + filteredList.size());
	    } else {
	        // If no search query, show the entire list
	        filteredList = TimetableList.getTimetableList();
	    }

	    // Pass the filtered list and search query to the view
	    model.addAttribute("timetableList", filteredList);
	    model.addAttribute("searchQuery", searchQuery);
	    return "timetable";
	}

    
    @GetMapping("/addTimetable")
    public String addTimetableForm() {
        return "addTimetable";
    }
    @PostMapping("/addTimetable")
    public String addTimetable(@RequestParam String program, 
                               @RequestParam String code, 
                               @RequestParam String name, 
                               @RequestParam String section, 
                               @RequestParam String day1, 
                               @RequestParam String time1, 
                               @RequestParam String venue1,
                               @RequestParam(required = false) String day2,
                               @RequestParam(required = false) String time2,
                               @RequestParam(required = false) String venue2) {
    	if (day2 == null || day2.isEmpty()) {
            time2 = null;
            venue2 = null;
        }
        // Create new Timetable object
        Timetable newTimetable = new Timetable(program, code, name, section, day1, time1, venue1, day2, time2,venue2);
        // Add to the list
        TimetableList.getInstance().addTimetable(newTimetable);
        // Redirect to viewTimetable
        return "redirect:/admin/viewTimetable";
    }
    
    @GetMapping("/editTimetable")
    public String editTimetableForm(Model model) {
    	model.addAttribute("timetableList", TimetableList.getTimetableList());
        return "editTimetable";
    }
    
    @GetMapping("/updateCourse")
    public String updateCourseForm(@RequestParam("index") int index, Model model) {
        Timetable timetable = TimetableList.getTimetableList().get(index);
        model.addAttribute("timetable", timetable);
        model.addAttribute("index", index);
        return "updateCourse"; // Returns the JSP page for editing course details
    }
    
    @PostMapping("/updateCourse")
    public String updateCourse(@RequestParam("index") int index,
                               @RequestParam String program, 
                               @RequestParam String code, 
                               @RequestParam String name, 
                               @RequestParam String section, 
                               @RequestParam String day1, 
                               @RequestParam String time1, 
                               @RequestParam String venue1,
                               @RequestParam(required = false) String day2,
                               @RequestParam(required = false) String time2,
                               @RequestParam(required = false) String venue2) {

        if (day2 == null || day2.isEmpty()) {
            time2 = null;
            venue2 = null;
        }

        // Get the existing timetable entry by index
        Timetable timetable = TimetableList.getTimetableList().get(index);

        // Update the timetable entry with new data
        timetable.setProgram(program);
        timetable.setCode(code);
        timetable.setName(name);
        timetable.setSection(section);
        timetable.setDay1(day1);
        timetable.setTime1(time1);
        timetable.setVenue1(venue1);
        timetable.setDay2(day2);
        timetable.setTime2(time2);
        timetable.setVenue2(venue2);

        // Redirect to viewTimetable after update
        return "redirect:/admin/viewTimetable";
    }
    
    @GetMapping("/deleteCourse")
    public String deleteCourse(@RequestParam("index") int index) {
        TimetableList.getInstance().removeTimetable(index);
        return "redirect:/admin/viewTimetable";
    }
}