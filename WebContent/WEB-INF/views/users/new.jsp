<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>User Form</title>
</head>
<body>
	<h1>New User</h1>
	<form action="users" method="post">
		<fieldset>
			<input type="hidden" name="action" value="create" /> <label>ID:
				<input type="text" name="username" />
			</label><br /> <label>Role:</label> <select name="role" required>
				<c:forEach var="role" items="${roles}">
					<option value="${role}">${role}</option>
				</c:forEach>
			</select> <br /> <label>password: <input type="password" name="password" /></label><br />
		</fieldset>
		<br />

		<fieldset>
			<label>First name: <input type="text" name="firstname" /></label><br />
			<label>Last name: <input type="text" name="lastname" /></label><br />
			<label>Phone number: <input type="text" name="phone" /></label><br />
			<label>Gender:</label>
			<select name="gender" required>
				<c:forEach var="gender" items="${genders}">
					<option value="${gender}">${gender}</option>
				</c:forEach>
			</select> <br />
			<label>Village:</label>
			<select name="villageId" required>
				<c:forEach var="location" items="${locations}">
					<option value="${location.id}">${location.code}: ${location.name}</option>
				</c:forEach>
			</select> <br />

		</fieldset>
		<br>
		<button type="submit">Create</button>
	</form>
	<a href="users">Back to List</a>
</body>
</html>
