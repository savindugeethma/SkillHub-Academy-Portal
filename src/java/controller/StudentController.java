package controller;

import model.Student;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/StudentController")
public class StudentController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String id = request.getParameter("id");
        String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");
        String email = request.getParameter("email");
        String mobile = request.getParameter("mobile");
        String course = request.getParameter("course");

        List<Student> studentList = (List<Student>) getServletContext().getAttribute("studentList");

        if (studentList != null) {
            Student existingStudent = null;
            for (Student s : studentList) {
                if (s.getId().equals(id)) {
                    existingStudent = s;
                    break;
                }
            }

            if (existingStudent != null) {
                studentList.remove(existingStudent);
                studentList.add(new Student(id, firstname, lastname, email, mobile, course));
                request.setAttribute("success", "Student record updated inside Context Scope successfully!");
            } else {
                studentList.add(new Student(id, firstname, lastname, email, mobile, course));
                request.setAttribute("success", "Student registered successfully into Global Context Memory!");
            }
        }

        request.getRequestDispatcher("students.jsp").forward(request, response);
    }
}