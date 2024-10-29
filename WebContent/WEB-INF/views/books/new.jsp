<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Book Form</title>
</head>
<body>
    <h1>New Book</h1>
    <form action="books" method="post">
        <input type="hidden" name="action" value="create" />
        <label>Title: <input type="text" name="title" /></label><br/>
        <label>Edition: <input type="number" name="edition" /></label><br/>
        <label>ISBN Code: <input type="text" name="ISBNCode" /></label><br/>
        <label>Publication Year: <input type="number" name="publicationYear" /></label><br/>
        <label>Publisher Name: <input type="text" name="publisherName" /></label><br/>
        <label>Shelf ID:</label>
        <select id="shelfId" name="shelfId" required>
            <c:forEach var="shelf" items="${shelves}">
                <option value="${shelf.id}">${shelf.bookCategory}</option>
            </c:forEach>
        </select>
        <br><br>
        <button type="submit">Create</button>
    </form>
    <a href="books">Back to List</a>
</body>
</html>
