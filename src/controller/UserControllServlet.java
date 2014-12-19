package controller;

import impl.UserDAOImpl;
import model.User;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

public class UserControllServlet extends HttpServlet {

    private UserDAOImpl userDAOImpl;
    private User user;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html");
        String userName = req.getParameter("userName");
        String password = req.getParameter("password1");
        String email = req.getParameter("email");
        String phone = req.getParameter("phone");
        String city = req.getParameter("city");
        PrintWriter out = resp.getWriter();

        HttpSession session = req.getSession(true);
        try {
            userDAOImpl = new UserDAOImpl();
            user = new User(userName, password, email, phone, city);
            userDAOImpl.addUser(user);
            out.println("<br/><br/>First Name = " + userName + "<br/><br/>Last Name = " + password + "<br/><br/>Email = " + email + "<br/><br/>Password = " + city);
            resp.sendRedirect("Success");
        } catch (Exception e) {

            e.printStackTrace();
        }
    }


}
