<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<jsp:include page="../../../partials/header.jsp" />

<div class="container">
	<h1>Ask for Membership</h1>
	<form action="${pageContext.request.contextPath}/memberships"
		method="post">
		<input type="hidden" name="action" value="ask" />
		
		<label>Name: <input required name="name" type="text" /></label> <br>
		<label>Price: <input required name="price" type="number" /></label> <br>
		<label>Max Books: <input required name="maxBooks" type="number" /></label> <br>
		
		<button type="submit">Submit</button>
	</form>
</div>

<jsp:include page="../../../partials/footer.jsp" />
