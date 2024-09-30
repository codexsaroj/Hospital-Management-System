<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>


<!DOCTYPE html>
<html>
<head>
	<title>Admin Login</title>
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
					<p class="text-center fs-4"><i class="fa-solid fa-user-tie"></i></p>

					<c:if test="${not empty msg}">
						<p class="text-center fs-6" style="color: red;">${msg}</p>
						<c:remove var="msg" scope="session"></c:remove>
					</c:if>

					<form action="adminLogin" method="post">
						<div class="mb-3">
							<label for="uemail" class="form-label">Email/Username</label>
							<input type="text" name="uemail" class="form-control" id="uemail"
							       placeholder="Username/Email"
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
						<button type="submit" class="btn bg-success text-white col-md-12">Submit</button>
					</form>
					<br>
					<p>Don't have an account? <a style="text-decoration: none " href="sign_up.jsp">Create One</a></p>
				</div>
			</div>
		</div>
	</div>
</div>

<%@ include file="component/footer.jsp" %>
</body>
</html>


