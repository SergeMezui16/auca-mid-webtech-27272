<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../../../partials/header.jsp" />

<div class="container">
	<h1>Create Membership type</h1>
    <hr>
	<form action="${pageContext.request.contextPath}/membership_types"
		 style="max-width: 400px;" method="post">
		<input type="hidden" name="action" value="create" />
		
         <div class="form-group">
             <label for="name">Name:</label>
	        <input type="text" class="form-control" name="name" id="name" required />
         </div>
         <div class="form-group">
             <label for="price">Price:</label>
	        <input type="number" class="form-control" name="price" id="price" required />
         </div>
         <div class="form-group">
             <label for="maxBooks">Max Books:</label>
	        <input type="number" class="form-control" name="maxBooks" id="maxBooks" required />
         </div>
        
       	<div class="text-end mt-2">
       	<button type="submit" class="btn btn-primary">Create</button>
       	</div>
	</form>
</div>

<jsp:include page="../../../partials/footer.jsp" />
