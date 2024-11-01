<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Borrower List</title>
</head>
<body>
	<a href="${pageContext.request.contextPath}/home">&larr; Back home</a>
	<h1>Borrower List</h1>
	<p>Total borrowers: ${borrowers.size()}</p>
	<table border="1">
		<tr>
			<th>Book</th>
			<th>Reader</th>
			<th>Status</th>
			<th>Reserve Date</th>
			<th>Due Date</th>
			<th>Fees</th>
			<th>Return Date</th>
			<th>Actions</th>
		</tr>
		<c:forEach var="borrower" items="${borrowers}">
			<tr>
				<td>${borrower.book.title}</td>
				<td>${borrower.reader.name}</td>
				<td>${borrower.status}</td>
				<td>${borrower.date}</td>
				<td>${borrower.dueDate}</td>
				<td>${borrower.lateChargeFees}</td>
				<td>${borrower.returnDate}</td>
				<td>
					<c:if test="${borrower.canBorrow()}">
					<form action="${pageContext.request.contextPath}/borrowers"
						method="post" style="display: inline;">
						<input type="hidden" name="action" value="borrow" /> 
						<input type="hidden" name="id" value="${borrower.id}" />
						<button onclick="return confirm('Are you sure?')" type="submit">Borrowed</button>
					</form>
					</c:if>
					<c:if test="${borrower.canReturn()}">
						<button><a href="${pageContext.request.contextPath}/borrowers?action=return&id=${borrower.id}">Return</a></button>
					</c:if>
				</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>
