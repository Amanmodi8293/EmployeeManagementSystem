package dao;

import java.sql.*;
import java.util.*;
import model.Employee;
import util.DBConnection;

public class EmployeeDAO {

    public static List<Employee> getAllEmployees() throws Exception {
        List<Employee> list = new ArrayList<>();

        try (Connection con = DBConnection.getConnection()) {
            String sql = "SELECT * FROM employees ORDER BY id DESC";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Employee emp = new Employee(
                    rs.getInt("id"),
                    rs.getString("name"),
                    rs.getString("email"),
                    rs.getString("department"),
                    rs.getDouble("salary")
                );
                list.add(emp);
            }
        }

        return list;
    }
    
    
    public static Employee getEmployeeById(int id) throws Exception {
        Employee emp = null;
        try (Connection con = DBConnection.getConnection()) {
            String sql = "SELECT * FROM employees WHERE id=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                emp = new Employee(
                    rs.getInt("id"),
                    rs.getString("name"),
                    rs.getString("email"),
                    rs.getString("department"),
                    rs.getDouble("salary")
                );
            }
        }
        return emp;
    }

}
