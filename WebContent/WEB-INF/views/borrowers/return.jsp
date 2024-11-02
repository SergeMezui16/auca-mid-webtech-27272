<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../../../partials/header.jsp" />

<div class="container">
    <h1>Return Book ${borrower.book.title}</h1>
    <p>Reader: ${borrower.reader.name} <br>Reserved date: ${borrower.date} <br>Due date: ${borrower.dueDate}</p>
    <hr>
    <form action="borrowers" style="max-width: 400px;" method="post">
        <input type="hidden" name="action" value="return" />
        <input type="hidden" name="id" value="${borrower.id}" />
        
        
         <div class="form-group">
             <label for="returnDate">Return date:</label>
	        <input type="date" class="form-control" name="returnDate" id="returnDate" required />
         </div>
         <div class="form-group">
             <label for="lateChargeFees">Late Fees:</label>
	        <input type="number" class="form-control" name="lateChargeFees" id="lateChargeFees" value="0" required />
         </div>
        
        
       	<div class="text-end mt-2">
       	<button type="submit" class="btn btn-primary">Return</button>
       	</div>
    </form>
</div>

<jsp:include page="../../../partials/footer.jsp" />
