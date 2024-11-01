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
                   	<form action="${pageContext.request.contextPath}/memberships" method="post" style="display:inline;">
                        <input type="hidden" name="action" value="approve"/>
                        <input type="hidden" name="id" value="${membership.id}"/>
                        <button type="submit" onclick="return confirm('Are you sure?')">Approve</button>
                    </form>
                    <form action="${pageContext.request.contextPath}/memberships" method="post" style="display:inline;">
                        <input type="hidden" name="action" value="reject"/>
                        <input type="hidden" name="id" value="${membership.id}"/>
                        <button type="submit" onclick="return confirm('Are you sure?')">Reject</button>
                    </form>
                </td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
