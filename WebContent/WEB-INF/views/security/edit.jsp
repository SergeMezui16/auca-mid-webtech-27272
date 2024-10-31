<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Edit profile</title>
</head>
<body>
	<h1>Edit profile</h1>
	<form action="security" method="post">
			<input type="hidden" name="action" value="edit" /> 
			<input type="hidden" name="id" value="${user.username}" /> 

		<fieldset>
			<label>First name: <input type="text" name="firstname" value="${user.firstName}" /></label><br />
			<label>Last name: <input type="text" name="lastname" value="${user.lastName}"  /></label><br />
			<label>Phone number: <input type="text" name="phone" value="${user.phoneNumber}"  /></label><br />
			<label>Gender:</label>
			<select name="gender" required>
				<c:forEach var="gender" items="${genders}">
					<option <c:if test="${user.gender == gender}">selected="true"</c:if> value="${gender}">${gender}</option>
				</c:forEach>
			</select> <br />
			<label>Village:</label>
			<select name="villageId" required>
				<c:forEach var="location" items="${locations}">
					<option <c:if test="${user.village.id == location.id}">selected="true"</c:if> value="${location.id}">${location.code}: ${location.name}</option>
				</c:forEach>
			</select> <br />
		</fieldset>
		<br>
		<button type="submit">Update</button>
	</form>
	<a href="security?action=profile">Back to profile</a>
</body>
</html>
