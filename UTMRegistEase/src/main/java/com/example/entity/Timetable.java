package com.example.entity;

import javax.persistence.*;

@Entity
@Table(name = "timetable")
public class Timetable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY) // Auto-generate primary key
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
    private String venue1; // For Day 1

    @Column(name = "day2", nullable = true)
    private String day2;

    @Column(name = "time2", nullable = true)
    private String time2;

    @Column(name = "venue2", nullable = true)
    private String venue2; // For Day 2

    // Default Constructor
    public Timetable() {}

    // Constructor with parameters
    public Timetable(String program, String code, String name, String section,
                     String day1, String time1, String venue1,
                     String day2, String time2, String venue2) {
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
    }

    // Getters and Setters
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
}
