<%@ page language="java" %>
<%
    String admin = (String) session.getAttribute("admin");
    if (admin == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Add Employee</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container col-md-6 mt-5">
        <h3 class="mb-4 text-center">Add New Employee</h3>
        <form action="${pageContext.request.contextPath}/AddEmployeeServlet" method="post">
            <div class="mb-3">
                <label>Name</label>
                <input type="text" name="name" class="form-control" required>
            </div>
            <div class="mb-3">
                <label>Email</label>
                <input type="email" name="email" class="form-control" required>
            </div>
            <div class="mb-3">
                <label>Department</label>
                <input type="text" name="department" class="form-control" required>
            </div>
            <div class="mb-3">
                <label>Salary</label>
                <input type="number" name="salary" class="form-control" required>
            </div>
            <button class="btn btn-success w-100">Add Employee</button>
        </form>
        <a href="employee_list.jsp" class="btn btn-secondary mt-3">Back to List</a>
    </div>
</body>
</html>
