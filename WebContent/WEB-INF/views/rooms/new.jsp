<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Create Room</title>
</head>
<body>
    <h1>Create Room</h1>
    <form action="${pageContext.request.contextPath}/rooms" method="post">
        <input type="hidden" name="action" value="create"/>
        <label for="code">Code:</label>
        <input type="text" id="code" name="code" required>
        <br><br>
        <label for="name">Room Name:</label>
        <input type="text" id="name" name="name" required>
        <br><br>
        <button type="submit">Create Room</button>
    </form>
</body>
</html>
