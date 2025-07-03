<%@ page language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container col-md-4 mt-5">
        <div class="card shadow-lg p-4 rounded-4">
            <h3 class="mb-4 text-center">Admin Login</h3>
            <form action="${pageContext.request.contextPath}/LoginServlet" method="post">
                <div class="mb-3">
                    <label>Username</label>
                    <input type="text" name="username" class="form-control" required>
                </div>
                <div class="mb-3">
                    <label>Password</label>
                    <input type="password" name="password" class="form-control" required>
                </div>
                <button class="btn btn-primary w-100">Login</button>
            </form>
            <p class="text-danger mt-3 text-center">
                <%= request.getAttribute("error") != null ? request.getAttribute("error") : "" %>
            </p>
        </div>
    </div>
</body>
</html>
