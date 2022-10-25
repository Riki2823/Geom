package controllers;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/home")
public class Home extends HttpServlet {

    boolean state = false;
    List<String> usuarios = new ArrayList<String>();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();

        if (state){
            resp.sendRedirect("/figures");
            return;
        }
        for(String u : usuarios){
            if (u.equals(session.getAttribute("username"))){
                state = true;
            }
        }

        RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/jsp/home.jsp");
        dispatcher.forward(req, resp);
    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        String username = req.getParameter("username");
        session.setAttribute("username", username);

        if (username.equals("")){
            req.setAttribute("stateUN", "Porfavor introduce un usuario");
        }else {
            req.setAttribute("stateUN", "Bienvenido " + session.getAttribute("username"));
            resp.sendRedirect("/figures");
            state = true;
            return;
        }

        RequestDispatcher dispatcher = req.getRequestDispatcher("/WEB-INF/jsp/home.jsp");
        dispatcher.forward(req, resp);

    }
}
