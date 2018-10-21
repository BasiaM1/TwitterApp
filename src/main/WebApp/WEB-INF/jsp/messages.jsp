<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <%@include file="common/header.jsp"%>

</head>
<body>
<%@include file="common/nav.jsp"%>

<div class="container-fluid bg-1 text-center">
    <div>
        <h3>inbox</h3>
        <table border="0" , bgcolor="#00FF00" class="tableAllUsers table table-striped">

            <tr>
                <th>Date</th>
                <th>Title</th>
                <th>From</th>
                <th>Read</th>
                <th>Read action</th>
            </tr>

            <c:forEach var="message" items="${inbox}">
                <tr>
                    <td>${message.date}</td>
                    <td>${message.title}</td>
                    <td>${message.sender.name}</td>
                    <td>${message.messageRead}</td>
                    <td><a href="/message/read?messageId=${message.id}">read</a></td>
                </tr>
            </c:forEach>

        </table>

    </div>


    <div>
        <h3>outbox</h3>
        <table border="0" , bgcolor="#00FF00" class="tableAllUsers table table-striped">

            <tr>
                <th>Date</th>
                <th>Title</th>
                <th>To</th>
                <th>Read action</th>
            </tr>

            <c:forEach var="message" items="${outbox}">
                <tr>
                    <td>${message.date}</td>
                    <td>${message.title}</td>
                    <td>${message.receiver.name}</td>
                    <td><a href="/message/read?messageId=${message.id}">read</a></td>
                </tr>
            </c:forEach>

        </table>

    </div>
</div>
<%@include file="common/foot.jsp" %>
</body>
</html>