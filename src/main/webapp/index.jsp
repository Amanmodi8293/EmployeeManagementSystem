<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Employee Management System - Home</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Bootstrap CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(to right, #667eea, #764ba2);
            color: white;
            height: 100vh;
            display: flex;
            align-items: center;
        }
        .card {
            background-color: rgba(255,255,255,0.1);
            border: none;
            backdrop-filter: blur(10px);
        }
        h1 {
            font-size: 2.5rem;
        }
    </style>
</head>
<body>
    <div class="container text-center">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card p-5 rounded-4 shadow-lg">
                    <h1 class="mb-4">Welcome to Employee Management System</h1>
                    <p class="mb-4">Manage your employees with secure login, full CRUD features, and admin access.</p>
                    <a href="login.jsp" class="btn btn-outline-light mb-2">🔐 Admin Login</a>
                    <a href="signup.jsp" class="btn btn-outline-light">📝 Admin Signup</a>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
