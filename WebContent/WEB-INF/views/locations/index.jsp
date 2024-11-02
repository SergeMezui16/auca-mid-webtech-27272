<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../../../partials/header.jsp" />

<div class="container">
    <h1>Locations List</h1>
	<p>Total: ${locations.size()}</p>
    <c:if test="${auth.canWrite()}"><a class="btn btn-primary" href="${pageContext.request.contextPath}/locations?action=new">Add New Location</a></c:if>
    <hr>
    <table class="table table-striped">
	  <thead>
        <tr>
            <th>Code</th>
            <th>Name</th>
            <th>Type</th>
            <th>Parent Location</th>
            <th>Parent type</th>
            <c:if test="${auth.canWrite()}"><th>Actions</th></c:if>
        </tr>
	  </thead>
	  <tbody>
        <c:forEach var="location" items="${locations}">
            <tr>
                <td>${location.code}</td>
                <td>${location.name}</td>
                <td>${location.type}</td>
                <td> 
                 ${location.parent != null ? location.parent.name : 'N/A'}
                 </td>
                <td>${location.parent != null ? location.parent.type : 'N/A'}</td>
                <c:if test="${auth.canWrite()}">
                <td>
                	<a class="btn btn-secondary" href="${pageContext.request.contextPath}/locations?action=edit&id=${location.id}">Edit</a>
                    <form action="${pageContext.request.contextPath}/locations" method="post" style="display:inline;">
                        <input type="hidden" name="action" value="delete"/>
                        <input type="hidden" name="id" value="${location.id}"/>
                        <button class="btn btn-secondary" type="submit" onclick="return confirm('Are you sure?')">Delete</button>
                    </form>
                </td>
                </c:if>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<jsp:include page="../../../partials/footer.jsp" />
