<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>All users</title>
</head>
<body>
<table border="2", bgcolor="#00FF00">
    <tr>
        <th>Nickname</th>
        <th>Tweets</th>

    </tr>

    <c:forEach items="${allUsers}" var = "user">
        <tr>
            <td> ${user.username}</td>
            <td><a href = "/user/${user.id}/tweets">show tweets of this user</a></td>
            <td>
                <c:forEach items="${user.tweets}" var="tweet">
                    <td>${tweet.text}</td> <%--czemu to nie dziala od razu tylko trzeba tworzyc osobnego jspa???--%>
                </c:forEach>
            </td>
        </tr>
    </c:forEach>
</table>

</body>
</html>