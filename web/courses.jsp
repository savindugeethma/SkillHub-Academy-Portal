<%@page import="java.util.List"%>
<%@page import="model.Course"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Course Enrollment - SkillHub</title>
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
        .table {
            background: white;
        }
        .table thead {
            background-color: #f8f9fa;
            color: #333;
            border-bottom: 2px solid #dee2e6;
        }
        .form-control, .form-select {
            border: 1px solid #cccccc !important;
            border-radius: 0px !important;
        }
        .form-control:focus, .form-select:focus {
            border-color: #2c3e50 !important;
            box-shadow: none !important;
        }
        .btn-custom {
            background-color: #2c3e50 !important;
            color: white !important;
            border-radius: 0px !important;
            border: none !important;
        }
        .btn-custom:hover {
            background-color: #1a252f !important;
            color: white !important;
        }
        .modal-content {
            border-radius: 0px !important;
            border: 1px solid #2c3e50 !important;
            box-shadow: none !important;
        }
        .modal-header {
            background-color: #2c3e50 !important;
            color: white !important;
            border-radius: 0px !important;
        }
        .btn-close-white {
            filter: invert(1) grayscale(1) brightness(2);
        }
        .alert {
            border-radius: 0px !important;
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
            <li class="nav-item"><a class="nav-link active" href="courses.jsp">Course Enrollment</a></li>
            <li class="nav-item"><a class="nav-link" href="trainers.jsp">Trainer Management</a></li>
            <li class="nav-item"><a class="nav-link" href="profile.jsp">My Profile</a></li>
            <li class="nav-item mt-5"><a class="nav-link text-danger fw-bold" href="LogoutServlet">Logout</a></li>
        </ul>
    </div>

    <div class="main-content">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <div>
                <h2 class="fw-bold text-dark m-0">Course Enrollment</h2>
                <p class="text-muted m-0">Manage academy training modules and course durations.</p>
            </div>
            <button type="button" class="btn btn-custom fw-bold py-2 px-3" onclick="openAddCourseModal()">
                Add Course
            </button>
        </div>

        <% if(request.getAttribute("success") != null) { %>
            <div class="alert alert-success alert-dismissible fade show text-center py-2 small" role="alert">
                <%= request.getAttribute("success") %>
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        <% } %>

        <div class="card p-4">
            <h5 class="fw-bold mb-3 text-dark">Active Course Registry</h5>
            <div class="table-responsive">
                <table class="table table-bordered table-hover align-middle">
                    <thead>
                        <tr>
                            <th>Course ID</th>
                            <th>Course Name</th>
                            <th>Duration</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% 
                            List<Course> courseList = (List<Course>) application.getAttribute("courseList");
                            if(courseList == null || courseList.isEmpty()) {
                        %>
                            <tr>
                                <td colspan="3" class="text-center text-muted py-4">No course modules registered in memory.</td>
                            </tr>
                        <% 
                            } else {
                                for(Course c : courseList) {
                        %>
                            <tr>
                                <td class="fw-bold text-dark"><%= c.getId() %></td>
                                <td><%= c.getName() %></td>
                                <td><span class="badge bg-secondary rounded-0 px-2 py-1"><%= c.getDuration() %></span></td>
                            </tr>
                        <% 
                                }
                            }
                        %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <div class="modal fade" id="courseModal" tabindex="-1" aria-labelledby="courseModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title fw-bold" id="courseModalLabel">Add New Course</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <form action="CourseController" method="POST">
                    <div class="modal-body p-4">
                        <div class="mb-3">
                            <label class="form-label small fw-bold text-secondary">COURSE ID</label>
                            <input type="text" name="id" class="form-control" placeholder="e.g. C103" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label small fw-bold text-secondary">COURSE NAME</label>
                            <input type="text" name="name" class="form-control" placeholder="e.g. Python Developer" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label small fw-bold text-secondary">DURATION</label>
                            <select name="duration" class="form-select" required>
                                <option value="">-- Select Duration --</option>
                                <option value="1 Month">1 Month</option>
                                <option value="3 Months">3 Months</option>
                                <option value="6 Months">6 Months</option>
                                <option value="1 Year">1 Year</option>
                            </select>
                        </div>
                    </div>
                    <div class="modal-footer bg-light border-0">
                        <button type="button" class="btn btn-secondary fw-semibold rounded-0" data-bs-dismiss="modal">Cancel</button>
                        <button type="submit" class="btn btn-custom fw-bold px-3">Save Course</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    <script>
        var courseModal = new bootstrap.Modal(document.getElementById('courseModal'));
        function openAddCourseModal() {
            courseModal.show();
        }
    </script>
</body>
</html>