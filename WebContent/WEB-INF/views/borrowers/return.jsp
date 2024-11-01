<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Return book</title>
</head>
<body>
    <h1>Return Book ${borrower.book.title}</h1>
    <p>Reader: ${borrower.reader.name}</p>
    <p>Due date: ${borrower.dueDate}</p>
    <form action="borrowers" method="post">
        <input type="hidden" name="action" value="return" />
        <input type="hidden" name="id" value="${borrower.id}" />
        <label>Return date: <input type="date" name="returnDate" /></label><br/>
        <label>Late Fees: <input type="number" name="lateChargeFees" value="0"/></label><br/>
        
        <button type="submit">Return</button>
    </form>
</body>
</html>
