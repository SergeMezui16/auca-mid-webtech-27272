<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Borrow a book</title>
</head>
<body>
    <h1>Reserve a book to borrow</h1>
    <p>Borrow available: ${user.allowedNumberOfBorrowAvailable()}</p>
    	<% String errorMessage = (String) request.getAttribute("errorMessage"); %>
	<% if (errorMessage != null) { %>
	    <div style="color:red;">
	        <%= errorMessage %>
	    </div>
	<% } %>
    <form action="borrows" method="post">
        <input type="hidden" name="action" value="return" />
         <label>Available books:</label>
        <select name="bookId" required>
            <c:forEach var="book" items="${books}">
                <option value="${book.id}">${book.title}</option>
            </c:forEach>
        </select>
        <br><br>
        <input type="hidden" name="id" value="${borrower.id}" />
        <label>Reserve date: <input type="date" name="reserveDate" /></label><br/>
        <label>Due date: <input type="date" name="dueDate" /></label><br/>
        
        <button type="submit">Borrow</button>
    </form>
</body>
</html>
