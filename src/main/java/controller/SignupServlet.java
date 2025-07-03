package controller;

import java.io.IOException;
import java.sql.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;


import org.mindrot.jbcrypt.BCrypt;
import util.DBConnection;

@MultipartConfig
@WebServlet("/SignupServlet")
public class SignupServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try (Connection con = DBConnection.getConnection()) {
            // Check if username already exists
            PreparedStatement check = con.prepareStatement("SELECT * FROM admin_users WHERE username = ?");
            check.setString(1, username);
            ResultSet rs = check.executeQuery();
            if (rs.next()) {
                request.setAttribute("error", "❌ Username already taken");
                request.getRequestDispatcher("signup.jsp").forward(request, response);
                return;
            }

            // Hash the password
            String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt(12));

            // Insert new admin
            PreparedStatement ps = con.prepareStatement("INSERT INTO admin_users (username, password) VALUES (?, ?)");
            ps.setString(1, username);
            ps.setString(2, hashedPassword);

            int rows = ps.executeUpdate();
            if (rows > 0) {
                response.sendRedirect("login.jsp");
            } else {
                request.setAttribute("error", "Signup failed. Try again.");
                request.getRequestDispatcher("signup.jsp").forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Something went wrong!");
            request.getRequestDispatcher("signup.jsp").forward(request, response);
        }
    }
}
