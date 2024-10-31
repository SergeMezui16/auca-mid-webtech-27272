<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Find user location</title>
</head>
<body>
	<h1>Find user location</h1>
	<form method="get" action="${pageContext.request.contextPath}/users">
		<input type="hidden" name="action" value="find">
		<input type="search" name="phone" value="${pageContext.request.getAttribute('phone') }">
		<button>search</button>
	</form>
	<br>
	
		<c:if test="${pageContext.request.getAttribute(\"user\") != null }">
			<table border="1">
				<tr>
					<th>Name</th>
					<th>${user.name}</th>
				</tr>
				<tr>
					<th>Village</th>
					<th>${user.village.name}</th>
				</tr>
				<tr>
					<th>Cell</th>
					<th>${user.village.parent.name}</th>
				</tr>
				<tr>
					<th>Sector</th>
					<th>${user.village.parent.parent.name}</th>
				</tr>
				<tr>
					<th>District</th>
					<th>${user.village.parent.parent.parent.name}</th>
				</tr>
				<tr>
					<th>Province</th>
					<th>${user.village.parent.parent.parent.parent.name}</th>
				</tr>
			</table>
		</c:if>
		<c:if test="${pageContext.request.getAttribute(\"user\") == null }">
			<p>No one found!</p>
		</c:if>
	
</body>
</html>

