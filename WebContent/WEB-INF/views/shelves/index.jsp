<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>List of Shelves</title>
</head>
<body>
	<a href="${pageContext.request.contextPath}/">&larr; Back home</a>
    <h1>Shelf List</h1>
	<p>Total rooms: ${shelves.size()}</p>
	<p>
    <a href="${pageContext.request.contextPath}/shelves?action=new">Create New Shelf</a>
	<p>
    <table border="1">
        <tr>
            <th>Book Category</th>
            <th>Available Stock</th>
            <th>Borrowed Number</th>
            <th>Initial Stock</th>
            <th>Room</th>
            <th>Actions</th>
        </tr>
        <c:forEach var="shelf" items="${shelves}">
            <tr>
                <td>${shelf.bookCategory}</td>
                <td>${shelf.availableStock}</td>
                <td>${shelf.borrowedNumber}</td>
                <td>${shelf.initialStock}</td>
                <td>${shelf.room.name}</td>
                <td>
                    <button><a href="${pageContext.request.contextPath}/shelves?action=edit&id=${shelf.id}">Edit</a></button> |
                    <form action="${pageContext.request.contextPath}/shelves" method="post" style="display:inline;">
                        <input type="hidden" name="action" value="delete"/>
                        <input type="hidden" name="id" value="${shelf.id}"/>
                        <button type="submit">Delete</button>
                    </form>
                </td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
