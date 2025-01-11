package com.example.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/academic")
public class AcademicController {
	
	public AcademicController() {
        System.out.println("AcademicController loaded");
    }
	
	@GetMapping("/home")
	public String showHomePage() {
		return "academicHome";
	}
	
	@GetMapping("/request")
	public String showRequestPage() {
		return "academicRequestList";
	}

	@GetMapping("/request/view")
	public String showViewRegistrationRequestPage() {
		return "academicRequest";
	}
}
