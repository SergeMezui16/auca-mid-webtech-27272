<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Create Location</title>
</head>
<body>
	<h1>Create Location</h1>
	<form action="${pageContext.request.contextPath}/locations"
		method="post">
		<input type="hidden" name="action" value="create" /> 
		<label>Location
			Type:</label> <select id="selectType" name="type" required>
			<c:forEach var="type" items="${types}">
				<option value="${type}">${type}</option>
			</c:forEach>
		</select><br /> 
		<input
			type="hidden" name="id" /> <label>Location Code:</label> <input
			type="text" name="code" required /><br /> <label>Location
			Name:</label> <input type="text" name="name" required /><br /> 
			<label>Parent Location:</label> <select id="parentId" name="parentId">
			<option data-type="NULL" value="" selected="selected">NULL</option>
			<c:forEach var="loc" items="${locations}">
				<option data-type="${loc.type}" value="${loc.id}">${loc.type}
					: ${loc.name}</option>
			</c:forEach>
		</select><br />

		<button type="submit">Create</button>
	</form>
	
	<script type="text/javascript">
		const selectType = document.getElementById("selectType");
		const selectLocation = document.getElementById("parentId");	
		
		const handleChange = () => {
			if(selectType.value == null) {
				selectLocation.disabled = true;
			}
			
			Array.from(selectLocation.options).map(option => {
				
				switch(selectType.value) {
				case "VILLAGE": 
					option.dataset.type != "CELL" ? option.hidden = true : option.hidden = false
					break;
				case "CELL": 
					option.dataset.type != "SECTOR" ? option.hidden = true : option.hidden = false
					break;
				case "SECTOR": 
					option.dataset.type != "DISTRICT" ? option.hidden = true : option.hidden = false
					break;
				case "DISTRICT": 
					option.dataset.type != "PROVINCE" ? option.hidden = true : option.hidden = false
					break;
				case "PROVINCE": 
					option.dataset.type != "NULL" ? option.hidden = true : option.hidden = false
					break;
				}
			})
		}

		handleChange(); 
		
		selectType.addEventListener("change", () => handleChange())
	</script>
</body>
</html>
