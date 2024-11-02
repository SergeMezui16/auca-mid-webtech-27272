<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../../../partials/header.jsp" />

<div class="container">
	<h1>Create Location</h1>
    <hr>
	<form action="${pageContext.request.contextPath}/locations"
		style="max-width: 400px;" method="post">
		<input type="hidden" name="action" value="create" /> 
		
         <div class="form-group">
             <label for="selectType">Location type:</label>
	        <select id="selectType" class="form-control" name="type" required>
				<c:forEach var="type" items="${types}">
					<option value="${type}">${type}</option>
				</c:forEach>
	        </select>
         </div>
         
         
         <div class="form-group">
             <label for="code">Code:</label>
	        <input type="text" class="form-control" name="code" id="code" required />
         </div>
         
         <div class="form-group">
             <label for="name">Name:</label>
	        <input type="text" class="form-control" name="name" id="name" required />
         </div>
         <div class="form-group">
             <label for="parentId">Location type:</label>
	        <select id="parentId" class="form-control" name="parentId" required>
				<option data-type="NULL" value="" selected="selected">NULL</option>
				<c:forEach var="loc" items="${locations}">
					<option data-type="${loc.type}" value="${loc.id}">${loc.type}
						: ${loc.name}</option>
				</c:forEach>
	        </select>
         </div>

       	<div class="text-end mt-2">
       		<button type="submit" class="btn btn-primary">Create</button>
       	</div>
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
</div>
<jsp:include page="../../../partials/footer.jsp" />
