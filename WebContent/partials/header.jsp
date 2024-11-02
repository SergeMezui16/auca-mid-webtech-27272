<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="en">
<head>
<title>AUCA MLS</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link
	href="https://bootswatch.com/5/journal/bootstrap.css"
	rel="stylesheet"
	>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>
</head>

<body>
<nav class="navbar navbar-expand-lg bg-dark" data-bs-theme="dark">
  <div class="container">
    <a class="navbar-brand" href="${pageContext.request.contextPath}/">AUCA MLS</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor02" aria-controls="navbarColor02" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarColor02">
      <ul class="navbar-nav me-auto">
        <li class="nav-item">
          <a class="nav-link" href="${pageContext.request.contextPath}/">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="${pageContext.request.contextPath}/security?action=profile">Profile</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#"></a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Books</a>
          <div class="dropdown-menu">
            <a class="dropdown-item" href="${pageContext.request.contextPath}/rooms">Rooms</a>
            <a class="dropdown-item" href="${pageContext.request.contextPath}/shelves">Shelves</a>
            <a class="dropdown-item" href="${pageContext.request.contextPath}/books">Books</a>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item" href="${pageContext.request.contextPath}/borrowers">Borrowers</a>
          </div>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#"></a>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Membership</a>
          <div class="dropdown-menu">
            <a class="dropdown-item" href="${pageContext.request.contextPath}/membership_types">Membership types</a>
            <a class="dropdown-item" href="${pageContext.request.contextPath}/memberships">Memberships</a>
            <a class="dropdown-item" href="${pageContext.request.contextPath}/users">Users</a>
            <div class="dropdown-divider"></div>
            <a class="dropdown-item" href="${pageContext.request.contextPath}/locations">Locations</a>
          </div>
        </li>
      </ul>
      <form class="d-flex" method="get" action="${pageContext.request.contextPath}/users">
        <input class="form-control me-sm-2" type="search" name="phone" placeholder="Search by phone number">
		<input type="hidden" name="action" value="find">
        <button class="btn btn-secondary my-2 my-sm-0" type="submit">Search</button>
      </form>
		<form
			action="${pageContext.request.contextPath}/security?action=logout"
			method="post" class="mx-2">
			<button class="btn btn-danger my-2 my-sm-0"  type="submit">Logout</button>
		</form>
    </div>
  </div>
</nav>