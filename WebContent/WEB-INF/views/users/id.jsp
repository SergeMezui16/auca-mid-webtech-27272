<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>User Form</title>
</head>
<body>
	<h1>Change User ${user.username} Role</h1>
	<form action="users" method="post">
		<fieldset>
			<input type="hidden" name="action" value="update_credentials" /> 
			<input type="hidden" name="id" value="${user.username}" /> 
			<label>Role:</label> <select name="role" required>
				<c:forEach var="role" items="${roles}">
					<option <c:if test="${user.role == role}">selected="true"</c:if> value="${role}">${role}</option>
				</c:forEach>
			</select> <br />
		</fieldset>
		<br />
		<button type="submit">Save</button>
	</form>
	<a href="users">Back to List</a>
</body>
</html>
