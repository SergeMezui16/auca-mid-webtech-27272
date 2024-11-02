<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../../../partials/header.jsp" />

<div class="container">
    <h1>Reserve a book to borrow</h1>
    <p>Borrow available: ${auth.allowedNumberOfBorrowAvailable()}</p>
    <hr>
    <form action="borrows" style="max-width: 400px;" method="post">
        <input type="hidden" name="action" value="return" />
        <input type="hidden" name="id" value="${borrower.id}" />
        
         <div class="form-group">
             <label for="booId">Available books:</label>
	        <select id="bookId" class="form-control ${errorMessage != null ? 'is-invalid' : '' }" name="bookId" required>
	            <c:forEach var="book" items="${books}">
	                <option value="${book.id}">${book.title}</option>
	            </c:forEach>
	        </select>
             <span class="invalid-feedback">
                 ${errorMessage}
             </span>
         </div>
         <div class="form-group">
             <label for="reserveDate">Reserve date:</label>
	        <input type="date" class="form-control" name="reserveDate" id="reserveDate" required />
         </div>
         <div class="form-group">
             <label for="dueDate">Due date:</label>
	        <input type="date" class="form-control" name="dueDate" id="dueDate" required />
         </div>
        
       	<div class="text-end mt-2">
       	<button type="submit" class="btn btn-primary">Borrow</button>
       	</div>
    </form>
</div>

<jsp:include page="../../../partials/footer.jsp" />
