<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../../../partials/header.jsp" />

<div class="container">
	<h1>Update Membership type</h1>
	<form action="${pageContext.request.contextPath}/membership_types"
		style="max-width: 400px;" method="post">
		<input type="hidden" name="action" value="update" />
		<input type="hidden" name="id" value="${membershipType.id}" />
		
         <div class="form-group">
             <label for="name">Name:</label>
	        <input type="text" class="form-control" value="${membershipType.name}"  name="name" id="name" required />
         </div>
         <div class="form-group">
             <label for="price">Price:</label>
	        <input type="number" class="form-control"  value="${membershipType.price}"name="price" id="price" required />
         </div>
         <div class="form-group">
             <label for="maxBooks">Max Books:</label>
	        <input type="number" class="form-control" value="${membershipType.maxBooks}" name="maxBooks" id="maxBooks" required />
         </div>
        
       	<div class="text-end mt-2">
       	<button type="submit" class="btn btn-primary">Update</button>
       	</div>
	</form>
</div>

<jsp:include page="../../../partials/footer.jsp" />
