package filters;

import com.google.common.cache.Cache;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter(urlPatterns = {"/generalList"})
public class CheckCSRFtocken extends HttpFilter {
    @Override
    protected void doFilter(HttpServletRequest req, HttpServletResponse res, FilterChain chain) throws IOException, ServletException {
        HttpSession session = req.getSession();
        String token = req.getParameter("csrftoken");
        if (token != null){
            if (isTokenPresentInCache(token, session)){
                chain.doFilter(req, res);
                return;
            }
        }
        res.sendError(401, "Token No valid");
    }

    private boolean isTokenPresentInCache(String token, HttpSession session) {
        Cache<String, Boolean> tokenCache = (Cache<String, Boolean>)
                session.getAttribute("cache");
        if (tokenCache == null) {
            return false;
        }
        return (tokenCache.getIfPresent(token) != null);
    }
}
