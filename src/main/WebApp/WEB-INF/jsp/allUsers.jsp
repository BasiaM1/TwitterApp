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
    <p style="color:white">Tweets by user:</p>
    <table border="2", align="center">
    <tr>
        <th class="tweets">Nickname</th>
        <th class="tweets">Tweets</th>

    </tr>

    <c:forEach items="${allUsers}" var = "user">
        <tr>
            <td> ${user.username}</td>
            <td><a href = "/user/${user.id}/tweets">show tweets of this user</a></td>
            <%--<td>--%>
                <%--<c:forEach items="${user.tweets}" var="tweet">--%>
                    <%--<td>${tweet.text}</td> --%>
                <%--</c:forEach>--%>
            <%--</td>--%>
        </tr>
    </c:forEach>
</table>

</div>
<%@include file="common/foot.jsp" %>
</body>
</html>