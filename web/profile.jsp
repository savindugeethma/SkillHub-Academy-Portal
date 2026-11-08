<%@page import="java.util.Map"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Profile - SkillHub</title>
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
        .card { 
            border: 1px solid #bdc3c7 !important; 
            border-radius: 0px !important; 
            box-shadow: none !important; 
            background-color: #ffffff;
        }
        .profile-avatar { 
            width: 80px; 
            height: 80px; 
            background-color: #2c3e50; 
            color: white; 
            font-size: 2rem; 
            display: flex; 
            align-items: center; 
            justify-content: center; 
            border-radius: 0px !important; 
            margin: 0 auto 15px; 
            border: 1px solid #bdc3c7;
        }
    </style>
</head>
<body>

    <div class="sidebar">
        <div class="mb-4 px-3">
            <h4 class="fw-bold text-white m-0" style="letter-spacing: 1px;">SKILLHUB PORTAL</h4>
            <small class="text-white-50">Training Academy Portal</small>
        </div>
        <hr class="mx-3 opacity-25">
        <ul class="nav flex-column">
            <li class="nav-item"><a class="nav-link" href="dashboard.jsp">Dashboard</a></li>
            <li class="nav-item"><a class="nav-link" href="students.jsp">Student Management</a></li>
            <li class="nav-item"><a class="nav-link" href="courses.jsp">Course Enrollment</a></li>
            <li class="nav-item"><a class="nav-link" href="trainers.jsp">Trainer Management</a></li>
            <li class="nav-item"><a class="nav-link active" href="profile.jsp">My Profile</a></li>
            <li class="nav-item mt-5"><a class="nav-link text-danger fw-bold" href="LogoutServlet">Logout</a></li>
        </ul>
    </div>

    <div class="main-content">
        <div class="mb-4">
            <h2 class="fw-bold text-dark">My Profile</h2>
            <p class="text-muted">Manage your personal information and administrator account profiles.</p>
        </div>

        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card p-4 text-center mb-4">
                    <%
                        String loggedUser = (session != null && session.getAttribute("user") != null) ? session.getAttribute("user").toString() : "admin";
                        Map<String, String> adminProfile = (session != null) ? (Map<String, String>) session.getAttribute("adminProfile") : null;
                        
                        String displayName = (adminProfile != null && adminProfile.get("name") != null) ? adminProfile.get("name") : "Administrator";
                        String nic = (adminProfile != null && adminProfile.get("nic") != null) ? adminProfile.get("nic") : "N/A";
                        String address = (adminProfile != null && adminProfile.get("address") != null) ? adminProfile.get("address") : "N/A";
                        String mobile = (adminProfile != null && adminProfile.get("mobile") != null) ? adminProfile.get("mobile") : "N/A";
                        String dob = (adminProfile != null && adminProfile.get("dob") != null) ? adminProfile.get("dob") : "N/A";
                        
                        String avatarLetter = displayName.substring(0, 1).toUpperCase();
                    %>
                    <div class="profile-avatar fw-bold"><%= avatarLetter %></div>
                    <h3 class="fw-bold text-dark mb-1"><%= displayName %></h3>
                    <p class="text-secondary fw-bold small mb-4">SYSTEM ADMINISTRATOR (<%= loggedUser.toUpperCase() %>)</p>
                    
                    <hr class="mb-4">
                    
                    <div class="text-start px-3">
                        <div class="mb-3">
                            <label class="text-secondary small fw-bold d-block">FULL NAME</label>
                            <span class="fw-semibold text-dark"><%= displayName %></span>
                        </div>
                        <div class="mb-3">
                            <label class="text-secondary small fw-bold d-block">NIC NUMBER</label>
                            <span class="fw-semibold text-dark"><%= nic %></span>
                        </div>
                        <div class="mb-3">
                            <label class="text-secondary small fw-bold d-block">RESIDENTIAL ADDRESS</label>
                            <span class="fw-semibold text-dark"><%= address %></span>
                        </div>
                        <div class="mb-3">
                            <label class="text-secondary small fw-bold d-block">MOBILE NUMBER</label>
                            <span class="fw-semibold text-dark"><%= mobile %></span>
                        </div>
                        <div class="mb-0">
                            <label class="text-secondary small fw-bold d-block">DATE OF BIRTH</label>
                            <span class="fw-semibold text-dark"><%= dob %></span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>