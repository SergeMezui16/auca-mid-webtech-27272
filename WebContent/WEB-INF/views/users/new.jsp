<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../../../partials/header.jsp" />

<div class="container">
	<h1>New User</h1>
	<hr>
	<form class="w-full" action="users" method="post">
	
		<div class="d-flex gap-3">
			<fieldset class="flex-grow-1">
				<input type="hidden" name="action" value="create" />
		         <div class="form-group">
		             <label for="username">ID/Username:</label>
			        <input type="text" class="form-control ${errorMessage != null ? 'is-invalid' : '' }" name="username" id="username" required />
			        <span class="invalid-feedback">
	                    ${errorMessage}
	                </span>
		         </div>
		         <div class="form-group">
		             <label for="password">Password:</label>
			        <input type="password" class="form-control" name="password" id="password" required />
		         </div>
				<div class="form-group">
	             	<label for="role">Role:</label>
			        <select id="role" class="form-control" name="role" required>
					<c:forEach var="role" items="${roles}">
						<option value="${role}">${role}</option>
					</c:forEach>
			        </select>
	         	</div>
				
				<div class="form-group">
	             	<label for="villageId">Village:</label>
			        <select id="villageId" class="form-control" name="villageId" required>
					<c:forEach var="location" items="${locations}">
						<option value="${location.id}">${location.code}: ${location.name}</option>
					</c:forEach>
			        </select>
	         	</div>
			</fieldset>

			<fieldset  class="flex-grow-1">			
		         <div class="form-group">
		             <label for="firstname">First name:</label>
			        <input type="text" class="form-control" name="firstname" id="firstname" required />
		         </div>
		         <div class="form-group">
		             <label for="lastname">Last name:</label>
			        <input type="text" class="form-control" name="lastname" id="lastname" required />
		         </div>
		         <div class="form-group">
		             <label for="phone">Phone number:</label>
			        <input type="text" class="form-control" name="phone" id="phone" required />
		         </div>
				<div class="form-group">
	             	<label for="gender">Gender:</label>
			        <select id="gender" class="form-control" name="gender" required>
					<c:forEach var="gender" items="${genders}">
						<option value="${gender}">${gender}</option>
					</c:forEach>
			        </select>
	         	</div>
	
			</fieldset>
		</div>
       	<div class="text-end mt-2">
       	<button type="submit" class="btn btn-primary">Create</button>
       	</div>
	</form>
</div>

<jsp:include page="../../../partials/footer.jsp" />