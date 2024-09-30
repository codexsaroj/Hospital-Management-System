<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>


<!DOCTYPE html>
<html>
<head>
	<title>User Login</title>
	<%@ include file="component/bootstrap_cdn.jsp" %>

	<style>

		body{
			box-sizing: border-box;
		}

        .paint-card {
	        position: relative;
	        border-radius: 10px;
	        padding: 3px;
	        box-shadow: 0 0 10px 0 rgba(0,0,0,.4), 0 6px 20px 0 rgba(0, 0, 0, 0.5);
        }
	</style>
</head>
<body>
<%@ include file="component/navbar.jsp" %>
<div class="container" style="height: 80vh;">
	<div class="row position-relative d-flex align-items-center" style="height: 70vh;">
		<div class="col-md-4 offset-md-4">
			<div class="card paint-card">
				<div class="card-body p-3">
					<p class="text-center fs-4">
						<i class="fa-solid fa-user"></i><br>
					</p>
					<c:if test="${not empty success_msg}">
						<p class="text-center fs-5" style="color: green;">${success_msg}</p>
						<c:remove var="success_msg" scope="session"></c:remove>
					</c:if>
					<c:if test="${not empty failure_msg}">
						<p class="text-center fs-5" style="color: red;">${failure_msg}</p>
						<c:remove var="failure_msg" scope="session"></c:remove>
					</c:if>

					<form action="userLogin" method="post">
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

						<button type="submit" class="btn bg-success text-white col-md-12">Submit</button>
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


