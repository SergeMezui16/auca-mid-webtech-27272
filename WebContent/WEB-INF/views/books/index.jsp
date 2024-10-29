<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Book List</title>
</head>
<body>
	<a href="${pageContext.request.contextPath}/">&larr; Back home</a>
	<h1>Book List</h1>
	<p>Total books: ${books.size()}</p>
	<p>
		<a href="${pageContext.request.contextPath}/books?action=new">Add
			New Book</a>
	<p>
	<table border="1">
		<tr>
			<th>Title</th>
			<th>Edition</th>
			<th>ISBN Code</th>
			<th>Publication Year</th>
			<th>Publisher Name</th>
			<th>Shelf</th>
			<th>Actions</th>
		</tr>
		<c:forEach var="book" items="${books}">
			<tr>
				<td>${book.title}</td>
				<td>${book.edition}</td>
				<td>${book.ISBNCode}</td>
				<td>${book.publicationYear}</td>
				<td>${book.publisherName}</td>
				<td>${book.shelf.bookCategory}</td>
				<td>
					<button><a href="${pageContext.request.contextPath}/books?action=edit&id=${book.id}">Edit</a></button>
					|
					<form action="${pageContext.request.contextPath}/books"
						method="post" style="display: inline;">
						<input type="hidden" name="action" value="delete" /> 
						<input type="hidden" name="id" value="${book.id}" />
						<button onclick="return confirm('Are you sure?')" type="submit">Delete</button>
					</form>
				</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>
