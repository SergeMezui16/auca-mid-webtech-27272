<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Create Location</title>
</head>
<body>
	<h1>Create Location</h1>
	<form action="${pageContext.request.contextPath}/locations"
		method="post">
		<input type="hidden" name="action" value="create" /> <input
			type="hidden" name="id" /> <label>Location Code:</label> <input
			type="text" name="code" required /><br /> <label>Location
			Name:</label> <input type="text" name="name" required /><br /> <label>Location
			Type:</label> <select name="type" required>
			<c:forEach var="type" items="${types}">
				<option value="${type}">${type}</option>
			</c:forEach>
		</select><br /> <label>Parent Location:</label> <select name="parentId">
			<option value="" selected="selected">NULL</option>
			<c:forEach var="loc" items="${locations}">
				<option data-type="${loc.type}" value="${loc.id}">${loc.type}
					: ${loc.name}</option>
			</c:forEach>
		</select><br />

		<button type="submit">Create</button>
	</form>
</body>
</html>
