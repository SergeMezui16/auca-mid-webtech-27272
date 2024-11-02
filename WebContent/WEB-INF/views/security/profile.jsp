<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../../../partials/header.jsp" />

<div class="container">
	<h1>Profile ${auth.name }</h1>
	
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
			<td>${auth.username}</td>
			<td>${auth.role}</td>
			<td>${auth.firstName}</td>
			<td>${auth.lastName}</td>
			<td>${auth.phoneNumber}</td>
			<td>${auth.gender}</td>
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
			<td>${auth.name}</td>
			<td>${auth.village.name}</td>
			<td>${auth.village.parent.name}</td>
			<td>${auth.village.parent.parent.name}</td>
			<td>${auth.village.parent.parent.parent.name}</td>
			<td>${auth.village.parent.parent.parent.parent.name}</td>
		</tr>
	  </tbody>
	 </table>
	
	<c:if test="${auth.hasMembershipPending() == true }">
	<h3>your memberships is pending...</h3>
	</c:if>

	<c:if test="${auth.hasMembership() == true}">
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
			<th>${auth.membership.type.name}</th>
			<th>${auth.membership.type.maxBooks}</th>
			<th>${auth.membership.registrationDate}</th>
			<th>${auth.membership.expiringTime}</th>
			<th>${auth.membership.status}</th>
		</tr>
	  </tbody>
	 </table>
	</c:if>
</div>
<jsp:include page="../../../partials/footer.jsp" />
