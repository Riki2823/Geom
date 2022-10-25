package filters;

import com.sun.org.apache.bcel.internal.generic.RET;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;

@WebFilter(urlPatterns = "/figures")
public class LoginFilter extends HttpFilter {
    @Override
    protected void doFilter(HttpServletRequest req, HttpServletResponse res, FilterChain chain) throws IOException, ServletException {
        HttpSession session = req.getSession();
        String user = (String) session.getAttribute("username");
        PrintWriter pw =res.getWriter();
        if (user == null){
            res.setStatus(401);
            pw.println("NO AUTORIZADO");
            return;
        }
        chain.doFilter(req, res);
    }
}
