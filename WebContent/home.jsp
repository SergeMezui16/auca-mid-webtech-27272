<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
      <h1>Hello !</h1>
      <div>
        <h2 id="role">___ROLE___</h2>
        <a href="logout" class="btn btn-danger">Logout!</a>
      </div>
    </header>
    <hr>
    <div class="center-box">
		<a href="rooms">Rooms</a>
    </div>
  </div>
</body>

</html>