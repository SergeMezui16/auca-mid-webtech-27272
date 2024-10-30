<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>User Form</title>
</head>
<body>
	<h1>Change User ${user.username} Password</h1>
	<form action="users" method="post">
		<fieldset>
			<input type="hidden" name="action" value="update_password" /> 
			<input type="hidden" name="id" value="${user.username}" /> 
			<label>New Password: <input type="password" name="password" /></label><br />
		</fieldset>
		<br />
		<button type="submit">Save</button>
	</form>
	<a href="users">Back to List</a>
</body>
</html>
