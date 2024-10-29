<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Shelves of Room ${room.name} </title>
</head>
<body>
	<a href="${pageContext.request.contextPath}/rooms">&larr; Back</a>
    <h1>Shelf List of Room ${room.name}</h1>
	<p>Total shelves: ${shelves.size()}</p>
	<p>
    <table border="1">
        <tr>
            <th>Book Category</th>
            <th>Available Stock</th>
            <th>Borrowed Number</th>
            <th>Initial Stock</th>
            <th>Room</th>
        </tr>
        <c:forEach var="shelf" items="${shelves}">
            <tr>
                <td>${shelf.bookCategory}</td>
                <td>${shelf.availableStock}</td>
                <td>${shelf.borrowedNumber}</td>
                <td>${shelf.initialStock}</td>
                <td>${shelf.room.name}</td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
