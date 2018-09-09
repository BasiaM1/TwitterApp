<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" contentType="text/html; charset=UTF-8" %>
<html>
<head><title>Tweeter</title>
    <link rel="stylesheet"
          type="text/css"
          href="<c:url value="/resources/style.css" />">
</head>
<body>
<h1>Twój profil</h1>
<h3>Login:</h3> <p>${userProfile.username}</p>

<h3>Imię:</h3> <p>${userProfile.name}</p>

<h3>Nazwisko:</h3> <p>${userProfile.surname}</p>

<h3>About me:</h3> <p>${userProfile.aboutme}</p>

<p><a href = "/tweet/add?userId=${userProfile.id}">Dodaj tweeta</a></p>
<p><a href = "/message/add?senderId=${userProfile.id}">Utwórz wiadomość</a></p>

<c:forEach var="tweet" items="${tweets}">
    <li>
            ${tweet.text}
    </li>
</c:forEach>

<table border="2", bgcolor="#00FF00">
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
            <td><a href = "/tweet/edit/${tweet.id}">edit</a>
            <td><a href = "/tweet/delete/${tweet.id}">delete</a>
        </tr>
    </c:forEach>
</table>
</body>
</html>