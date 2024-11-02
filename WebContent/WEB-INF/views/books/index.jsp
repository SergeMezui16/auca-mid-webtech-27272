<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../../../partials/header.jsp" />

<div class="container">
	<h1>Book List</h1>
	<p>Total books: ${books.size()}</p>
	<a class="btn btn-primary" href="${pageContext.request.contextPath}/books?action=new">Add New Book</a>
	<hr>
    <table class="table table-striped">
	  <thead>
		<tr>
			<th>Title</th>
			<th>Edition</th>
			<th>Status</th>
			<th>ISBN Code</th>
			<th>Publication Year</th>
			<th>Publisher Name</th>
			<th>Shelf</th>
			<th>Actions</th>
		</tr>
	  </thead>
	  <tbody>
		<c:forEach var="book" items="${books}">
			<tr>
				<td>${book.title}</td>
				<td>${book.edition}</td>
				<td>${book.status}</td>
				<td>${book.ISBNCode}</td>
				<td>${book.publicationYear}</td>
				<td>${book.publisherName}</td>
				<td>${book.shelf.bookCategory}</td>
				<td>
					<a class="btn btn-secondary" href="${pageContext.request.contextPath}/books?action=edit&id=${book.id}">Edit</a></button>
					<form action="${pageContext.request.contextPath}/books"
						method="post" style="display: inline;">
						<input type="hidden" name="action" value="delete" /> 
						<input type="hidden" name="id" value="${book.id}" />
						<button class="btn btn-secondary" onclick="return confirm('Are you sure?')" type="submit">Delete</button>
					</form>
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
</div>

<jsp:include page="../../../partials/footer.jsp" />
