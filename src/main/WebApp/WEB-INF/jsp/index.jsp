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
    <div class="imgBox">
        <img src="/images/logoTweet.png" class="img-circle" alt="Tweet" style="width: 200px; height: 200px; padding-top: 30px">
    </div>
    <a href="<c:url value="/user/all"/>"><p>Show tweets by user</p></a>

    <p style="color:white">All tweets:</p>
    <table border="2", align="center">
        <tr>
            <th class="tweets">Nickname</th>
            <th class="tweets">Created</th>
            <th class="tweets">Tweet</th>
            <th class="tweets">Likes</th>
            <th class="tweets">Add a comment</th>
            <th class="tweets">Comments</th>

        </tr>

        <c:forEach items="${tweets}" var="tweet">
        <tr>

            <td><a href="/user/${tweet.user.id}/aboutUser">${tweet.user.username}</a></td>
            <td>${tweet.created}</td>
            <td>${tweet.text}</td>
            <td><a href="/tweet/like?tweetId=${tweet.id}">Lubię to!</a> <span class="counter">${tweet.likeCount}</span>
            </td>

            <td><a href="/tweet/${tweet.id}/comment">Add a comment</a></td>

            <td>
                <c:forEach items="${tweet.comments}" var="comment">
                    Utworzono: ${comment.created}
                    <br>
                    ${comment.text}
                </c:forEach>
            </td>
            </c:forEach>
        </tr>
    </table>
</div>
<%@include file="common/foot.jsp" %>
</body>
</html>