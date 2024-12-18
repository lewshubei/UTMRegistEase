package com.example.controller;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/")
public class CourseController {

    @GetMapping("/registration")
    public String showRegistrationPage() {
        return "CourseRegistrationSlip";
    }
}
