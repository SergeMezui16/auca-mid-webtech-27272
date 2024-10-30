<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Membership types</title>
</head>
<body>
	<a href="${pageContext.request.contextPath}/">&larr; Back home</a>
    <h1>Membership types</h1>
    <a href="${pageContext.request.contextPath}/membership_types?action=new">Add New Membership Type</a>
    <table border="1">
        <tr>
            <th>Name</th>
            <th>Price</th>
            <th>Max Book</th>
            <th>Actions</th>
        </tr>
        <c:forEach var="membershipType" items="${membershipTypes}">
            <tr>
                <td>${membershipType.name}</td>
                <td>${membershipType.price}</td>
                <td>${membershipType.maxBooks}</td>
                <td>
                    <button><a href="${pageContext.request.contextPath}/membership_types?action=edit&id=${membershipType.id}">Edit</a></button> |
                    <form action="${pageContext.request.contextPath}/membership_types" method="post" style="display:inline;">
                        <input type="hidden" name="action" value="delete"/>
                        <input type="hidden" name="id" value="${membershipType.id}"/>
                        <button type="submit" onclick="return confirm('Are you sure?')">Delete</button>
                    </form>
                </td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
