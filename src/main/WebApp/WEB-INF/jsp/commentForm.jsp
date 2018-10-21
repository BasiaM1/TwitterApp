<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">

    <%@include file="common/header.jsp"%>
    <style>
        .error {
            color: red;
        }
    </style>
</head>
<body>
<%@include file="common/nav.jsp"%>

<div class="container-fluid bg-1 text-center">
    <div class="imgBox">
        <img src="/images/logoTweet.png" class="img-circle" alt="Tweet" style="width: 200px; height: 200px; padding-top: 30px">
    </div>


    <div class="comment">
    <form:form id ="comTwe" method="post" modelAttribute="comment">
    Comment text: <form:textarea path="text" rows="3" cols="20"/><br>
    <form:errors path="text" cssClass="error" /><br><br>
    <%--User: <form:select path="user.id" items="${allUsers}" itemLabel="username" itemValue="id"></form:select><br>--%>

    <input type="submit" value="Submit">
</form:form>
    </div>

</div>
<%@include file="common/foot.jsp" %>
</body>
</html>