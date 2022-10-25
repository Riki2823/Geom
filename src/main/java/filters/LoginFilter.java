package filters;

import model.User;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.*;
import java.io.IOException;

@WebFilter(urlPatterns = "/figures")
public class  LoginFilter extends HttpFilter {
    @Override
    protected void doFilter(HttpServletRequest req, HttpServletResponse res, FilterChain chain) throws IOException, ServletException {
        HttpSession session = req.getSession();
        Integer user = (Integer) session.getAttribute("userId");
        if (user == null){
            res.sendRedirect("/home");
            return;
        }
        chain.doFilter(req, res);
    }
}
