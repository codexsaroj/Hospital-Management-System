<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<c:if test="${empty userObj}">
	<c:redirect url="user_login.jsp"></c:redirect>
</c:if>


<!DOCTYPE html>
<html>
<head>
	<title>User Password Change</title>
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
				<p class="text-center fs-3">Change Password</p>
				<div class="card-body">
					<c:if test="${not empty suc_msg}">
						<p class="text-success">${suc_msg}</p>
						<c:remove var="suc_msg" scope="session"></c:remove>
					</c:if>
					<c:if test="${not empty fail_msg}">
						<p class="text-danger">${fail_msg}</p>
						<c:remove var="fail_msg" scope="session"></c:remove>
					</c:if>
					<form action="changePassword" method="post">
						<input type="hidden" name="userId" value="${userObj.id}">
						<div class="mb-3">
							<label for="pswd1" class="form-label">Enter Old Password</label>
							<input type="password" name="oldPassword" class="form-control" id="pswd1"
							       placeholder="*******"
							       style="background-color: #F0F3F4;"
							       required>
						</div>
						<div class="mb-3">
							<label for="pswd2" class="form-label">Enter New Password</label>
							<input type="password" class="form-control" id="pswd2" style="background-color: #F0F3F4;"
							       name="newPassword"
							       placeholder="*******"
							       required>
						</div>
						<button type="submit" class="btn bg-success text-white col-md-12">Change Password</button>
					</form>
					<br>
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


