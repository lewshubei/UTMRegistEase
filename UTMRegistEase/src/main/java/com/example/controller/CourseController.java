package com.example.controller;

import com.example.entity.Course;
import com.example.entity.User;
import com.example.repository.CourseDao;
import com.example.repository.UserDao;

import java.security.Principal;
import java.util.List;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/student")
public class CourseController {

	@Autowired
	private CourseDao courseDAO;

	@Autowired
	private UserDao userDAO;

	@GetMapping("/registration")
	public String showRegistrationPage() {
		return "courseRegistrationSlip";
	}

	@PostMapping("/registrationSlip")
	public String getCoursesBySemester(@RequestParam("semester") String semester,
			@RequestParam(value = "isSubmitted", required = false) String isSubmitted, Model model,
			Principal principal) {
		String username = principal.getName();

		User user = userDAO.findByUsernameForSlip(username);
		model.addAttribute("studentName", user.getStudentName());
		model.addAttribute("studentId", user.getStudentId());

		List<Course> courses = courseDAO.findCoursesBySemesterAndUsername(semester, username);
		System.out.println("Found courses: " + courses);
		int totalCredits = courses.stream().mapToInt(Course::getCredit).sum();
		model.addAttribute("semester", semester);
		model.addAttribute("courses", courses);
		model.addAttribute("totalCredits", totalCredits);

		String approvalStatus = courses.stream()
				.allMatch(course -> "APPROVED".equalsIgnoreCase(course.getApproval_status())) ? "APPROVED" : "PENDING";
		model.addAttribute("approvalStatus", approvalStatus);

		boolean showModal = "true".equals(isSubmitted) && courses.isEmpty();
        model.addAttribute("showModal", String.valueOf(showModal));

		return "courseRegistrationSlip";
	}
}
