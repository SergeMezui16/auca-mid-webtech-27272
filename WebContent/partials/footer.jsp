<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
	<c:if test="${auth.canRead()}">
	<div class="d-flex gap-3 mt-5 justify-content-center">
		<a href="rooms">Rooms</a><a href="shelves">Shelves</a><a href="books">Books</a><a
			href="locations">Locations</a><a href="users">Users</a><a
			href="membership_types">MembershipType</a> <a href="memberships">Memberships</a><a href="borrowers">Borrowers</a>
	</div>
	</c:if>
    <!-- Footer -->
    <footer class="text-center mt-3">
        <p>&copy; AUCA Library Management System.</p>
    </footer>
</body>
</html>