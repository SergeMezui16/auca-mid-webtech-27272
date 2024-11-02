<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../../../partials/header.jsp" />

<div class="container">
	<h1>Change User ${user.username} Password</h1>
	<form action="users" method="post" style="max-width: 400px;">
		<input type="hidden" name="action" value="update_password" /> 
		<input type="hidden" name="id" value="${user.username}" /> 
        <div class="form-group">
            <label for="password">Password:</label>
        <input type="password" class="form-control" name="password" id="password" required />
        </div>
       	<div class="text-end mt-2">
       		<button type="submit" class="btn btn-primary">Save</button>
       	</div>
	</form>
</div>

<jsp:include page="../../../partials/footer.jsp" />
