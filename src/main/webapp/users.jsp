<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<jsp:useBean
    id="userManager"
    class="hu.aensys.tutorial.java.jsp.bean.UserManager"
    scope="application" />

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
            List of users
        </h1>

        <a class="ui blue button" href="editUser.jsp">
            New user
        </a>

        <c:if test="${empty userManager.users}">
            <div class="ui info message">
                <div class="header">
                    No users found
                </div>
            </div>
        </c:if>

        <c:if test="${not empty userManager.users}">
            <div class="ui large relaxed divided list">
                <c:forEach
                    items="${userManager.users}"
                    var="user">
                    <div class="item">
                        <div class="right floated content">
                            <a class="ui blue button" href="editUser.jsp?id=${user.id}">Edit</a>
                            <a class="ui negative button" href="deleteUser?id=${user.id}">Delete</a>
                        </div>
                        <div class="content">
                            <div class="header">${user.username}</div>
                            <div class="description">${user.fullName}</div>
                        </div>
                    </div>
                </c:forEach>
            </div>
         </c:if>

    </div>
</body>
</html>