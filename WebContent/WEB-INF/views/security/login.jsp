<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en">
<head>
<title>AUCA MLS - login</title>
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
            max-width: 400px;
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
        <h4 class="text-center mb-4">Welcome Back</h4>
        <form action="${pageContext.request.contextPath}/login" method="post">
            <div class="form-group">
                <label for="email">Email address</label>
                <input autofocus type="text" class="form-control ${errorMessage != null ? 'is-invalid' : '' }" id="email" name="username" placeholder="Enter email" required>
                <span class="invalid-feedback">
                    ${errorMessage}
                </span>
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" class="form-control" id="password" name="password" placeholder="Password" required>
            </div>
            <div class="d-grid gap-2">
<button type="submit" class="btn btn-primary w-full mt-4 text-center">Login</button>
			</div>
			            
            <div class="text-center mt-3">
				<p>You don't have an account ? <a href="${pageContext.request.contextPath}/register">Register here</a></p>
            </div>
			            
            <div class="text-center mt-3">
				<c:if test="${auth != null}">
				<p>You are already logged as ${auth}.<br> Do you want to login as someone else or <a href="${pageContext.request.contextPath}/">go back home</a></p>
				</c:if>
            </div>
        </form>
    </div>
</div>

</body>
</html>

