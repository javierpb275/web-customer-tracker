<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %><!-- Add support for JSTL Core tags -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %><!-- FORM tags -->

<!DOCTYPE html>

<html>

<head>
	<title>List Customers</title>
	
	<!-- reference our style sheet -->

	<link type="text/css"
		  rel="stylesheet"
		  href="${pageContext.request.contextPath}/resources/css/style.css" />

</head>

<body>

	<div id="wrapper">
		<div id="header">
			<h2>CRM - Customer Relationship Manager</h2>
		</div>
	</div>
	
	<div id="container">
	
		<div id="content">
		
		<!-- put new button: Add Customer -->
		
		<input type="button" value="Add Customer"
			onClick="window.location.href='showFormForAdd'; return false;"
			class="add-button"
		/><!-- Call our Spring Controller mapping -->
		
		<!--  add a search box -->
            <form:form action="search" method="POST">
                Search customer: <input type="text" name="theSearchName" />
                
                <input type="submit" value="Search" class="add-button" />
            </form:form>
		
			<!--  add our html table here -->
		
			<table>
				<tr>
					<th>First Name</th>
					<th>Last Name</th>
					<th>Email</th>
					<th>Action</th>
				</tr>
				
				<!-- loop over and print our customers -->
				<c:forEach var="tempCustomer" items="${customers}"><!-- customers is the name of our Model -->
				
				<!-- construct an "update" link with customer id -->
				<c:url var="updateLink" value="/customer/showFormForUpdate">
					<c:param name="customerId" value="${tempCustomer.id}" />
				</c:url>
				
				<!-- construct an "delete" link with customer id -->
				<c:url var="deleteLink" value="/customer/delete">
					<c:param name="customerId" value="${tempCustomer.id}" />
				</c:url>
				
					<tr>
					
						<td> ${tempCustomer.firstName} </td><!-- Call tempCustomer.getFirstName() -->
						<td> ${tempCustomer.lastName} </td>
						<td> ${tempCustomer.email} </td>
					<td>
					
						<!-- display the update link -->
						 <a href="${updateLink }">
						 Update
						 </a>
						 
						 <!-- display the delete link -->
						 <a href="${deleteLink }" onClick="if (!(confirm('Are you sure you want to delete this customer?'))) return false">
						 Delete
						 </a>
						 
					</td>
					
					</tr>
				
				</c:forEach>
						
			</table>
				
		</div>
	
	</div>
	

</body>

</html>