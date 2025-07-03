<%@ page language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Signup</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container col-md-4 mt-5">
        <div class="card shadow-lg p-4 rounded-4">
            <h3 class="mb-4 text-center text-primary">Admin Signup</h3>
            <form action="${pageContext.request.contextPath}/SignupServlet" method="post">
                <div class="mb-3">
                    <label>Username</label>
                    <input type="text" name="username" class="form-control" required>
                </div>
                <div class="mb-3">
                    <label>Password</label>
                    <input type="password" name="password" class="form-control" required>
                </div>
                <button class="btn btn-success w-100">Signup</button>
            </form>
            <p class="mt-3 text-center">
                Already have an account? <a href="login.jsp">Login here</a>
            </p>
            <p class="text-danger text-center">
                <%= request.getAttribute("error") != null ? request.getAttribute("error") : "" %>
            </p>
        </div>
    </div>
</body>
</html>
