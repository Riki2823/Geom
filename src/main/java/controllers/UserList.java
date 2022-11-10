package controllers;

import model.Figure;
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
import java.util.List;

@WebServlet("/userList")
public class UserList extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        int userId = (Integer) session.getAttribute("userId");

        User user = UserService.getUserById(userId);
        List<Figure> userFigures = FigureService.getFiguresByPropietary(user);

        req.setAttribute("userFigures", userFigures);
        req.setAttribute("name", user.getName());

        RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/jsp/userList.jsp");
        dispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        int userId = (Integer) session.getAttribute("userId");


        User user = UserService.getUserById(userId);
        int figureId = Integer.parseInt(req.getParameter("figureId"));
        FigureService.removeFigure(figureId);

        List<Figure> userFigures = FigureService.getFiguresByPropietary(user);

        req.setAttribute("userFigures", userFigures);
        req.setAttribute("name", user.getName());
        RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/jsp/userList.jsp");
        dispatcher.forward(req, resp);
    }
}
