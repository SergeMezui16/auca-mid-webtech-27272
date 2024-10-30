<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Edit Location</title>
</head>
<body>
	<h1>Edit Location</h1>
	<form action="${pageContext.request.contextPath}/locations"
		method="post">
		<input type="hidden" name="action" value="update" /> <input
			type="hidden" name="id" value="${location.id}" /> <label>Location
			Code:</label> <input type="text" name="code" value="${location.code}"
			required /><br /> <label>Location Name:</label> <input type="text"
			name="name" value="${location.name}" required /><br /> <label>Location
			Type:</label> <select name="type" required>
			<c:forEach var="type" items="${types}">
				<option value="${type}"
					<c:if test="${type == location.type }">selected="true"</c:if>>${type}</option>
			</c:forEach>
		</select><br />
		<label>Parent Location:</label> 
		<select name="parentId">
			<option value="">NULL</option> 	
			<c:forEach var="loc" items="${locations}">
				<option data-type="${loc.type }" value="${loc.id}" <c:if test="${location.parent.id == loc.id }">selected="true"</c:if>>
					${loc.type} : ${loc.name}
				</option>
			</c:forEach>
		</select><br />

		<button type="submit">Update</button>
	</form>
</body>
</html>
