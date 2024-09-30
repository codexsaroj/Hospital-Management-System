<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<title>Sign Up</title>
	<%@ include file="component/bootstrap_cdn.jsp" %>

	<style>
        .paint-card {
            box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
        }
	</style>
</head>
<body>
<%@ include file="component/navbar.jsp" %>


<div class="container" style="height: 84vh;">
	<div class="row position-relative d-flex align-items-center" style="height: 70vh;">
		<div class="col-md-4 offset-md-4">
			<div class="card paint-card">
				<div class="card-body">
					<p class="text-center fs-4">User Register</p>
					<c:if test="${not empty failure_msg}">
						<p class="text-center fs-5" style="color: red;">${failure_msg}</p>
						<c:remove var="failure_msg" scope="session"></c:remove>
					</c:if>
					<form action="register" method="post">
						<div class="mb-3">
							<label for="name" class="form-label">Full Name</label>
							<input type="text" name="name" class="form-control" id="name"
							       placeholder="abc"
							       style="background-color: #F0F3F4;"
							       required>
						</div>
						<div class="mb-3">
							<label for="email" class="form-label">Email</label>
							<input type="email" name="email" class="form-control" id="email"
							       placeholder="xyz@gmail.com"
							       style="background-color: #F0F3F4;"
							       required>
						</div>
						<div class="mb-3">
							<label for="password" class="form-label">Password</label>
							<input type="password" class="form-control" id="password" style="background-color: #F0F3F4;"
							       name="password"
							       placeholder="*******"
							       required>
						</div>
						<button type="submit" class="btn bg-success text-white col-md-12">Register</button>
					</form>
					<br>
					<p>Don't have an account? <a style="text-decoration: none " href="sign_up.jsp">Create One</a></p>
				</div>
			</div>
		</div>
	</div>
</div>


<%--Footer of the page--%>
<div class="mt-5" >
	<%@ include file="/component/footer.jsp" %>
</div></body></body>
</html>
