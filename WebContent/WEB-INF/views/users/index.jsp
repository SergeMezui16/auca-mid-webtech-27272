<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../../../partials/header.jsp" />

<div class="container">
	<h1>User List</h1>
	<p>Total users: ${users.size()}</p>
	<c:if test="${auth.canWrite()}"><a class="btn btn-primary" href="${pageContext.request.contextPath}/users?action=new">Add New User</a></c:if>
	<hr>
    <table class="table table-striped">
	  <thead>
		<tr>
			<th>ID</th>
			<th>Role</th>
			<th>First Name</th>
			<th>Last Name</th>
			<th>Gender</th>
			<th>Phone number</th>
			<th>Village</th>
			<c:if test="${auth.canWrite()}"><th>Actions</th></c:if>
		</tr>
	  </thead>
	  <tbody>
		<c:forEach var="user" items="${users}">
			<tr>
				<td>${user.username}</td>
				<td>${user.role}</td>
				<td>${user.firstName}</td>
				<td>${user.lastName}</td>
				<td>${user.gender}</td>
				<td>${user.phoneNumber}</td>
				<td>${user.village.name}</td>
				<c:if test="${auth.canWrite()}">
				<td>
					<a class="btn btn-secondary" href="${pageContext.request.contextPath}/users?action=edit&id=${user.username}">Edit profile</a>
					<form action="${pageContext.request.contextPath}/users"
						method="post" style="display: inline;">
						<input type="hidden" name="action" value="delete" /> 
						<input type="hidden" name="id" value="${user.username}" />
						<button class="btn btn-secondary"  onclick="return confirm('Are you sure?')" type="submit">Delete</button> 
					</form>
					<a class="btn btn-secondary"  href="${pageContext.request.contextPath}/users?action=id&id=${user.username}">Change role</a>
					<a class="btn btn-secondary"  href="${pageContext.request.contextPath}/users?action=password&id=${user.username}">Change password</a>
				</td>
				</c:if>
			</tr>
		</c:forEach>
		</tbody>
	</table>
</div>

<jsp:include page="../../../partials/footer.jsp" />