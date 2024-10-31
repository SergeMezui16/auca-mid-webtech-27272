<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Locations</title>
</head>
<body>
	<a href="${pageContext.request.contextPath}/">&larr; Back home</a>
    <h1>Locations</h1>
	<p>Total locations: ${locations.size()}</p>
    <a href="${pageContext.request.contextPath}/locations?action=new">Add New Location</a>
    <table border="1">
        <tr>
            <th>Code</th>
            <th>Name</th>
            <th>Type</th>
            <th>Parent Location</th>
            <th>Parent type</th>
            <th>Actions</th>
        </tr>
        <c:forEach var="location" items="${locations}">
            <tr>
                <td>${location.code}</td>
                <td>${location.name}</td>
                <td>${location.type}</td>
                <td> 
                 ${location.parent != null ? location.parent.name : 'N/A'}
                 </td>
                <td>${location.parent != null ? location.parent.type : 'N/A'}</td>
                <td>
                
                    <button><a href="${pageContext.request.contextPath}/locations?action=edit&id=${location.id}">Edit</a></button> |
                    <form action="${pageContext.request.contextPath}/locations" method="post" style="display:inline;">
                        <input type="hidden" name="action" value="delete"/>
                        <input type="hidden" name="id" value="${location.id}"/>
                        <button type="submit" onclick="return confirm('Are you sure?')">Delete</button>
                    </form>
                </td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
