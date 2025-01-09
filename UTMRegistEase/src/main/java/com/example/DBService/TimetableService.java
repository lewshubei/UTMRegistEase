package com.example.DBService;

import com.example.model.Timetable;
import java.util.ArrayList;
import java.util.List;

public class TimetableList {
    private static List<Timetable> timetableList = new ArrayList<>();
    private static TimetableList instance;

    static {
        // Courses with two lectures per week
        timetableList.add(new Timetable("SECJH", "SECR1013", "DIGITAL LOGIC", "01", 
                                        "MONDAY", "0800 - 1000", "BILIK KULIAH 3","WEDNESDAY", "0800 - 1000", "BILIK KULIAH 2"));
        timetableList.add(new Timetable("SECJH", "SECR1013", "DIGITAL LOGIC", "02", 
                                        "MONDAY", "0900 - 1100", "BILIK KULIAH 6","TUESDAY", "0800 - 1000", "BILIK KULIAH 1"));

        // Courses with one lecture per week
        timetableList.add(new Timetable("SECJH", "SECI1143", "PROBABILITY & STATISTICAL DATA ANALYSIS", "01", 
                                        "THURSDAY", "0800 - 1000",  "BILIK KULIAH 2",null, null,null));
        timetableList.add(new Timetable("SECVH", "SECJ2154", "OBJECT-ORIENTED PROGRAMMING", "01", 
                                        "MONDAY", "0800 - 1100", "BILIK KULIAH 3",null, null, null));
    }

    public static List<Timetable> getTimetableList() {
        return timetableList;
    }
    
    public void addTimetable(Timetable timetable) {
        timetableList.add(timetable);
    }
    
    public static TimetableList getInstance() {
        if (instance == null) {
            instance = new TimetableList();
        }
        return instance;
    }
    
    public void removeTimetable(int index) {
        if (index >= 0 && index < timetableList.size()) {
            timetableList.remove(index);
        }
    }

}
