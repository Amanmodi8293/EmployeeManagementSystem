<%@ page import="java.util.*, model.Employee, dao.EmployeeDAO" %>
<%
    String admin = (String) session.getAttribute("admin");
    if (admin == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    List<Employee> empList = EmployeeDAO.getAllEmployees();
%>
<!DOCTYPE html>
<html>
<head>
    <title>Employee List</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-4">
        <h3 class="mb-4">Employee List</h3>
        <a href="add_employee.jsp" class="btn btn-success mb-3">+ Add New</a>
        <table class="table table-bordered table-striped">
            <thead class="table-dark">
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Department</th>
                    <th>Salary</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <%
                    for (Employee emp : empList) {
                %>
                <tr>
                    <td><%= emp.getId() %></td>
                    <td><%= emp.getName() %></td>
                    <td><%= emp.getEmail() %></td>
                    <td><%= emp.getDepartment() %></td>
                    <td><%= emp.getSalary() %></td>
                    <td>
                        <a href="edit_employee.jsp?id=<%= emp.getId() %>" class="btn btn-sm btn-primary">Edit</a>
                       <a href="${pageContext.request.contextPath}/DeleteEmployeeServlet?id=<%= emp.getId() %>" class="btn btn-sm btn-danger"
                          onclick="return confirm('Are you sure you want to delete this employee?')">Delete</a>

                    </td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </div>
</body>
</html>
