package controller;

import model.Course;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/CourseController")
public class CourseController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String duration = request.getParameter("duration");

        Course newCourse = new Course(id, name, duration);
        List<Course> courseList = (List<Course>) getServletContext().getAttribute("courseList");

        if (courseList != null) {
            courseList.add(newCourse);
            request.setAttribute("success", "New course configuration saved inside deployment memory!");
        }

        request.getRequestDispatcher("courses.jsp").forward(request, response);
    }
}