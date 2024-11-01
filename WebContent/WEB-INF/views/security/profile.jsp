<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Find user location</title>
</head>
<body>
	<h1>Profile ${user.name }</h1>
	
	<a href="${pageContext.request.contextPath}/security?action=password">Change My password</a> |	
	<a href="${pageContext.request.contextPath}/security?action=edit">Change My informations</a>
	
	<br>
	<h3>Information</h3>
	<table border="1">
		<tr>
			<th>ID/Username</th>
			<th>${user.username}</th>
		</tr>
		<tr>
			<th>Role</th>
			<th>${user.role}</th>
		</tr>
		<tr>
			<th>First name</th>
			<th>${user.firstName}</th>
		</tr>
		<tr>
			<th>Last name</th>
			<th>${user.lastName}</th>
		</tr>
		<tr>
			<th>Phone</th>
			<th>${user.phoneNumber}</th>
		</tr>
		<tr>
			<th>Gender</th>
			<th>${user.gender}</th>
		</tr>
	</table>
	<h3>Location</h3>
	<table border="1">
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
	
	<c:if test="${user.membershipPending() }">
	<h3>your memberships is pending...</h3>
	</c:if>

	<c:if test="${user.hasMembership() }">
	<h3>Memberships</h3>
	<table border="1">
		<tr>
			<th>Type</th>
			<th>${user.membership.type.name}</th>
		</tr>
		<tr>
			<th>Max</th>
			<th>${user.membership.type.maxBooks}</th>
		</tr>
		<tr>
			<th>Subscription date</th>
			<th>${user.membership.registrationDate}</th>
		</tr>
		<tr>
			<th>Issue date</th>
			<th>${user.membership.registrationDate}</th>
		</tr>
		<tr>
			<th>Status</th>
			<th>${user.membership.status}</th>
		</tr>
	</table>
	</c:if>
</body>
</html>

