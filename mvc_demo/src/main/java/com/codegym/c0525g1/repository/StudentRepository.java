package com.codegym.c0525g1.repository;

import com.codegym.c0525g1.entity.Student;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class StudentRepository {
    private static List<Student> students = new ArrayList<>();

    static {
        students.add(new Student(1, "haiTT", LocalDate.now(), 10.0));
        students.add(new Student(2, "haiTT", LocalDate.now(), null));
        students.add(new Student(3, "haiTT", LocalDate.now(), 10.0));
    }

    public List<Student> findAll() {
        return students;
    }

    public void save(Student student) {
        int id = students.get(students.size() - 1).getId();
        student.setId(id + 1);
        students.add(student);
    }
}
