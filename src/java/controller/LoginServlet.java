package controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        ServletContext context = getServletContext();
        List<Map<String, String>> adminList = (List<Map<String, String>>) context.getAttribute("adminList");

        Map<String, String> loggedAdmin = null;

        if (adminList != null) {
            for (Map<String, String> admin : adminList) {
                if (admin.get("username").equals(username) && admin.get("password").equals(password)) {
                    loggedAdmin = admin;
                    break;
                }
            }
        }

        if (loggedAdmin != null) {
            HttpSession session = request.getSession(true);
            session.setAttribute("user", username);
            session.setAttribute("adminProfile", loggedAdmin);
            response.sendRedirect("dashboard.jsp");
        } else {
            request.setAttribute("error", "Invalid username or password configuration!");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}