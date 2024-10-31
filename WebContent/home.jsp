<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en">
<head>
	<title>Home Page</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/purecss@3.0.0/build/pure-min.css"
		integrity="sha384-X38yfunGUhNzHpBaEBsWLO+A0HDYOQi8ufWDkZ0k9e0eXz/tH3II7uKZ9msv++Ls" crossorigin="anonymous">
	<link rel="stylesheet" href="./style/index.css" />
	<link rel="stylesheet" href="./style/login.css" />
  <script src="./script.js"></script>
</head>

<body>
	<div class="container">
    <header>
      <h1>Hello ${pageContext.session.getAttribute("user")}!</h1>
      <div>
        <h2 id="role">${pageContext.session.getAttribute("user").role}</h2>
        <c:if test="${pageContext.session.getAttribute('user') != null}">
        <form action="${pageContext.request.contextPath}/security?action=logout" method="post">
        	<button type="submit">Logout</button>
        </form>
        </c:if>
      </div>
    </header>
    <hr>
    <div class="center-box">
		<a href="rooms">Rooms</a> | 
		<a href="shelves">Shelves</a> |
		<a href="books">Books</a> |
		<a href="locations">Locations</a>|
		<a href="users">Users</a>|
		<a href="membership_types">MembershipType</a>|
		<a href="memberships">Memberships</a>|
		<a href="security">Login</a>
    </div>
  </div>
</body>

</html>