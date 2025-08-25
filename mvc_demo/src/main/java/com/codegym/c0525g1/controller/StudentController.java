package com.codegym.c0525g1.controller;

import com.codegym.c0525g1.entity.Student;
import com.codegym.c0525g1.service.IStudentService;
import com.codegym.c0525g1.service.impl.StudentService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

@WebServlet(urlPatterns = "/students", name = "studentController")
public class StudentController extends HttpServlet {
    private IStudentService studentService = new StudentService();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create": {
//               forward
                req.getRequestDispatcher("/WEB-INF/student/create.jsp").forward(req, resp);
                break;
            }
            default:
                String message = req.getParameter("message");
                if("created".equals(message)) {
                    req.setAttribute("message", "Thêm mới thành công");
                } else if("updated".equals(message)) {
                    req.setAttribute("message", "Cập nhật thành công");
                }
                List<Student> students = studentService.findAll();
                req.setAttribute("students", students);
                req.getRequestDispatcher("/WEB-INF/student/list.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setContentType("text/html; charset=UTF-8");

        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":

                String name = req.getParameter("name");
                String dob = req.getParameter("dob");
                Double point = Double.parseDouble(req.getParameter("point"));
                LocalDate localDate = LocalDate.parse(dob, DateTimeFormatter.ofPattern("yyyy-MM-dd"));
                Student student = new Student(name,localDate, point);
                studentService.save(student);
                resp.sendRedirect("/students?message=created");
        }
    }
}
