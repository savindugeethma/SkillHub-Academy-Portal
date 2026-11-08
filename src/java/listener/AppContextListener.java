package listener;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import model.Course;
import model.Student;
import model.Trainer;

public class AppContextListener implements ServletContextListener {
    
    @Override
    public void contextInitialized(ServletContextEvent sce) {
        List<Student> studentList = new ArrayList<>();
        List<Course> courseList = new ArrayList<>();
        List<Trainer> trainerList = new ArrayList<>();
        List<Map<String, String>> adminList = new ArrayList<>();

        courseList.add(new Course("C101", "Java EE Enterprise Architecture", "6 Months"));
        courseList.add(new Course("C102", "Web Component Development", "3 Months"));

        trainerList.add(new Trainer("T001", "Dr. Shank", "Enterprise Java"));
        trainerList.add(new Trainer("T002", "Prof. Silva", "Web Security"));

        studentList.add(new Student("S001", "Nadeeka", "Gunathilaka", "nadeeka@skillhub.com", "0771234567", "Java EE Enterprise Architecture"));

        Map<String, String> admin1 = new HashMap<>();
        admin1.put("username", "admin");
        admin1.put("password", "1234");
        admin1.put("name", "R. A. S. Geethma");
        admin1.put("nic", "198116101395");
        admin1.put("address", "A/184/1,Delwala,Ratnapura");
        admin1.put("mobile", "0786593962");
        admin1.put("dob", "2008-07-21");
        adminList.add(admin1);

        Map<String, String> admin2 = new HashMap<>();
        admin2.put("username", "admin2");
        admin2.put("password", "5678");
        admin2.put("name", "S. B. Perera");
        admin2.put("nic", "199987654321");
        admin2.put("address", "No. 12, Kandy Road, Peradeniya");
        admin2.put("mobile", "0719876543");
        admin2.put("dob", "1999-11-20");
        adminList.add(admin2);

        sce.getServletContext().setAttribute("studentList", studentList);
        sce.getServletContext().setAttribute("courseList", courseList);
        sce.getServletContext().setAttribute("trainerList", trainerList);
        sce.getServletContext().setAttribute("adminList", adminList);
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
    }
}