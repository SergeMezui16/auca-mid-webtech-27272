<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../../../partials/header.jsp" />

<div class="container">
    <h1>Create Room</h1>
    <hr>
    <form action="${pageContext.request.contextPath}/rooms" style="max-width: 400px;" method="post">
        <input type="hidden" name="action" value="create"/>
        
         <div class="form-group">
             <label for="code">Code:</label>
	        <input type="text" class="form-control" name="code" id="code" required />
         </div>
         <div class="form-group">
             <label for="name">Name:</label>
	        <input type="text" class="form-control" name="name" id="name" required />
         </div>
         
       	<div class="text-end mt-2">
       	<button type="submit" class="btn btn-primary">Create</button>
       	</div>
    </form>
</div>


<jsp:include page="../../../partials/footer.jsp" />