<nav class="navbar navbar-default">
    <div class="containernav">



        <security:authorize access="isAuthenticated()">
            <security:authentication var="user" property="principal"/>
            <a href="/user/profile"> ${user.username}</a>
            <br/>
            <form action="/logout" method="post">
                <input type="hidden"
                       name="${_csrf.parameterName}"
                       value="${_csrf.token}"/>
                <input type="submit" value="Logout">
            </form>
        </security:authorize>


        <div class="collapse navbar-collapse" id="myNavbar">
            <a href="/"><img class="logoApp" src="/images/logoTweetApplication.png"></a>
            <security:authorize access="isAnonymous()">
            <security:authentication var="user" property="principal"/>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="<c:url value="/user/register"/>">SIGN UP</a></li>

                <li><a href="<c:url value="/user/login"/>">LOG IN</a></li>

            </ul>
            </security:authorize>
        </div>

    </div>
</nav>