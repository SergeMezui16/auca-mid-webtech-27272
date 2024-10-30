<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Create Membership type</title>
</head>
<body>
	<h1>Create Membership type</h1>
	<form action="${pageContext.request.contextPath}/membership_types"
		method="post">
		<input type="hidden" name="action" value="create" />
		
		<label>Name: <input required name="name" type="text" /></label> <br>
		<label>Price: <input required name="price" type="number" /></label> <br>
		<label>Max Books: <input required name="maxBooks" type="number" /></label> <br>
		
		<button type="submit">Create</button>
	</form>
</body>
</html>
