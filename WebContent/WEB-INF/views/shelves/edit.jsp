<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Edit Shelf</title>
</head>
<body>
    <h1>Edit Shelf</h1>
    <form action="${pageContext.request.contextPath}/shelves" method="post">
        <input type="hidden" name="action" value="update"/>
        <input type="hidden" name="id" value="${shelf.id}"/>
        <label for="bookCategory">Book Category:</label>
        <input type="text" id="bookCategory" value="${shelf.bookCategory}" name="bookCategory" required>
        <br><br>
        <label for="initialStock">Initial Stock:</label>
        <input type="number" id="initialStock" value="${shelf.initialStock}" name="initialStock" required>
        <br><br>
        <label for="room">Room:</label>
        <select id="room" name="roomId" required>
            <c:forEach var="room" items="${rooms}">
                <option <c:if test="${room.id == shelf.room.id }">selected="true"</c:if> value="${room.id}">${room.name}</option>
            </c:forEach>
        </select>
        <br><br>
        <button type="submit">Update Shelf</button>
    </form>
</body>
</html>
