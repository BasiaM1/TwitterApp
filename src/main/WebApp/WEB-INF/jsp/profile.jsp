<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <%@include file="common/header.jsp" %>
    <style>

        body {
            background-color: #1abc9c;
        }

        </style>

   </head>
   <body id="LoginForm">
   <%@include file="common/nav.jsp" %>
<div class="container">
    <h1 class="form-heading">Your Profile</h1>
    <div class="login-form">
        <div class="main-div">
            <div class="panel">
                <h2>Users' information</h2>
            </div>


            <table border="0" , bgcolor="#00FF00" class="tableAllUsers table table-striped">
                <p style="color: darkslategrey; text-align: left">Login: ${userProfile.username}</p>
                <p style="color: darkslategrey; text-align: left">Name: ${userProfile.name}</p>
                <p style="color: darkslategrey; text-align: left">Surname: ${userProfile.surname}</p>
                <p style="color: darkslategrey; text-align: left">About User: ${userProfile.aboutme}</p>
            </table>
            <p><a href="/user/edit/${userProfile.id}">Edit your informations</a></p>
            <p><a href="/tweet/add?userId=${userProfile.id}">Add a tweet</a></p>
            <p><a href="/message/add">Create a message</a></p>

            <%--<c:forEach var="tweet" items="${tweets}">--%>
            <%--<li>--%>
            <%--${tweet.text}--%>
            <%--</li>--%>
            <%--</c:forEach>--%>

            <table border="0" , bgcolor="#00FF00" class="tableAllUsers table table-striped">
                <tr>
                    <th>Tweets</th>
                    <th>Created</th>
                    <th>Edit</th>
                    <th>Delete</th>
                </tr>

                <c:forEach var="tweet" items="${tweets}">
                    <tr>
                        <td> ${tweet.text}</td>
                        <td> ${tweet.created}</td>
                        <td><a href="/tweet/edit/${tweet.id}">edit</a>
                        <td><a href="/tweet/delete/${tweet.id}">delete</a>
                    </tr>
                </c:forEach>
            </table>
            <p><a href="/user/${userProfile.id}/messages">Mail box</a></p>
        </div>


    <%--<div>--%>
            <%--<h3>inbox</h3>--%>
            <%--<table border="0" , bgcolor="#00FF00" class="tableAllUsers table table-striped">--%>

                <%--<tr>--%>
                    <%--<th>Date</th>--%>
                    <%--<th>Title</th>--%>
                    <%--<th>From</th>--%>
                    <%--<th>Read</th>--%>
                    <%--<th>Read action</th>--%>
                <%--</tr>--%>

                <%--<c:forEach var="message" items="${messages}">--%>
                    <%--<tr>--%>
                        <%--<td>${message.date}</td>--%>
                        <%--<td>${message.title}</td>--%>
                        <%--<td>${message.sender.name}</td>--%>
                        <%--<td>${message.messageRead}</td>--%>
                        <%--<td><a href="/message/read?messageId=${message.id}">read</a></td>--%>
                    <%--</tr>--%>
                <%--</c:forEach>--%>

            <%--</table>--%>

        <%--</div>--%>


        <%--<div>--%>
            <%--<h3>outbox</h3>--%>
            <%--<table border="0" , bgcolor="#00FF00" class="tableAllUsers table table-striped">--%>

                <%--<tr>--%>
                    <%--<th>Date</th>--%>
                    <%--<th>Title</th>--%>
                    <%--<th>To</th>--%>
                    <%--<th>Read action</th>--%>
                <%--</tr>--%>

                <%--<c:forEach var="message" items="${outbox}">--%>
                    <%--<tr>--%>
                        <%--<td>${message.date}</td>--%>
                        <%--<td>${message.title}</td>--%>
                        <%--<td>${message.receiver.name}</td>--%>
                        <%--<td><a href="/message/read?messageId=${message.id}">read</a></td>--%>
                    <%--</tr>--%>
                <%--</c:forEach>--%>

            <%--</table>--%>

        <%--</div>--%>
    </div>
</div>
<%@include file="common/foot.jsp" %>

</body>
</html>