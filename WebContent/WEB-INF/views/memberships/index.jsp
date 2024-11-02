<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../../../partials/header.jsp" />

<div class="container">
    <h1>Memberships List</h1>
	<p>Total: ${memberships.size()}</p>
	<hr>
    <table class="table table-striped">
	  <thead>
        <tr>
            <th>Reader</th>
            <th>Membership type</th>
            <th>Status</th>
            <th>Start at</th>
            <th>Issue</th>
            <th>Actions</th>
        </tr>
	  </thead>
	  <tbody>
        <c:forEach var="membership" items="${memberships}">
            <tr>
                <td>${membership.reader.name}</td>
                <td>${membership.type.name}</td>
                <td>${membership.status}</td>
                <td>${membership.registrationDate}</td>
                <td>${membership.expiringTime}</td>
                <td>
                   	<c:if test="${membership.isPending() == true }">
                   	<form action="${pageContext.request.contextPath}/memberships" method="post" style="display:inline;">
                        <input type="hidden" name="action" value="approve"/>
                        <input type="hidden" name="id" value="${membership.id}"/>
                        <button type="submit" class="btn btn-secondary" onclick="return confirm('Are you sure?')">Approve</button>
                    </form>
                    <form action="${pageContext.request.contextPath}/memberships" method="post" style="display:inline;">
                        <input type="hidden" name="action" value="reject"/>
                        <input type="hidden" name="id" value="${membership.id}"/>
                        <button type="submit" class="btn btn-secondary" onclick="return confirm('Are you sure?')">Reject</button>
                    </form>
                   	</c:if>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<jsp:include page="../../../partials/footer.jsp" />