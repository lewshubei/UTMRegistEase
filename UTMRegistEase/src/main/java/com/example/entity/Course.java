package com.example.entity;

import javax.persistence.*;

@Entity
@Table(name = "course")
public class Course {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private int id;

    @Column(name = "program")
    private String program;

    @Column(name = "code")
    private String code;

    @Column(name = "name")
    private String name;

    @Column(name = "section")
    private String section;

    @Column(name = "day1")
    private String day1;

    @Column(name = "time1")
    private String time1;

    @Column(name = "venue1")
    private String venue1;

    @Column(name = "day2", nullable = true)
    private String day2;

    @Column(name = "time2", nullable = true)
    private String time2;

    @Column(name = "venue2", nullable = true)
    private String venue2;

    @Column(name = "approval_status")
    private String approval_status;

    @Column(name = "credit")
    private int credit;

    @Column(name = "submitted")
    private boolean submitted;

    @Column(name = "username")
    private String username;

    // Constructors, Getters, and Setters

    public Course() {}

    public Course(String program, String code, String name, String section,
                  String day1, String time1, String venue1,
                  String day2, String time2, String venue2,
                  String approval_status, int credit, String username) {
        this.program = program;
        this.code = code;
        this.name = name;
        this.section = section;
        this.day1 = day1;
        this.time1 = time1;
        this.venue1 = venue1;
        this.day2 = day2;
        this.time2 = time2;
        this.venue2 = venue2;
        this.approval_status = approval_status;
        this.credit = credit;
        this.username = username;
    }

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getProgram() {
		return program;
	}

	public void setProgram(String program) {
		this.program = program;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSection() {
		return section;
	}

	public void setSection(String section) {
		this.section = section;
	}

	public String getDay1() {
		return day1;
	}

	public void setDay1(String day1) {
		this.day1 = day1;
	}

	public String getTime1() {
		return time1;
	}

	public void setTime1(String time1) {
		this.time1 = time1;
	}

	public String getVenue1() {
		return venue1;
	}

	public void setVenue1(String venue1) {
		this.venue1 = venue1;
	}

	public String getDay2() {
		return day2;
	}

	public void setDay2(String day2) {
		this.day2 = day2;
	}

	public String getTime2() {
		return time2;
	}

	public void setTime2(String time2) {
		this.time2 = time2;
	}

	public String getVenue2() {
		return venue2;
	}

	public void setVenue2(String venue2) {
		this.venue2 = venue2;
	}

	public String getApproval_status() {
		return approval_status;
	}

	public void setApproval_status(String approval_status) {
		this.approval_status = approval_status;
	}

	public int getCredit() {
		return credit;
	}

	public void setCredit(int credit) {
		this.credit = credit;
	}

	public boolean isSubmitted() {
		return submitted;
	}

	public void setSubmitted(boolean submitted) {
		this.submitted = submitted;
	}

	// Getters and Setters for the new field
    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }
    
    
}