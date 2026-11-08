<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - SkillHub Academy</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #ebedef;
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            font-family: Arial, sans-serif;
        }
        .login-card {
            border: 1px solid #bdc3c7 !important;
            border-radius: 0px !important;
            box-shadow: none !important;
            background-color: #ffffff;
        }
        .form-control {
            border: 1px solid #cccccc !important;
            border-radius: 0px !important;
        }
        .form-control:focus {
            border-color: #2c3e50 !important;
            box-shadow: none !important;
        }
        .btn-custom {
            background-color: #2c3e50 !important;
            color: #ffffff !important;
            border: none !important;
            border-radius: 0px !important;
        }
        .btn-custom:hover {
            background-color: #1a252f !important;
        }
        .alert {
            border-radius: 0px !important;
        }
    </style>
</head>
<body>

<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-4">
            <div class="card login-card p-4">
                <div class="mb-4">
                    <h3 class="fw-bold text-dark m-0" style="letter-spacing: 1px;">SKILLHUB PORTAL</h3>
                    <small class="text-muted">Academic Management System Login</small>
                </div>
                
                <% if(request.getAttribute("error") != null) { %>
                    <div class="alert alert-danger text-center py-2 small" role="alert">
                        <%= request.getAttribute("error") %>
                    </div>
                <% } %>

                <form action="LoginServlet" method="POST">
                    <div class="mb-3">
                        <label class="form-label small fw-bold text-secondary">USERNAME</label>
                        <input type="text" name="username" class="form-control" required placeholder="Enter username">
                    </div>
                    <div class="mb-4">
                        <label class="form-label small fw-bold text-secondary">PASSWORD</label>
                        <input type="password" name="password" class="form-control" required placeholder="Enter password">
                    </div>
                    <button type="submit" class="btn btn-custom w-100 fw-bold py-2">SIGN IN</button>
                </form>
            </div>
        </div>
    </div>
</div>

</body>
</html>