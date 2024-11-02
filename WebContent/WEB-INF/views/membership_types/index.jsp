<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../../../partials/header.jsp" />

<div class="container">
    <h1>Membership types List</h1>
	<p>Total: ${membershipTypes.size()}</p>
    <a class="btn btn-primary" href="${pageContext.request.contextPath}/membership_types?action=new">Add New Membership Type</a>
	<hr>
    <table class="table table-striped">
	  <thead>
        <tr>
        <tr>
            <th>Name</th>
            <th>Price</th>
            <th>Max Book</th>
            <th>Actions</th>
        </tr>
        </tr>
	  </thead>
	  <tbody>
        <c:forEach var="membershipType" items="${membershipTypes}">
            <tr>
                <td>${membershipType.name}</td>
                <td>${membershipType.price}</td>
                <td>${membershipType.maxBooks}</td>
                <td>
                    <a  class="btn btn-secondary" href="${pageContext.request.contextPath}/membership_types?action=edit&id=${membershipType.id}">Edit</a>
                    <form action="${pageContext.request.contextPath}/membership_types" method="post" style="display:inline;">
                        <input type="hidden" name="action" value="delete"/>
                        <input type="hidden" name="id" value="${membershipType.id}"/>
                        <button class="btn btn-secondary" type="submit" onclick="return confirm('Are you sure?')">Delete</button>
                    </form>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<jsp:include page="../../../partials/footer.jsp" />
