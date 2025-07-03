package controller;

import java.io.IOException;
import java.sql.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import util.DBConnection;

@WebServlet("/AddEmployeeServlet")
public class AddEmployeeServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String dept = request.getParameter("department");
        String salStr = request.getParameter("salary");

        // Basic Validation
        if (name.isEmpty() || email.isEmpty() || dept.isEmpty() || salStr.isEmpty()) {
            response.sendRedirect("jsp/add_employee.jsp");
            return;
        }

        double salary = Double.parseDouble(salStr);

        try (Connection con = DBConnection.getConnection()) {
            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO employees (name, email, department, salary) VALUES (?, ?, ?, ?)"
            );
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, dept);
            ps.setDouble(4, salary);

            ps.executeUpdate();
            response.sendRedirect("employee_list.jsp");

        } catch (SQLIntegrityConstraintViolationException ex) {
            request.setAttribute("error", "Email already exists!");
            request.getRequestDispatcher("add_employee.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Something went wrong.");
            request.getRequestDispatcher("add_employee.jsp").forward(request, response);
        }
    }
}
