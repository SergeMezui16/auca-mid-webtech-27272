<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../../../partials/header.jsp" />

<div class="container">
    <h1>Shelves List of Room ${room.name}</h1>
	<p>Total shelves: ${shelves.size()}</p>
	<hr>
    <table class="table table-striped">
	  <thead>
        <tr>
            <th>Book Category</th>
            <th>Available Stock</th>
            <th>Borrowed Number</th>
            <th>Initial Stock</th>
        </tr>
	  </thead>
	  <tbody>
        <c:forEach var="shelf" items="${shelves}">
            <tr>
                <td>${shelf.bookCategory}</td>
                <td>${shelf.getAvailableNumber()}</td>
                <td>${shelf.getBorrowedNumber()}</td>
                <td>${shelf.initialStock}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<jsp:include page="../../../partials/footer.jsp" />
