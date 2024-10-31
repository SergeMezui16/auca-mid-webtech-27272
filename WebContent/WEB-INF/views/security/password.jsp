<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Change password</title>
</head>
<body>
	<h1>Change password</h1>
		<% String errorMessage = (String) request.getAttribute("errorMessage"); %>
	<% if (errorMessage != null) { %>
	    <div style="color:red;">
	        <%= errorMessage %>
	    </div>
	<% } %>
	<form action="security" method="post">
			<input type="hidden" name="action" value="password" /> 
			<input type="hidden" name="id" value="${user.username}" /> 
			<label>Current Password: <input type="password" name="oldPassword" /></label><br />
			<label>New Password: <input type="password" name="new Password" /></label><br />
		<br />
		<button type="submit">Save</button>
	</form>
	<a href="security?action=profile">Back to profile</a>
</body>
</html>
