<%@page import="java.util.List"%>
<%@page import="model.Student"%>
<%@page import="model.Course"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Management - SkillHub</title>
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
        .btn-action-edit {
            background-color: #d35400 !important;
            color: white !important;
            border-radius: 0px !important;
            border: none !important;
        }
        .btn-action-edit:hover {
            background-color: #b33921 !important;
        }
        .modal-content {
            border-radius: 0px !important;
            border: 1px solid #2c3e50 !important;
            box-shadow: none !important;
        }
        .modal-header-add {
            background-color: #2c3e50 !important;
            color: white !important;
            border-radius: 0px !important;
        }
        .modal-header-edit {
            background-color: #d35400 !important;
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
            <li class="nav-item"><a class="nav-link active" href="students.jsp">Student Management</a></li>
            <li class="nav-item"><a class="nav-link" href="courses.jsp">Course Enrollment</a></li>
            <li class="nav-item"><a class="nav-link" href="trainers.jsp">Trainer Management</a></li>
            <li class="nav-item"><a class="nav-link" href="profile.jsp">My Profile</a></li>
            <li class="nav-item mt-5"><a class="nav-link text-danger fw-bold" href="LogoutServlet">Logout</a></li>
        </ul>
    </div>

    <div class="main-content">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <div>
                <h2 class="fw-bold text-dark m-0">Student Management</h2>
                <p class="text-muted m-0">Manage existing academic profiles and registries.</p>
            </div>
            <button type="button" class="btn btn-custom fw-bold py-2 px-3" onclick="openAddModal()">
                Add Student
            </button>
        </div>

        <% if(request.getAttribute("success") != null) { %>
            <div class="alert alert-success alert-dismissible fade show text-center py-2 small" role="alert">
                <%= request.getAttribute("success") %>
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        <% } %>

        <div class="card p-4">
            <h5 class="fw-bold mb-3 text-dark">Registered Students Registry</h5>
            <div class="table-responsive">
                <table class="table table-bordered table-hover align-middle">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Full Name</th>
                            <th>Email</th>
                            <th>Mobile</th>
                            <th>Course</th>
                            <th class="text-center">Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% 
                            List<Student> studentList = (List<Student>) application.getAttribute("studentList");
                            if(studentList == null || studentList.isEmpty()) {
                        %>
                            <tr>
                                <td colspan="6" class="text-center text-muted py-4">No student records found in memory context.</td>
                            </tr>
                        <% 
                            } else {
                                for(Student s : studentList) {
                        %>
                            <tr>
                                <td class="fw-bold text-dark"><%= s.getId() %></td>
                                <td><%= s.getFirstname() + " " + s.getLastname() %></td>
                                <td><%= s.getEmail() %></td>
                                <td><%= s.getMobile() %></td>
                                <td><span class="badge bg-secondary rounded-0 px-2 py-1"><%= s.getCourse() %></span></td>
                                <td class="text-center">
                                    <button type="button" class="btn btn-sm btn-action-edit fw-semibold px-3 py-1 text-white" 
                                            onclick="openEditModal('<%= s.getId() %>', '<%= s.getFirstname() %>', '<%= s.getLastname() %>', '<%= s.getEmail() %>', '<%= s.getMobile() %>', '<%= s.getCourse() %>')">
                                        Edit
                                    </button>
                                </td>
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

    <div class="modal fade" id="studentModal" tabindex="-1" aria-labelledby="studentModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header-add" id="modalHeader">
                    <h5 class="modal-title fw-bold" id="studentModalLabel">Add Student</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <form action="StudentController" method="POST">
                    <div class="modal-body p-4">
                        <div class="mb-3">
                            <label class="form-label small fw-bold text-secondary">STUDENT ID</label>
                            <input type="text" name="id" id="form_id" class="form-control" placeholder="e.g. S002" required>
                        </div>
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label class="form-label small fw-bold text-secondary">FIRST NAME</label>
                                <input type="text" name="firstname" id="form_firstname" class="form-control" required>
                            </div>
                            <div class="col-md-6 mb-3">
                                <label class="form-label small fw-bold text-secondary">LAST NAME</label>
                                <input type="text" name="lastname" id="form_lastname" class="form-control" required>
                            </div>
                        </div>
                        <div class="mb-3">
                            <label class="form-label small fw-bold text-secondary">EMAIL ADDRESS</label>
                            <input type="email" name="email" id="form_email" class="form-control" placeholder="name@example.com" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label small fw-bold text-secondary">MOBILE NUMBER</label>
                            <input type="text" name="mobile" id="form_mobile" class="form-control" placeholder="e.g. 0771234567" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label small fw-bold text-secondary">ENROLLING COURSE</label>
                            <select name="course" id="form_course" class="form-select" required>
                                <option value="">-- Select Course --</option>
                                <% 
                                    List<Course> courses = (List<Course>) application.getAttribute("courseList");
                                    if(courses != null) {
                                        for(Course c : courses) {
                                %>
                                    <option value="<%= c.getName() %>"><%= c.getName() %></option>
                                <%      }
                                    } 
                                %>
                            </select>
                        </div>
                    </div>
                    <div class="modal-footer bg-light border-0">
                        <button type="button" class="btn btn-secondary fw-semibold rounded-0" data-bs-dismiss="modal">Cancel</button>
                        <button type="submit" class="btn btn-custom fw-bold px-3" id="submitBtn">Save Student</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    <script>
        var myModal = new bootstrap.Modal(document.getElementById('studentModal'));

        function openAddModal() {
            document.getElementById('studentModalLabel').innerText = 'Add New Student';
            document.getElementById('modalHeader').className = 'modal-header-add p-3 text-white';
            document.getElementById('submitBtn').className = 'btn btn-custom fw-bold px-3';
            document.getElementById('submitBtn').innerText = 'Save Student';
            
            document.getElementById('form_id').value = '';
            document.getElementById('form_id').removeAttribute('readonly');
            document.getElementById('form_firstname').value = '';
            document.getElementById('form_lastname').value = '';
            document.getElementById('form_email').value = '';
            document.getElementById('form_mobile').value = '';
            document.getElementById('form_course').value = '';
            
            myModal.show();
        }

        function openEditModal(id, fname, lname, email, mobile, course) {
            document.getElementById('studentModalLabel').innerText = 'Edit Student Details';
            document.getElementById('modalHeader').className = 'modal-header-edit p-3 text-white';
            document.getElementById('submitBtn').className = 'btn btn-action-edit fw-bold px-3';
            document.getElementById('submitBtn').innerText = 'Update Details';
            
            document.getElementById('form_id').value = id;
            document.getElementById('form_id').setAttribute('readonly', 'true');
            document.getElementById('form_firstname').value = fname;
            document.getElementById('form_lastname').value = lname;
            document.getElementById('form_email').value = email;
            document.getElementById('form_mobile').value = mobile;
            document.getElementById('form_course').value = course;
            
            myModal.show();
        }
    </script>
</body>
</html>