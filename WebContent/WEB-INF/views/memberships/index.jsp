<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Memberships</title>
</head>
<body>
	<a href="${pageContext.request.contextPath}/">&larr; Back home</a>
    <h1>Memberships</h1>
    <table border="1">
        <tr>
            <th>Reader</th>
            <th>Membership type</th>
            <th>Status</th>
            <th>Start at</th>
            <th>Issue</th>
            <th>Actions</th>
        </tr>
        <c:forEach var="membership" items="${memberships}">
            <tr>
                <td>${membership.reader.name}</td>
                <td>${membership.type.name}</td>
                <td>${membership.status}</td>
                <td>${membership.registrationDate}</td>
                <td>${membership.expiringTime}</td>
                <td>
                    <button><a href="${pageContext.request.contextPath}/memberships?action=approve&id=${membership.id}">Approve</a></button> |
                    <button><a href="${pageContext.request.contextPath}/memberships?action=reject&id=${membership.id}">Reject</a></button>
                    <form action="${pageContext.request.contextPath}/membership_types" method="post" style="display:inline;">
                        <input type="hidden" name="action" value="delete"/>
                        <input type="hidden" name="id" value="${membership.id}"/>
                        <button type="submit" onclick="return confirm('Are you sure?')">Delete</button>
                    </form>
                </td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
