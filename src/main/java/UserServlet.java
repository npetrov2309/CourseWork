
import java.io.IOException;
import java.io.OutputStream;
import static java.lang.System.out;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class UserServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(true);

        Date createTime = new Date(session.getCreationTime());

        Date lastAccessTime = new Date(session.getLastAccessedTime());

        String userID = request.getParameter("user_id");
        String start = request.getParameter("time_begin");
        String end = request.getParameter("time_end");

        session.setAttribute("userID", userID);
        session.setAttribute("time_begin", start);
        session.setAttribute("time_end", end);
        //cookie
        response.addCookie(new Cookie("user",userID));
        response.addCookie(new Cookie("start", start));
        response.addCookie(new Cookie("end", end));
        
        Cookie[] cookies = request.getCookies();
        String cookieName = "user";
        String cookieStart = "start";
        String cookieEnd = "end";
        Cookie cookie = null;
        Cookie cokieStart = null;
        Cookie cokieEnd = null;
 
        if (cookies != null) {
            for (Cookie c : cookies) {
                if (cookieName.equals(c.getName())) {
                    cookie = c;
                    
                }
                if (cookieStart.equals(c.getName())) {
                    cokieStart = c;

                }
                if (cookieEnd.equals(c.getName())) {
                    cokieEnd = c;
                }
            }
        request.setAttribute("cookieUserID", cookie.getValue());
        request.setAttribute("cookieTimeBegin", cokieStart.getValue());
        request.setAttribute("cookieTimeEnd", cokieEnd.getValue());
        
        }
        
        getServletContext().getRequestDispatcher(request.getParameter("viewid")).forward(request, response);

    }
}
