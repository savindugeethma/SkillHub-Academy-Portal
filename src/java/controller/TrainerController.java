package controller;

import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Trainer;

@WebServlet("/TrainerController")
public class TrainerController extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String specialization = request.getParameter("specialization");

        Trainer newTrainer = new Trainer(id, name, specialization);
        List<Trainer> trainerList = (List<Trainer>) getServletContext().getAttribute("trainerList");

        if (trainerList != null) {
            trainerList.add(newTrainer);
            request.setAttribute("success", "New Trainer configuration saved inside deployment memory!");
        }

        request.getRequestDispatcher("trainers.jsp").forward(request, response);
    }
}