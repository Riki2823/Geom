package controllers;

import model.Figure;
import services.FigureService;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/seeFigure")
public class seeFigure extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int figureId = Integer.parseInt(req.getParameter("figureId"));
        Figure figure = FigureService.getFigureById(figureId);

        req.setAttribute("cordX", figure.getCordX());
        req.setAttribute("cordY", figure.getCordY());
        req.setAttribute("color", figure.getColor());
        req.setAttribute("type", figure.getForm());
        req.setAttribute("size", figure.getSize());

        System.out.println(figure.getForm());
        req.setAttribute("figureName",figure.getTitle());

        RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/jsp/seeFigure.jsp");
        dispatcher.forward(req, resp);
    }
}
