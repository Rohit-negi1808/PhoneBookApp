package com.servlet;

import com.ccon.DBconnect;
import com.dao.UserDAO;
import com.entity.User;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        // Getting data from form
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Debug print (optional)
        System.out.println("Registering user: " + name + " | " + email);

        // Creating user object
        User u = new User(name, email, password);

        // Calling DAO
        UserDAO dao = new UserDAO(DBconnect.getConn());
        boolean f = dao.userRegister(u);

        // Session for messages
        HttpSession session = request.getSession();

        if (f) {
            session.setAttribute("sucss", "User Registered Successfully.");
        } else {
            session.setAttribute("error", "Something went wrong. Try again.");
        }

        // Redirect back to registration page
        response.sendRedirect("register.jsp");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Handles user registration";
    }
}
