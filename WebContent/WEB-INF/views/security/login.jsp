<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Login</title>
</head>
<body>
<h2>Login</h2>

<c:if test="${user != null}">
<p>You are already logged as ${user}.<br> Do you want to login as someone else or <a href="${pageContext.request.contextPath}/">go back home</a></p>
</c:if>

<form action="${pageContext.request.contextPath}/login" method="post">
	<% String errorMessage = (String) request.getAttribute("errorMessage"); %>
	<% if (errorMessage != null) { %>
	    <div style="color:red;">
	        <%= errorMessage %>
	    </div>
	<% } %>
    <label for="username">Username/ID:</label>
    <input type="text" id="username" name="username" required><br><br>

    <label for="password">Password:</label>
    <input type="password" id="password" name="password" required><br><br>

    <input type="submit" value="Login">
</form>
</body>
</html>

