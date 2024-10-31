<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Ask for Membership</title>
</head>
<body>
	<h1>Ask for Membership</h1>
	<form action="${pageContext.request.contextPath}/memberships"
		method="post">
		<input type="hidden" name="action" value="ask" />
		
		<label>Name: <input required name="name" type="text" /></label> <br>
		<label>Price: <input required name="price" type="number" /></label> <br>
		<label>Max Books: <input required name="maxBooks" type="number" /></label> <br>
		
		<button type="submit">Submit</button>
	</form>
</body>
</html>
