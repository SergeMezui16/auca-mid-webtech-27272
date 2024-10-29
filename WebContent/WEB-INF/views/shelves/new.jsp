<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Create Shelf</title>
</head>
<body>
    <h1>Create Shelf</h1>
    <form action="${pageContext.request.contextPath}/shelves" method="post">
        <input type="hidden" name="action" value="create"/>
        <label for="bookCategory">Book Category:</label>
        <input type="text" id="bookCategory" name="bookCategory" required>
        <br><br>
        <label for="availableStock">Available Stock:</label>
        <input type="number" id="availableStock" name="availableStock" required>
        <br><br>
        <label for="borrowedNumber">Borrowed Number:</label>
        <input type="number" id="borrowedNumber" name="borrowedNumber" required>
        <br><br>
        <label for="initialStock">Initial Stock:</label>
        <input type="number" id="initialStock" name="initialStock" required>
        <br><br>
        <label for="room">Room:</label>
        <select id="room" name="roomId" required>
            <c:forEach var="room" items="${rooms}">
                <option value="${room.id}">${room.name}</option>
            </c:forEach>
        </select>
        <br><br>
        <button type="submit">Create Shelf</button>
    </form>
</body>
</html>
