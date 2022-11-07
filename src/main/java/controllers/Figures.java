package controllers;

import model.User;
import services.FigureService;
import services.UserService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/figures")
public class Figures extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        int id = (Integer) session.getAttribute("userId");
        User user = UserService.getUserById(id);
        System.out.println(user.getName());
        System.out.println(user.getId());
        req.setAttribute("name", user.getName());

        RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/jsp/figures.jsp");
        dispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        int idUser = (Integer) session.getAttribute("userId");
        User propietary = UserService.getUserById(idUser);

        double cordX = Double.parseDouble(req.getParameter("cordX"));
        double cordY = Double.parseDouble(req.getParameter("cordY"));

        String type = req.getParameter("forms");
        String color = req.getParameter("colors");

        double size = Double.parseDouble(req.getParameter("size"));

        String title = req.getParameter("figureName");

        FigureService.newFigure(title, cordX, cordY, size, propietary, type, color);

        req.setAttribute("name", propietary.getName());
        RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/jsp/figures.jsp");
        dispatcher.forward(req, resp);
    }
}
