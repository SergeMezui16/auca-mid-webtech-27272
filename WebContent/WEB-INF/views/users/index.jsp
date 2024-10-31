<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>User List</title>
</head>
<body>
	<a href="${pageContext.request.contextPath}/">&larr; Back home</a>
	<h1>User List</h1>
	<p>Total users: ${users.size()}</p>
	<p>
		<a href="${pageContext.request.contextPath}/users?action=new">Add
			New User</a> | <a href="${pageContext.request.contextPath}/users?action=find">
			Find User location From phone</a>
	<p>
	<table border="1">
		<tr>
			<th>ID</th>
			<th>Role</th>
			<th>First Name</th>
			<th>Last Name</th>
			<th>Gender</th>
			<th>Phone number</th>
			<th>Village</th>
			<th>Actions</th>
		</tr>
		<c:forEach var="user" items="${users}">
			<tr>
				<td>${user.username}</td>
				<td>${user.role}</td>
				<td>${user.firstName}</td>
				<td>${user.lastName}</td>
				<td>${user.gender}</td>
				<td>${user.phoneNumber}</td>
				<td>${user.village.name}</td>
				<td>
					<button><a href="${pageContext.request.contextPath}/users?action=edit&id=${user.username}">Edit profile</a></button>
					|
					<form action="${pageContext.request.contextPath}/users"
						method="post" style="display: inline;">
						<input type="hidden" name="action" value="delete" /> 
						<input type="hidden" name="id" value="${user.username}" />
						<button onclick="return confirm('Are you sure?')" type="submit">Delete</button> 
					</form> |
					<button><a href="${pageContext.request.contextPath}/users?action=id&id=${user.username}">Change role</a></button>
					|
					<button><a href="${pageContext.request.contextPath}/users?action=password&id=${user.username}">Change password</a></button>
				</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>