<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../../../partials/header.jsp" />

<div class="container">
	<h1>Change password</h1>
	<hr>
	<form action="security" method="post" style="max-width: 400px;">
			<input type="hidden" name="action" value="password" /> 
			<input type="hidden" name="id" value="${user.username}" /> 
		
         <div class="form-group">
             <label for="oldPassword">Current Password:</label>
	        <input type="password" class="form-control ${errorMessage != null ? 'is-invalid' : ''}" name="oldPassword" id="oldPassword" required />
             <span class="invalid-feedback">
                 ${errorMessage}
             </span>
         </div>
         
         <div class="form-group">
             <label for="newPassword">New Password:</label>
	        <input type="password" class="form-control" name="newPassword" id="newPassword" required />
         </div>
        
       	<div class="text-end mt-2">
       	<button type="submit" class="btn btn-primary">Save</button>
       	</div>
	</form>
</div>

<jsp:include page="../../../partials/footer.jsp" />
