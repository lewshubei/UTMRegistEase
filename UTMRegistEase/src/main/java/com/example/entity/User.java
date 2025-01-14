package com.example.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "users")
public class User {
    @Id
    private Long id;

    @Column(name = "username", nullable = false, unique = true, length = 50)
    private String username;

    @Column(name = "password", nullable = false, length = 100)
    private String password;

    @Column(name = "enabled", nullable = false)
    private boolean enabled;
    
    @Column(name = "role", nullable = false)
    private String role;
    
    @Column(name = "student_id", nullable = true)
    private String studentId;

    @Column(name = "student_name", nullable = true)
    private String studentName;

    @Column(name = "academic_id", nullable = true)
    private String academicId;
    
    @Column(name = "academic_name", nullable = true)
    private String academicName;
    
    public User() {
    	
    }
    
    // Getters and Setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }
    
    public String getStudentId() {
        return studentId;
    }

    public void setStudentId(String studentId) {
        this.studentId = studentId;
    }

    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }
    
    public String getAcademicId() {
    	return academicId;
    }
    
    public void setAcademiId(String academicId) {
    	this.academicId = academicId;
    }
    
    public String getAcademicName() {
    	return academicName;
    }
    
    public void setAcademicName(String academicName) {
    	this.academicName = academicName;
    }
}
