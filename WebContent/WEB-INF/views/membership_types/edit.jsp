<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Update Membership type</title>
</head>
<body>
	<h1>Update Membership type</h1>
	<form action="${pageContext.request.contextPath}/membership_types"
		method="post">
		<input type="hidden" name="action" value="update" />
		<input type="hidden" name="id" value="${membershipType.id}" />
		
		<label>Name: <input required name="name" type="text" value="${membershipType.name}" /></label> <br>
		<label>Price: <input required name="price" type="number" value="${membershipType.price}" /></label> <br>
		<label>Max Books: <input required name="maxBooks" type="number" value="${membershipType.maxBooks}" /></label> <br>
		
		<button type="submit">Update</button>
	</form>
</body>
</html>
