<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../../../partials/header.jsp" />

<div class="container">
	<h1>Find user location</h1>
	<form class="w-full" method="get" action="${pageContext.request.contextPath}/users">
		<input type="hidden" name="action" value="find">
		
	    <div class="input-group mb-3">
	      <input type="search" name="phone" value="${phone }" class="form-control" placeholder="Find user location from phone number...">
	      <button class="btn btn-primary" type="submit" id="button-addon2">Search</button>
	    </div>
	</form>
	<br>
	
	<c:if test="${result != null }">		
    <table class="table table-striped">
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
			<td>${result.name}</td>
			<td>${result.village.name}</td>
			<td>${result.village.parent.name}</td>
			<td>${result.village.parent.parent.name}</td>
			<td>${result.village.parent.parent.parent.name}</td>
			<td>${result.village.parent.parent.parent.parent.name}</td>
		</tr>
	  </tbody>
	 </table>
	</c:if>
	
		<c:if test="${result == null }">
			<p class="text-muted text-center">No one found!</p>
		</c:if>
</div>

<jsp:include page="../../../partials/footer.jsp" />

