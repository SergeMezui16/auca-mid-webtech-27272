<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../../../partials/header.jsp" />

<div class="container">
    <h1>Edit Room</h1>
    <form action="${pageContext.request.contextPath}/rooms" style="max-width: 400px;" method="post">
        <input type="hidden" name="action" value="update"/>
        <input type="hidden" name="id" value="${room.id}"/>
        
         <div class="form-group">
             <label for="code">Code:</label>
	        <input type="text" class="form-control" value="${room.code}" name="code" id="code" required />
         </div>
         <div class="form-group">
             <label for="name">Name:</label>
	        <input type="text" class="form-control" value="${room.name}" name="name" id="name" required />
         </div>
         
       	<div class="text-end mt-2">
       	<button type="submit" class="btn btn-primary">Update</button>
       	</div>
    </form>
</div>
