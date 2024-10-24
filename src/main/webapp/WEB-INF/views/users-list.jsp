<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Gestion des Utilisateurs</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    <style>
        body {
            color: #333;
            background: #f0f4f8;
            font-family: 'Varela Round', sans-serif;
            font-size: 15px;
        }
        .table-responsive {
            margin: 30px 0;
        }
        .table-wrapper {
            background: #ffffff;
            padding: 20px 25px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }
        .table-title {
            padding-bottom: 15px;
            background: #435d7d;
            color: #ffffff;
            padding: 16px 30px;
            border-radius: 8px;
            margin: -20px -25px 10px;
        }
        .table-title h2 {
            margin: 5px 0 0;
            font-size: 24px;
        }
        .table-title .btn {
            color: #ffffff;
            float: right;
            font-size: 13px;
            border: none;
            border-radius: 5px;
            margin-left: 10px;
        }
        .btn-success {
            background-color: #28a745;
        }
        .btn-danger {
            background-color: #dc3545;
        }
        table.table th {
            background: #435d7d;
            color: #ffffff;
        }
        table.table tr th, table.table tr td {
            border-color: #e9e9e9;
            padding: 12px 15px;
            vertical-align: middle;
        }
        table.table-striped tbody tr:nth-of-type(odd) {
            background-color: #f8f9fa;
        }
        table.table-striped.table-hover tbody tr:hover {
            background: #e2e6ea;
        }
        table.table td a {
            font-weight: bold;
            color: #435d7d;
            text-decoration: none;
        }
        table.table td a:hover {
            color: #0056b3;
        }
        .modal .modal-dialog {
            max-width: 500px;
        }
        .modal .modal-header, .modal .modal-body, .modal .modal-footer {
            padding: 20px 30px;
        }
        .modal .modal-title {
            color: #435d7d;
        }
        .modal .form-control {
            border-radius: 5px;
            border-color: #ced4da;
        }
        .modal .btn {
            border-radius: 5px;
        }
    </style>
</head>
<body>
<div class="container-fluid">
    <div class="row ">
        <div class="col-md-12">
            <div class="px-2">
                <div class="table-responsive mt-2">
                    <div class="table-wrapper">
                        <div class="table-title">
                            <div class="row">
                                <div class="col-sm-6">
                                    <h2>Manage <b>Users</b></h2>
                                </div>
                                <div class="col-sm-6">
                                    <a href="#addEmployeeModal" class="btn btn-success d-flex align-items-center" data-toggle="modal">
                                        <i class="material-icons mr-2">&#xE147;</i> <span>Add New User</span>
                                    </a>
                                </div>
                            </div>
                        </div>
                        <table class="table table-striped table-hover">
                            <thead>
                            <tr>
                                <th>
                                    <span class="custom-checkbox">
                                        <input type="checkbox" id="selectAll">
                                        <label for="selectAll"></label>
                                    </span>
                                </th>
                                <th>ID</th>
                                <th>First Name</th>
                                <th>Last Name</th>
                                <th>Identification Number</th>
                                <th>Nationality</th>
                                <th>Actions</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach var="user" items="${users}">
                            <tr>
                                <td>
                                        <span class="custom-checkbox">
                                            <input type="checkbox" id="checkbox1" name="options[]" value="1">
                                            <label for="checkbox1"></label>
                                        </span>
                                </td>
                                <td><c:out value="${user.id}" /></td>
                                <td><c:out value="${user.firstName}" /></td>
                                <td><c:out value="${user.lastName}" /></td>
                                <td><c:out value="${user.identificationNumber}" /></td>
                                <td><c:out value="${user.nationality}" /></td>
                                <td>
                                    <a href="/TechNovaa/users/edit/${user.id}" class="edit">
                                        <i class="material-icons" style="color: darkorange" title="Edit">&#xE254;</i>
                                    </a>
                                    <a href="/TechNovaa/users/delete/${user.id}" class="delete">
                                        <i class="material-icons" style="color: #dc3545" data-toggle="tooltip" title="Delete">&#xE872;</i>                                    </a>
                                </td>
                            </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Modal for Adding User -->
    <div id="addEmployeeModal" class="modal fade bd-example-modal-lg">
        <div class="modal-dialog modal-lg modal-dialog-centered">
            <div class="modal-content">
                <form action="users/create" method="post">
                    <div class="modal-header">
                        <h4 class="modal-title">Add User</h4>
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    </div>
                    <div class="modal-body">
                        <div class="form-group">
                            <label>First Name</label>
                            <input type="text" class="form-control" name="firstName" >
                        </div>
                        <div class="form-group">
                            <label>Last Name</label>
                            <input type="text" class="form-control" name="lastName" >
                        </div>
                        <div class="form-group">
                            <label>identification Number</label>
                            <input type="text" name="identificationNumber" class="form-control" required>
                        </div>
                        <div class="form-group">
                            <label>nationality</label>
                            <input type="text" name="nationality" class="form-control">
                        </div>
                        <div class="form-group">
                            <label>registration Date</label>
                            <input type="date" name="registrationDate" class="form-control" required>
                        </div>
                        <div class="form-group">
                            <label>expiration Date</label>
                            <input type="date" name="expirationDate" class="form-control" required>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <input type="button" class="btn btn-secondary" data-dismiss="modal" value="Cancel">
                        <input type="submit" class="btn btn-success" value="Add">
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>