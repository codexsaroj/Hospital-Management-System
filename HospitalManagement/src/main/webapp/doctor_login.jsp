<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
	<title>Doctor Login</title>
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
					<p class="text-center fs-4"><i class="fa-solid fa-user-doctor"></i></p>
					<c:if test="${not empty suc_msg}">
						<p class="text-success">${suc_msg}</p>
						<c:remove var="suc_msg" scope="session"></c:remove>
					</c:if>
					<c:if test="${not empty fail_msg}">
						<p class="text-danger">${fail_msg}</p>
						<c:remove var="fail_msg" scope="session"></c:remove>
					</c:if>
					<form action="docLogin" method="post">
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
					<p>Don't have an account? <a style="text-decoration: none " href="admin_login.jsp">Create One</a></p>
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


