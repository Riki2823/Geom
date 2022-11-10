package controllers;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("viewFigure")
public class ViewFigure extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int figureId = Integer.parseInt(req.getParameter("figureId"));

        System.out.println(figureId);
        RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/jsp/viewFigure.jsp");
        dispatcher.forward(req, resp);
    }
}
