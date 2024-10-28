<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Edit Room</title>
</head>
<body>
    <h1>Edit Room</h1>
    <form action="${pageContext.request.contextPath}/rooms" method="post">
        <input type="hidden" name="action" value="update"/>
        <label for="code">Code:</label>
        <input type="text" id="code" name="code" value="${room.code}" required>
        <br><br>
        <input type="hidden" name="id" value="${room.id}"/>
        <label for="name">Room Name:</label>
        <input type="text" id="name" name="name" value="${room.name}" required>
        <br><br>
        <button type="submit">Update Room</button>
    </form>
</body>
</html>
