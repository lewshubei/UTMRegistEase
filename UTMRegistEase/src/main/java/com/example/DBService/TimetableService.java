package com.example.DBService;

import com.example.entity.Timetable;
import com.example.repository.TimetableDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TimetableService {

    @Autowired
    private TimetableDao timetableDao;

    // 1. Get all timetables
    public List<Timetable> getAllTimetables() {
        return timetableDao.findAll();
    }

    // 2. Get a timetable by ID
    public Timetable getTimetableById(int id) {
        return timetableDao.findById(id);
    }

    // 3. Save a new timetable
    public void saveTimetable(Timetable timetable) {
        timetableDao.save(timetable);
    }

    // 4. Update an existing timetable
    public void updateTimetable(Timetable timetable) {
        timetableDao.update(timetable);
    }

    // 5. Delete a timetable by ID
    public void deleteTimetable(int id) {
        timetableDao.deleteById(id);
    }

    // 6. Search for timetables by program, code, or name
    public List<Timetable> searchTimetables(String keyword) {
        return timetableDao.searchByProgramCodeOrName(keyword);
    }
}

