<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:useBean
    id="userManager"
    class="hu.aensys.tutorial.java.jsp.bean.UserManager"
    scope="application" />

<c:set
    var="id"
    value="${param['id']}" />

<c:if test="${not empty id}">
    <c:set
        var="user"
        value="${userManager.findById(id)}" />
</c:if>

<html>
<head>
    <title>Users</title>
    <link rel="stylesheet" type="text/css" href="css/semantic.min.css">
    <link rel="stylesheet" type="text/css" href="css/main.css">
    <script src="js/jquery-3.1.1.min.js"></script>
    <script src="js/semantic.min.js"></script>
</head>
<body>
    <div class="ui container">
        <h1 class="ui header">
            ${empty id ? 'New user' : 'Edit user'}
        </h1>

        <form class="ui form" action="saveUser" method="post">

            <c:if test="${not empty id}">
                <input type="hidden" name="id" value="${id}">
            </c:if>

            <div class="field">
                <label>Username</label>
                <input type="text" name="username" placeholder="Username" value="${user.username}">
            </div>

            <div class="field">
                <label>Full name</label>
                <input type="text" name="fullName" placeholder="Full name" value="${user.fullName}">
            </div>

            <button class="ui positive button" type="submit">Save</button>

            <a class="ui button" href="users.jsp">Cancel</a>

        </form>
    </div>
</body>
</html>