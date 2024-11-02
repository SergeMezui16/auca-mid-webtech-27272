<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../../../partials/header.jsp" />

<div class="container">
	<h1>My Borrowers List</h1>
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
			</tr>
		</c:forEach>
		</tbody>
	</table>
</div>

<jsp:include page="../../../partials/footer.jsp" />
