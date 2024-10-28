<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>List of Rooms</title>
</head>
<body>
    <h1>Room List</h1>
    <a href="${pageContext.request.contextPath}/rooms?action=new">Create New Room</a>
    <br>
    <table border="1">
        <tr>
            <th>Code</th>
            <th>Name</th>
            <th>Actions</th>
        </tr>
        <c:forEach var="room" items="${rooms}">
            <tr>
                <td>${room.code}</td>
                <td>${room.name}</td>
                <td>
                    <a href="${pageContext.request.contextPath}/rooms?action=edit&id=${room.id}">Edit</a> |
                    <form action="${pageContext.request.contextPath}/rooms" method="post" style="display:inline;">
                        <input type="hidden" name="action" value="delete"/>
                        <input type="hidden" name="id" value="${room.id}"/>
                        <button type="submit">Delete</button>
                    </form>
                </td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
