<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../../../partials/header.jsp" />

<div class="container">
	<h1>Edit User</h1>
	<hr>
	<form action="users" style="max-width: 400px;" method="post">
			<input type="hidden" name="action" value="update" /> 
			<input type="hidden" name="id" value="${user.username}" /> 
		
		<div class="form-group">
             <label for="firstname">First name:</label>
	        <input type="text" class="form-control" name="firstname" id="firstname" required  value="${user.firstName}"/>
         </div>
         <div class="form-group">
             <label for="lastname">Last name:</label>
	        <input type="text" class="form-control" name="lastname" id="lastname" required value="${user.lastName}"/>
         </div>
         <div class="form-group">
             <label for="phone">Phone number:</label>
	        <input type="text" class="form-control" name="phone" id="phone" required value="${user.phoneNumber}" />
         </div>
		<div class="form-group">
           	<label for="gender">Gender:</label>
	       <select id="gender" class="form-control" name="gender" required>
				<c:forEach var="gender" items="${genders}">
					<option <c:if test="${user.gender == gender}">selected="true"</c:if> value="${gender}">${gender}</option>
				</c:forEach>
	       </select>
       	</div>
       	
		<div class="form-group">
            	<label for="villageId">Village:</label>
	        <select id="villageId" class="form-control" name="villageId" required>
			<c:forEach var="location" items="${locations}">
				<option <c:if test="${user.village.id == location.id}">selected="true"</c:if> value="${location.id}">${location.code}: ${location.name}</option>
			</c:forEach>
	        </select>
        	</div>
	
       	<div class="text-end mt-2">
       	<button type="submit" class="btn btn-primary">Update</button>
       	</div>
	</form>
</div>

<jsp:include page="../../../partials/footer.jsp" />
