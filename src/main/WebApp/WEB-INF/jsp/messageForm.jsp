<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="forr" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Tweet form</title>
</head>
<body>
<style>
    .error {
        color: red;
    }
</style>

<form:form method="post" modelAttribute="message">
    <form:hidden path="id"/>
    <form:hidden path="sender.id"/>

    <c:if test="${disabled==false}">To user:
        <%--<form:input path="receiver.username"/>--%>
        <form:select path="receiver" items="${userList}" itemLabel="name" disabled="${disabled}"/>
        <br>
        <form:errors path="receiver" cssClass="error" /><br><br>
    </c:if>
    Title: <form:textarea path="title" rows="3" cols="10" disabled="${disabled}"/><br>
    <form:errors path="title" cssClass="error" /><br><br>
    Message text: <form:textarea path="textmessage" rows="3" cols="20" disabled="${disabled}"/><br>
    <form:errors path="textmessage" cssClass="error" /><br><br>
    <%--User: <form:select path="user.id" items="${allUsers}" itemLabel="username" itemValue="id"></form:select><br>--%>

    <c:if test="${disabled==true}">
        From: ${message.sender.name}<br/>
        Date: ${message.date}
    </c:if>
    <c:if test="${disabled==false}">
        <input type="submit" value="Submit">
    </c:if>
</form:form>


</body>
</html>