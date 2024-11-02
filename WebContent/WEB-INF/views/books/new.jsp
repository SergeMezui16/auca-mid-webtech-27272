<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../../../partials/header.jsp" />

<div class="container">
    <h1>New Book</h1>
    <hr>
    <form action="books" style="max-width: 400px;" method="post">
        <input type="hidden" name="action" value="create" />

         <div class="form-group">
             <label for="shelfId">Shelf	:</label>
	        <select id="shelfId" class="form-control ${errorMessage != null ? 'is-invalid' : '' }" name="shelfId" required>
	            <c:forEach var="shelf" items="${shelves}">
	                <option value="${shelf.id}">${shelf.bookCategory}</option>
	            </c:forEach>
	        </select>
             <span class="invalid-feedback">${errorMessage}</span>
         </div>
         <div class="form-group">
             <label for="title">Title:</label>
	        <input type="text" class="form-control" name="title" id="title" required />
         </div>
         <div class="form-group">
             <label for="edition">Edition:</label>
	        <input type="number" class="form-control" name="edition" id="edition" required />
         </div>
         <div class="form-group">
             <label for="publicationYear">Publisher Name:</label>
	        <input type="text" class="form-control" name="publisherName" id="publisherName" required />
         </div>
         
         <div class="form-group">
             <label for="publicationYear">Publisher year:</label>
	        <input type="number" class="form-control" name="publicationYear" id="publicationYear" required />
         </div>
         <div class="form-group">
             <label for="ISBNCode">ISBN Code:</label>
	        <input type="text" class="form-control" name="ISBNCode" id="ISBNCode" required />
         </div>
         
       	<div class="text-end mt-2">
       	<button type="submit" class="btn btn-primary">Create</button>
       	</div>
    </form>
</div>

<jsp:include page="../../../partials/footer.jsp" />
