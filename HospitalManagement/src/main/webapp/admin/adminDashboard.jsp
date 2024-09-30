<%@ page import="com.dao.DoctorDao" %>
<%@ page import="com.conn.DbConnect" %>
<%@ page import="com.dao.AppointmentDao" %>
<%@ page import="com.dao.UserDao" %>
<%@ page import="com.dao.SpecialistDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<c:if test="${empty adminObj}">
	<c:redirect url="//admin_login.jsp"></c:redirect>
</c:if>

<!DOCTYPE html>
<html lang="en-US">
<head>
	<title>Admin Dashboard</title>

	<%@ include file="/component/bootstrap_cdn.jsp" %>
	<style>
        .paint-card {
            box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
        }
	</style>
</head>
<body style="background-color: #F2F3F4;">
	<%@ include file="/admin/admin_nav.jsp" %>
	<c:if test="${not empty suc_msg}">
		<p class="text-center text-success fs-5">${suc_msg}</p>
		<c:remove var="suc_msg" scope="session"></c:remove>
	</c:if>
	<c:if test="${not empty msg}">
		<p class="text-center fs-5" style="color: red;">${msg}</p>
		<c:remove var="msg" scope="session"></c:remove>
	</c:if>

	<%
		DoctorDao docDao = new DoctorDao(DbConnect.getConnection());
		SpecialistDao specDao = new SpecialistDao(DbConnect.getConnection());
		UserDao userDao = new UserDao(DbConnect.getConnection());
		AppointmentDao appointDao = new AppointmentDao(DbConnect.getConnection());
	%>

	<div class="row p-5 g-3" style="height: 80vh;">
		<div class="col-md-6">
			<div class="card paint-card">
				<div class="card-body text-center text-success">
					<i class="fas fa-user-md fa-3x"></i><br>
					<p class="fs-4 text-center">
						Doctor<br>
						<%= docDao.countDoctors()%>
					</p>
				</div>
			</div>
		</div>
		<div class="col-md-6">
			<div class="card paint-card">
				<div class="card-body text-center text-success">
					<i class="fas fa-user-circle fa-3x"></i><br>
					<p class="fs-4 text-center">
						User<br>
						<%= userDao.countUsers()%>
					</p>
				</div>
			</div>
		</div>
		<div class="col-md-6">
			<div class="card paint-card">
				<div class="card-body text-center text-success">
					<i class="fas fa-calendar-check fa-3x"></i><br>
					<p class="fs-4 text-center">
						Total Appointments<br>
						<%= appointDao.countAppointments()%>
					</p>
				</div>
			</div>
		</div>
		<div class="col-md-6">
			<div class="card paint-card">
				<div class="card-body text-center text-success d-flex justify-content-center">
					<div class="w-50 cursor-pointer" role="button" data-bs-toggle="modal" data-bs-target="#exampleModal">
						<i class="fas fa-user-md fa-3x"></i><br>
						<p class="fs-4 text-center">
							Available Specialists<br>
							<%= specDao.countSpecialists()%>
						</p>
					</div>

				</div>
			</div>
		</div>
	</div>



	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h1 class="modal-title fs-6" id="exampleModalLabel">Enter new specialist:</h1>
				</div>
				<div class="modal-body">
					<form method="post" action="../specialist">
						<input type="text" class="form-control" name="specialistName" placeholder="Enter specialist name...">
						<div class="d-flex justify-content-between">
							<button type="submit" class="btn btn-success mt-2">Add Specialist</button>
							<button type="button" class="btn btn-danger mt-2" data-bs-dismiss="modal">Close</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<div class="mt-5" >
		<%@ include file="/component/footer.jsp" %>
	</div>
</body>
</html>
