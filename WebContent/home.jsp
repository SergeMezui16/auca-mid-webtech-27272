<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="partials/header.jsp" />

<div class="container">
	<h1 class="display-2">Hello ${auth.name}!</h1>
	<h2 id="role">${auth.role}</h2>
	<hr>
	
	<c:if test="${auth.canWrite()}">
	<h2>Pending Memberships </h2>
	<a href="memberships">See more</a>
	<table class="table table-striped">
	  <thead>
	    <tr>
           <th>Reader</th>
           <th>Membership type</th>
           <th>Status</th>
           <th>Start at</th>
           <th>Issue</th>
	    </tr>
	  </thead>
	  <tbody>
        <c:forEach var="membership" items="${memberships}">
            <tr>
                <td>${membership.reader.name}</td>
                <td>${membership.type.name}</td>
                <td>${membership.status}</td>
                <td>${membership.registrationDate}</td>
                <td>${membership.expiringTime}</td>
            </tr>
        </c:forEach>
	  </tbody>
	</table>
	</c:if>
	
	<c:if test="${auth.canBorrowBook()}">
	<c:if test="${auth.hasMembershipPending() == true}">
		<h2>Your membership is pending</h2>
		<p>Someone is validating your subscription, It will be approved soon. </p>
	</c:if>
	
	
	<c:if test="${auth.hasMembership() == true}">
		<div>
			<h2>You can borrow a book and see what to do here!</h2>
			<p>take a look on the available book to be reserve an picked later.</p>
			
			<a href="borrows" class="btn btn-primary">Borrow a book</a>
		</div>
	</c:if>

	<c:if test="${auth.hasMembership() == false}">
	
	<h2>You don't have membership yet! Subscribe now!</h2>
	<div class="d-flex gap-3 ">
		<c:forEach var="membershipType" items="${membershipTypes}">
			<div class="card">
				<div class="card-body">
					<h4 class="card-title">${membershipType.name}</h4>
					<div class="card-text d-flex flex-column">
						<span>Name: ${membershipType.name}</span> 
						<span>Price: ${membershipType.price} RWF / Month</span> 
						<span>Max Book: ${membershipType.maxBooks}</span>
					</div>
				</div>
				<div class="card-footer text-muted text-end">
					<form method="post" action="memberships">
						<input type="hidden" name="action" value="ask" /> <input
							type="hidden" name="type" value="${membershipType.id}" />
						<button type="submit"  class="btn btn-primary">Subscribe</button>
					</form>
				</div>
			</div>
		</c:forEach>
	</div>
	</c:if>
	</c:if>
</div>
<jsp:include page="partials/footer.jsp" />