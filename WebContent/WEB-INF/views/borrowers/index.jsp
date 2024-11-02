<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../../../partials/header.jsp" />

<div class="container">
	<h1>Borrowers List</h1>
	<p>Total: ${borrowers.size()}</p>
	<hr>
	<table  class="table table-striped">
	  <thead>
		<tr>
			<th>Book</th>
			<th>Reader</th>
			<th>Status</th>
			<th>Reserve Date</th>
			<th>Due Date</th>
			<th>Fees</th>
			<th>Return Date</th>
			<c:if test="${auth.canWrite()}"><th>Actions</th></c:if>
		</tr>
	  </thead>
	  <tbody>
		<c:forEach var="borrower" items="${borrowers}">
			<tr>
				<td>${borrower.book.title}</td>
				<td>${borrower.reader.name}</td>
				<td>${borrower.status}</td>
				<td>${borrower.date}</td>
				<td>${borrower.dueDate}</td>
				<td>${borrower.lateChargeFees}</td>
				<td>${borrower.returnDate}</td>
				<c:if test="${auth.canWrite()}">
				<td>
					<c:if test="${borrower.canBorrow()}">
					<form action="${pageContext.request.contextPath}/borrowers"
						method="post" style="display: inline;">
						<input type="hidden" name="action" value="borrow" /> 
						<input type="hidden" name="id" value="${borrower.id}" />
						<button class="btn btn-secondary" onclick="return confirm('Are you sure?')" type="submit">Borrowed</button>
					</form>
					</c:if>
					<c:if test="${borrower.canReturn()}">
						<a class="btn btn-secondary" href="${pageContext.request.contextPath}/borrowers?action=return&id=${borrower.id}">Return</a>
					</c:if>
				</td>
				</c:if>
			</tr>
		</c:forEach>
		</tbody>
	</table>
</div>

<jsp:include page="../../../partials/footer.jsp" />
