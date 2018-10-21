<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <%@include file="common/header.jsp" %>

</head>
<body>
<%@include file="common/nav.jsp" %>

<div class="container-fluid bg-1 text-center">

    <p style="color:white; padding-top: 50px;">Inbox </p>
    <table border="2" , align="center">

        <tr>
            <th class="tweets">Date</th>
            <th class="tweets">Title</th>
            <th class="tweets">From</th>
            <th class="tweets">Read</th>
            <th class="tweets">Read action</th>
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


    <p style="color:white">Outbox </p>
    <table border="2" , align="center">

        <tr>
            <th class="tweets">Date</th>
            <th class="tweets">Title</th>
            <th class="tweets">To</th>
            <th class="tweets">Read action</th>
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

    <div id="push"></div>
</div>
<%@include file="common/foot.jsp" %>
</body>
</html>