<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
</head>
<body>
<h2>Login</h2>
<form action="login" method="post">
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

