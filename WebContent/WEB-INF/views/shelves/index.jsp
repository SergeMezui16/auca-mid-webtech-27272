<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../../../partials/header.jsp" />

<div class="container">
    <h1>Shelf List</h1>
	<p>Total: ${shelves.size()}</p>
    <c:if test="${auth.canWrite()}"><a class="btn btn-primary" href="${pageContext.request.contextPath}/shelves?action=new">Create New Shelf</a></c:if>

	<hr>
    <table class="table table-striped">
	  <thead>
        <tr>
            <th>Book Category</th>
            <th>Available Stock</th>
            <th>Borrowed Number</th>
            <th>Initial Stock</th>
            <th>Room</th>
            <c:if test="${auth.canWrite()}"><th>Actions</th></c:if>
        </tr>
	  </thead>
	  <tbody>
        <c:forEach var="shelf" items="${shelves}">
            <tr>
                <td>${shelf.bookCategory}</td>
                <td>${shelf.getAvailableNumber()}</td>
                <td>${shelf.getBorrowedNumber()}</td>
                <td>${shelf.initialStock}</td>
                <td>${shelf.room.name}</td>
                <c:if test="${auth.canWrite()}">
                <td>
                    <a class="btn btn-secondary" href="${pageContext.request.contextPath}/shelves?action=edit&id=${shelf.id}">Edit</a>
                    <form action="${pageContext.request.contextPath}/shelves" method="post" style="display:inline;">
                        <input type="hidden" name="action" value="delete"/>
                        <input type="hidden" name="id" value="${shelf.id}"/>
                        <button class="btn btn-secondary" type="submit">Delete</button>
                    </form>
                </td>
                </c:if>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<jsp:include page="../../../partials/footer.jsp" />