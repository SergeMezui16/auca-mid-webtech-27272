<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Book Form</title>
</head>
<body>
    <h1>Edit Book</h1>
    <form action="books" method="post">
        <input type="hidden" name="action" value="update" />
        <input type="hidden" name="id" value="${book.id}" />
        <label>Title: <input type="text" name="title" value="${book.title}" /></label><br/>
        <label>Edition: <input type="number" name="edition" value="${book.edition}" /></label><br/>
        <label>ISBN Code: <input type="text" name="ISBNCode" value="${book.ISBNCode}" /></label><br/>
        <label>Publication Year: <input type="number" name="publicationYear" value="${book.publicationYear}" /></label><br/>
        <label>Publisher Name: <input type="text" name="publisherName" value="${book.publisherName}" /></label><br/>
        <label>Shelf ID:</label>
        <select id="shelfId" name="shelfId" required>
            <c:forEach var="shelf" items="${shelves}">
                <option <c:if test="${shelf.id == book.shelf.id}">selected="true"</c:if> value="${shelf.id}">${shelf.bookCategory}</option>
            </c:forEach>
        </select>
        <br><br>
        <button type="submit">Update</button>
    </form>
    <a href="books">Back to List</a>
</body>
</html>
