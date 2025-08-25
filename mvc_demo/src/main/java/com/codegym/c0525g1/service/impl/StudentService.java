package com.codegym.c0525g1.service.impl;

import com.codegym.c0525g1.entity.Student;
import com.codegym.c0525g1.repository.StudentRepository;
import com.codegym.c0525g1.service.IStudentService;

import java.util.List;

public class StudentService implements IStudentService {
    private StudentRepository studentRepository = new StudentRepository();
    @Override
    public List<Student> findAll() {
        return studentRepository.findAll();
    }

    @Override
    public void save(Student student) {
        studentRepository.save(student);
    }
}
