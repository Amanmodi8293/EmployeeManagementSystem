<%@ page import="model.Employee, dao.EmployeeDAO" %>
<%
    String admin = (String) session.getAttribute("admin");
    if (admin == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    int id = Integer.parseInt(request.getParameter("id"));
    Employee emp = EmployeeDAO.getEmployeeById(id);
%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Employee</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container col-md-6 mt-5">
        <h3 class="mb-4 text-center">Edit Employee</h3>
        <form action="${pageContext.request.contextPath}/UpdateEmployeeServlet" method="post">
            <input type="hidden" name="id" value="<%= emp.getId() %>">
            <div class="mb-3">
                <label>Name</label>
                <input type="text" name="name" value="<%= emp.getName() %>" class="form-control" required>
            </div>
            <div class="mb-3">
                <label>Email</label>
                <input type="email" name="email" value="<%= emp.getEmail() %>" class="form-control" required>
            </div>
            <div class="mb-3">
                <label>Department</label>
                <input type="text" name="department" value="<%= emp.getDepartment() %>" class="form-control" required>
            </div>
            <div class="mb-3">
                <label>Salary</label>
                <input type="number" name="salary" value="<%= emp.getSalary() %>" class="form-control" required>
            </div>
            <button class="btn btn-primary w-100">Update</button>
        </form>
        <a href="employee_list.jsp" class="btn btn-secondary mt-3">Back to List</a>
    </div>
</body>
</html>
