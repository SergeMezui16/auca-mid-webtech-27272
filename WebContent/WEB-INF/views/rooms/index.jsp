<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../../../partials/header.jsp" />

<div class="container">
	<h1>Room List</h1>
	<p>Total: ${rooms.size()}</p>
	<a class="btn btn-primary" href="${pageContext.request.contextPath}/rooms?action=new">Create New Room</a>
	<hr>
    <table class="table table-striped">
	  <thead>
		<tr>
			<th>Code</th>
			<th>Name</th>
			<th>Shelves</th>
			<th>Number of book</th>
			<th>Actions</th>
		</tr>
	  </thead>
	  <tbody>
		<c:forEach var="room" items="${rooms}">
			<tr>
				<td>${room.code}</td>
				<td>${room.name}</td>
				<td>${room.shelves.size()}</td>
				<td>${room.getNumberOfBook()}</td>
				<td>
					<a class="btn btn-secondary" href="${pageContext.request.contextPath}/rooms?action=edit&id=${room.id}">Edit</a>
					<form action="${pageContext.request.contextPath}/rooms"
						method="post" style="display: inline;">
						<input type="hidden" name="action" value="delete" /> <input
							type="hidden" name="id" value="${room.id}" />
						<button class="btn btn-secondary" onclick="return confirm('Are you sure?')" type="submit">Delete</button>
					</form>
					<c:if test="${!room.shelves.isEmpty()}">
						<a class="btn btn-secondary" href="${pageContext.request.contextPath}/rooms?action=shelves&id=${room.id}">Shelves</a>
					</c:if>
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
</div>

<jsp:include page="../../../partials/footer.jsp" />
