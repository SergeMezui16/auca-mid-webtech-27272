<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../../../partials/header.jsp" />

<div class="container">
	<h1>Edit Profile</h1>
	<hr>
	<form action="security" style="max-width: 400px;" method="post">
			<input type="hidden" name="action" value="edit" /> 
			<input type="hidden" name="id" value="${auth.username}" /> 
		
		<div class="form-group">
             <label for="firstname">First name:</label>
	        <input type="text" class="form-control" name="firstname" id="firstname" required  value="${auth.firstName}"/>
         </div>
         <div class="form-group">
             <label for="lastname">Last name:</label>
	        <input type="text" class="form-control" name="lastname" id="lastname" required value="${auth.lastName}"/>
         </div>
         <div class="form-group">
             <label for="phone">Phone number:</label>
	        <input type="text" class="form-control" name="phone" id="phone" required value="${auth.phoneNumber}" />
         </div>
		<div class="form-group">
           	<label for="gender">Gender:</label>
	       <select id="gender" class="form-control" name="gender" required>
				<c:forEach var="gender" items="${genders}">
					<option <c:if test="${auth.gender == gender}">selected="true"</c:if> value="${gender}">${gender}</option>
				</c:forEach>
	       </select>
       	</div>
       	
		<div class="form-group">
            	<label for="villageId">Village:</label>
	        <select id="villageId" class="form-control" name="villageId" required>
			<c:forEach var="location" items="${locations}">
				<option <c:if test="${auth.village.id == location.id}">selected="true"</c:if> value="${location.id}">${location.code}: ${location.name}</option>
			</c:forEach>
	        </select>
        	</div>
	
       	<div class="text-end mt-2">
       	<button type="submit" class="btn btn-primary">Update</button>
       	</div>
	</form>
</div>

<jsp:include page="../../../partials/footer.jsp" />
