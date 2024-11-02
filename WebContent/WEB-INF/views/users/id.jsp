<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../../../partials/header.jsp" />

<div class="container">
	<h1>Change User ${user.username} Role</h1>
	<form action="users" style="max-width: 400px;" method="post">
			<input type="hidden" name="action" value="update_credentials" /> 
			<input type="hidden" name="id" value="${user.username}" /> 
		
		<div class="form-group">
           	<label for="role">Role:</label>
        <select id="role" class="form-control" name="role" required>
		<c:forEach var="role" items="${roles}">
			<option <c:if test="${user.role == role}">selected="true"</c:if> value="${role}">${role}</option>
		</c:forEach>
        </select>
       	</div>
       	<div class="text-end mt-2">
       	<button type="submit" class="btn btn-primary">Save</button>
       	</div>
	</form>
</div>

<jsp:include page="../../../partials/footer.jsp" />
