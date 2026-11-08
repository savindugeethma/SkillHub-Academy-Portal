<%@page import="java.util.List"%>
<%@page import="model.Student"%>
<%@page import="model.Course"%>
<%@page import="model.Trainer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - SkillHub Academy</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { 
            background-color: #ebedef; 
            font-family: Arial, sans-serif;
        }
        .sidebar {
            height: 100vh;
            width: 260px;
            position: fixed;
            top: 0;
            left: 0;
            background-color: #2c3e50;
            color: white;
            padding-top: 20px;
        }
        .sidebar .nav-link {
            color: rgba(255,255,255,0.8);
            margin: 5px 15px;
            border-radius: 0px !important;
        }
        .sidebar .nav-link:hover, .sidebar .nav-link.active {
            background-color: #16a085;
            color: white;
        }
        .main-content {
            margin-left: 260px;
            padding: 30px;
        }
        .stat-card {
            border: 1px solid #bdc3c7 !important;
            border-radius: 0px !important;
            box-shadow: none !important;
            background-color: #ffffff;
        }
        .info-card {
            border: 1px solid #bdc3c7 !important;
            border-radius: 0px !important;
            box-shadow: none !important;
            background-color: #ffffff;
            border-left: 4px solid #16a085 !important;
        }
    </style>
</head>
<body>

    <%
        HttpSession currentSession = request.getSession(false);
        String username = "Admin";
        if (currentSession != null && currentSession.getAttribute("user") != null) {
            username = (String) currentSession.getAttribute("user");
        }

        List<Student> students = (List<Student>) application.getAttribute("studentList");
        List<Course> courses = (List<Course>) application.getAttribute("courseList");
        List<Trainer> trainers = (List<Trainer>) application.getAttribute("trainerList");
        
        int studentCount = (students != null) ? students.size() : 0;
        int courseCount = (courses != null) ? courses.size() : 0;
        int trainerCount = (trainers != null) ? trainers.size() : 0;
    %>

    <div class="sidebar">
        <div class="mb-4 px-3">
            <h4 class="fw-bold text-white m-0" style="letter-spacing: 1px;">SKILLHUB PORTAL</h4>
            <small class="text-white-50">Training Academy Portal</small>
        </div>
        <hr class="mx-3 opacity-25">
        <ul class="nav flex-column">
            <li class="nav-item">
                <a class="nav-link active" href="dashboard.jsp">Dashboard</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="students.jsp">Student Management</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="courses.jsp">Course Enrollment</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="trainers.jsp">Trainer Management</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="profile.jsp">My Profile</a>
            </li>
            <li class="nav-item mt-5">
                <a class="nav-link text-danger fw-bold" href="LogoutServlet">Logout</a>
            </li>
        </ul>
    </div>

    <div class="main-content">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <div>
                <h2 class="fw-bold text-dark m-0">Welcome, <%= username %>!</h2>
                <p class="text-muted">Here is the current operational summary of the academy.</p>
            </div>
            <!--<span class="badge bg-secondary px-3 py-2 fw-semibold rounded-0">Java EE Global Context Tracking</span>-->
        </div>

        <div class="row g-4">
            <div class="col-md-4">
                <div class="card stat-card p-4">
                    <div>
                        <h5 class="text-secondary small fw-bold text-uppercase mb-1">Total Students</h5>
                        <h2 class="fw-bold mb-0 text-dark"><%= studentCount %></h2>
                    </div>
                </div>
            </div>
            
            <div class="col-md-4">
                <div class="card stat-card p-4">
                    <div>
                        <h5 class="text-secondary small fw-bold text-uppercase mb-1">Active Courses</h5>
                        <h2 class="fw-bold mb-0 text-dark"><%= courseCount %></h2>
                    </div>
                </div>
            </div>

            <div class="col-md-4">
                <div class="card stat-card p-4">
                    <div>
                        <h5 class="text-secondary small fw-bold text-uppercase mb-1">Assigned Trainers</h5>
                        <h2 class="fw-bold mb-0 text-dark"><%= trainerCount %></h2>
                    </div>
                </div>
            </div>
        </div>
        
<!--        <div class="card info-card mt-4 p-4">
            <h5 class="fw-bold text-dark">In-Memory Application Architecture</h5>
            <p class="text-muted m-0 small">
                This system runs purely within the ServletContext lifecycle container scope. 
                Data persistence is retained dynamically across concurrent user requests until the web container is reloaded or destroyed.
            </p>
        </div>-->
    </div>

</body>
</html>