<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en">
<head>
<title>AUCA MLS - Register</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link
	href="https://bootswatch.com/5/journal/bootstrap.css"
	rel="stylesheet"
	>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
	crossorigin="anonymous"></script>
	
	    <style>
        body {
            background-color: #f5f5f5;
        }
        .login-container {
            display: flex;
            align-items: center;
            justify-content: center;
            min-height: 100vh;
        }
        .login-card {
            width: 100%;
            padding: 2rem;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            background-color: #fff;
        }
        .login-card .btn-primary {
            background-color: #007bff;
            border: none;
        }
        .login-card .btn-primary:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
	
<div class="login-container">
    <div class="login-card">
        <h4 class="text-center mb-4">Welcome to AUCA MLS</h4>
        <form action="${pageContext.request.contextPath}/register" method="post">
            <div class="d-flex gap-3">
			<fieldset class="flex-grow-1">
				<input type="hidden" name="action" value="create" />
		         <div class="form-group">
		             <label for="username">ID/Username:</label>
			        <input type="text" class="form-control ${errorMessage != null ? 'is-invalid' : '' }" name="username" id="username" required />
			        <span class="invalid-feedback">
	                    ${errorMessage}
	                </span>
		         </div>
		         <div class="form-group">
		             <label for="password">Password:</label>
			        <input type="password" class="form-control" name="password" id="password" required />
		         </div>
				<div class="form-group">
	             	<label for="role">Role:</label>
			        <select id="role" class="form-control" name="role" required>
					<c:forEach var="role" items="${roles}">
						<option value="${role}">${role}</option>
					</c:forEach>
			        </select>
	         	</div>
				
				<div class="form-group">
	             	<label for="villageId">Village:</label>
			        <select id="villageId" class="form-control" name="villageId" required>
					<c:forEach var="location" items="${locations}">
						<option value="${location.id}">${location.code}: ${location.name}</option>
					</c:forEach>
			        </select>
	         	</div>
			</fieldset>

			<fieldset  class="flex-grow-1">			
		         <div class="form-group">
		             <label for="firstname">First name:</label>
			        <input type="text" class="form-control" name="firstname" id="firstname" required />
		         </div>
		         <div class="form-group">
		             <label for="lastname">Last name:</label>
			        <input type="text" class="form-control" name="lastname" id="lastname" required />
		         </div>
		         <div class="form-group">
		             <label for="phone">Phone number:</label>
			        <input type="text" class="form-control" name="phone" id="phone" required />
		         </div>
				<div class="form-group">
	             	<label for="gender">Gender:</label>
			        <select id="gender" class="form-control" name="gender" required>
					<c:forEach var="gender" items="${genders}">
						<option value="${gender}">${gender}</option>
					</c:forEach>
			        </select>
	         	</div>
	
			</fieldset>
		</div>
       	<div class="d-flex justify-content-between mt-2">
       		<p>You already have an account ? <a href="${pageContext.request.contextPath}/login">Login here</a></p>
       		<button type="submit" class="btn btn-primary">Create</button>
       	</div>
        </form>
    </div>
</div>

</body>
</html>

