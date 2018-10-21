<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <%@include file="common/header.jsp" %>
    <style>
        .error {
            color: red;
        }

        body {
            background-color: #1abc9c;
        }

    </style>
</head>

<body id="LoginForm">

<%@include file="common/nav.jsp" %>
<div class="container">
    <h1 class="form-heading">Edit user's information</h1>
    <div class="login-form">
        <div class="main-div">
            <div class="panel">
                <p>All fields are mandatory</p>
            </div>

            <form:form id="Login" method="POST" modelAttribute="user">

                <div class="form-group">
                    <form:input path="username" class="form-control" id="inputEmail" placeholder="Username"/>
                    <form:errors path="username" cssClass="error"/><br>
                </div>

                <div class="form-group">
                    <form:input path="name" class="form-control" id="inputEmail" placeholder="name"/>
                    <form:errors path="name" cssClass="error"/><br>
                </div>

                <div class="form-group">
                    <form:input path="surname" class="form-control" id="inputEmail" placeholder="surname"/>
                    <form:errors path="surname" cssClass="error"/><br>
                </div>

                <div class="form-group">
                    <form:input path="email" class="form-control" id="inputEmail" placeholder="email"/>
                    <form:errors path="email" cssClass="error"/><br>
                </div>

                <div class="form-group">
                    <form:input path="password" type="password" class="form-control" id="inputPassword"
                                placeholder="Password"/>
                    <form:errors path="password" cssClass="error"/><br>
                </div>

                <div class="form-group">
                    <form:textarea path="aboutme" rows="3" cols="20" class="form-control" id="inputEmail"
                                   placeholder="About me"/>
                    <form:errors path="aboutme" cssClass="error"/><br>
                </div>

                <button type="submit" class="btn btn-primary" value="Register">Submit</button>

            </form:form>

        </div>
    </div>
</div>


<%@include file="common/foot.jsp" %>

</body>
</html>









