<%--
  Created by IntelliJ IDEA.
  User: Youcode
  Date: 02/10/2024
  Time: 19:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
</head>
<body>
<div >
    <div>
        <div class="modal-content" style="padding: 0 4rem">
            <form action="<c:url value='/users/update' />" method="post">                <div class="modal-header">
                    <h4 class="modal-title">Edit User</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                </div>
                <div class="modal-body">
                    <div class="form-group">
                        <input type="text" name="id" class="form-control" value="${user.id}" hidden="hidden" required>
                        <label>First Name</label>
                        <input type="text" class="form-control" name="firstName" value="${user.firstName}" >
                    </div>
                    <div class="form-group">
                        <label>Last Name</label>
                        <input type="text" class="form-control" name="lastName" value="${user.lastName}">
                    </div>
                    <div class="form-group">
                        <label>identification Number</label>
                        <input type="text" name="identificationNumber" class="form-control" value="${user.identificationNumber}" required>
                    </div>
                    <div class="form-group">
                        <label>nationality</label>
                        <input type="text" name="nationality" class="form-control" value="${user.nationality}">
                    </div>
                    <div class="form-group">
                        <label>registration Date</label>
                        <input type="date" name="registrationDate" class="form-control" required value="${user.registrationDate}">
                    </div>
                    <div class="form-group">
                        <label>expiration Date</label>
                        <input type="date" name="expirationDate" class="form-control" required value="${user.expirationDate}">
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

</body>
</html>
