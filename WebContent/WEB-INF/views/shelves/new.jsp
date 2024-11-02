<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../../../partials/header.jsp" />

<div class="container">
    <h1>Create Shelf</h1>
    <hr>
    <form action="${pageContext.request.contextPath}/shelves" style="max-width: 400px;" method="post">
        <input type="hidden" name="action" value="create"/>
        
         <div class="form-group">
             <label for="roomId">Room:</label>
	        <select id="roomId" class="form-control ${errorMessage != null ? 'is-invalid' : '' }" name="roomId" required>
	            <c:forEach var="room" items="${rooms}">
	                <option value="${room.id}">${room.name}</option>
	            </c:forEach>
	        </select>
             <span class="invalid-feedback">${errorMessage}</span>
         </div>
        
         <div class="form-group">
             <label for="bookCategory">Book category:</label>
	        <input type="text" class="form-control" name="bookCategory" id="bookCategory" required />
         </div>
        
         <div class="form-group">
             <label for="initialStock">Initial stock:</label>
	        <input type="number" class="form-control" name="initialStock" id="initialStock" required />
         </div>

       	<div class="text-end mt-2">
       		<button type="submit" class="btn btn-primary">Create</button>
       	</div>
    </form>
</div>

<jsp:include page="../../../partials/footer.jsp" />
