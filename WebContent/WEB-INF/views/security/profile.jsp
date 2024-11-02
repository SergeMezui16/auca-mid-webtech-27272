<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../../../partials/header.jsp" />

<div class="container">
	<h1>Profile ${user.name }</h1>
	
	<a class="btn-primary btn" href="${pageContext.request.contextPath}/security?action=password">Change My password</a>	
	<a class="btn-secondary btn" href="${pageContext.request.contextPath}/security?action=edit">Change My informations</a>
	
	<hr>
	<h3>Personal informations</h3>
	<table class="table table-striped mb-5">
	  <thead>
        <tr>
			<th>ID/Username</th>
			<th>Role</th>
			<th>First name</th>
			<th>Last name</th>
            <th>Phone</th>
            <th>Gender</th>
        </tr>
	  </thead>
	  <tbody>
		<tr>
			<td>${user.username}</td>
			<td>${user.role}</td>
			<td>${user.firstName}</td>
			<td>${user.lastName}</td>
			<td>${user.phoneNumber}</td>
			<td>${user.gender}</td>
		</tr>
	  </tbody>
	 </table>
	 
	<h3>Location</h3>
	<table class="table table-striped mb-5">
	  <thead>
        <tr>
			<th>Name</th>
			<th>Village</th>
			<th>Cell</th>
			<th>Sector</th>
            <th>District</th>
            <th>Province</th>
        </tr>
	  </thead>
	  <tbody>
		<tr>
			<td>${user.name}</td>
			<td>${user.village.name}</td>
			<td>${user.village.parent.name}</td>
			<td>${user.village.parent.parent.name}</td>
			<td>${user.village.parent.parent.parent.name}</td>
			<td>${user.village.parent.parent.parent.parent.name}</td>
		</tr>
	  </tbody>
	 </table>
	
	<c:if test="${user.hasMembershipPending() == true }">
	<h3>your memberships is pending...</h3>
	</c:if>

	<c:if test="${user.hasMembership() == true}">
	<h3>Memberships</h3>
	
	<table class="table table-striped mb-5	">
	  <thead>
        <tr>
			<th>Type</th>
			<th>Max</th>
			<th>Subscription date</th>
			<th>Issue date</th>
            <th>Status</th>
        </tr>
	  </thead>
	  <tbody>
		<tr>
			<th>${user.membership.type.name}</th>
			<th>${user.membership.type.maxBooks}</th>
			<th>${user.membership.registrationDate}</th>
			<th>${user.membership.expiringTime}</th>
			<th>${user.membership.status}</th>
		</tr>
	  </tbody>
	 </table>
	</c:if>
</div>
<jsp:include page="../../../partials/footer.jsp" />
