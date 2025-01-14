package com.example.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.ui.Model;

import com.example.entity.Course;
import com.example.entity.User;
import com.example.repository.CourseDao;
import com.example.repository.UserDao;

import java.security.Principal;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/academic")
public class AcademicController {

	@Autowired
	private CourseDao courseDAO;

	@Autowired
	private UserDao userDAO;

	public AcademicController() {
		System.out.println("AcademicController loaded");
	}

	@GetMapping("/home")
	public String showHomePage() {
		return "academicHome";
	}

	@GetMapping("/request")
	public String showRequestList(Model model, Principal principal) {
		String username = principal.getName();

		String academicName = userDAO.findAcademicNameByUsername(username);
		System.out.println("Found aa name: " + academicName);
		if (academicName == null || academicName.isEmpty()) {
			model.addAttribute("courses", List.of());
			return "academicRequestList";
		}

		List<Course> courses = courseDAO.findCoursesByUsernameAndAA(academicName);
		System.out.println("Courses loaded: " + courses);

		courses.forEach(course -> {
			User user = userDAO.findUserByUsername(course.getUsername());
			if (user != null) {
				course.setStudentName(user.getStudentName());
				course.setStudentId(user.getStudentId());
			}
		});

		Set<String> seenStudents = new HashSet<>();
		List<Course> uniqueStudents = courses.stream()
				.filter(course -> seenStudents.add(course.getStudentName() + course.getStudentId()))
				.collect(Collectors.toList());

		System.out.println("Unique students passed to JSP: " + uniqueStudents);
		model.addAttribute("courses", uniqueStudents);

		return "academicRequestList";
	}

	@GetMapping("/request/view")
	public String showStudentRegistrationDetails(@RequestParam("id") String studentId, Model model) {
		System.out.println("Received studentId: " + studentId);

		User user = userDAO.findUserByStudentId(studentId);
		if (user == null) {
			model.addAttribute("error", "Student not found!");
			return "academicRequest";
		}

		model.addAttribute("studentName", user.getStudentName());
		model.addAttribute("studentId", user.getStudentId());
		model.addAttribute("username", user.getUsername());

		List<Course> courses = courseDAO.findSlipByUsername(user.getUsername());
		System.out.println("Found courses for student " + studentId + ": " + courses);

		String semester = courses.stream().map(Course::getSemester).distinct().findFirst().orElse("N/A");

		model.addAttribute("semester", semester);

		model.addAttribute("courses", courses);

		int totalCredits = courses.stream().mapToInt(Course::getCredit).sum();

		String approvalStatus;
		if (courses.stream().allMatch(course -> "APPROVED".equalsIgnoreCase(course.getApproval_status()))) {
			approvalStatus = "APPROVED";
		} else if (courses.stream().allMatch(course -> "REJECTED".equalsIgnoreCase(course.getApproval_status()))) {
			approvalStatus = "REJECTED";
		} else {
			approvalStatus = "PENDING";
		}
		model.addAttribute("totalCredits", totalCredits);
		model.addAttribute("approvalStatus", approvalStatus);

		return "academicRequest";
	}

	@PostMapping("/request/confirmAllCoursesStatus")
	public String confirmAllCoursesStatus(@RequestParam("studentId") String studentId,
			@RequestParam("status") String status, Model model) {
		System.out.println("Confirming status update for studentId: " + studentId + ", status: " + status);

		User user = userDAO.findUserByStudentId(studentId);
		if (user == null) {
			model.addAttribute("error", "Student not found!");
			return "academicRequest";
		}

		List<Course> courses = courseDAO.findAllByUsername(user.getUsername());
		if (courses.isEmpty()) {
			model.addAttribute("error", "No courses found for the student!");
			return "academicRequest";
		}

		try {
			for (Course course : courses) {
				course.setApproval_status(status);
				courseDAO.save(course);
			}
			System.out.println("All courses updated to status: " + status);
		} catch (Exception e) {
			System.out.println("Error updating courses: " + e.getMessage());
			model.addAttribute("error", "Failed to update courses.");
			return "academicRequest";
		}

		model.addAttribute("currentStatus", status);

		return "redirect:/academic/request";
	}
}
