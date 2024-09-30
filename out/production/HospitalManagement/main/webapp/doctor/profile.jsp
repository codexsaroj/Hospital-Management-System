<%@ page import="com.dao.DoctorDao" %>
<%@ page import="com.dao.AppointmentDao" %>
<%@ page import="com.conn.DbConnect" %>
<%@ page import="com.entity.Doctor" %>
<%@ page import="com.dao.SpecialistDao" %>
<%@ page import="com.entity.Specialist" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>

<c:if test="${empty docObj}">
	<c:redirect url="../doctor_login.jsp"></c:redirect>
</c:if>


<head>
	<title>Patient</title>
	<%@ include file="/component/bootstrap_cdn.jsp" %>

	<style>
        .paint-card {
            box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
        }
	</style>
</head>
<body style="background-color: #F4F6F6;">
<%@ include file="doctorNav.jsp" %>
<div class="container">
	<div class="row">
		<div class="col-md-4 mt-3">
			<div class="card paint-card">
				<p class="text-center fs-4">Change Password</p>
				<div class="card-body">
					<c:if test="${not empty fail_msg}">
						<p class="text-danger">${fail_msg}</p>
						<c:remove var="fail_msg" scope="session"></c:remove>
					</c:if>

					<form action=" ../changeDocPassword" method="post" class="row">
						<input type="hidden" name="docId" value="${docObj.id}">
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


		<div class="col-md-6 offset-md-2 mt-3">
			<div class="card paint-card">
				<p class="text-center fs-3"></p>
				<div class="card-body">
					<c:if test="${not empty success_msg}">
						<p class="text-center text-success">${success_msg}</p>
						<c:remove var="success_msg" scope="session"/>
					</c:if>
					<c:if test="${not empty fail_msg}">
						<p class="text-center text-danger">${fail_msg}</p>
						<c:remove var="fail_msg" scope="session"/>
					</c:if>
					<p class="text-center fs-4">Edit Profile</p>

					<form action="../editProfile" method="post" class="row">
						<input type="password" hidden="hidden" name="password" readonly value="${docObj.getPassword()}">

						<div class="col-md-6 mt-3">
							<label class="form-label" for="id">Id:</label>
							<input type="text" class="form-control" name="id" id="id" placeholder="Enter id" value="${docObj.getId()}" required>
						</div>

						<div class="col-md-6 mt-3">
							<label class="form-label" for="docname">Name:</label>
							<input type="text" class="form-control" name="docname" id="docname" value="${docObj.getDocname()}" placeholder="Enter name" required>
						</div>

						<div class="col-md-6 mt-3">
							<label class="form-label" for="dob">DOB:</label>
							<input type="date" class="form-control" name="dob" id="dob" value="${docObj.getDob()}" required>
						</div>

						<div class="col-md-6 mt-3">
							<label class="form-label" for="qualification">Qualification:</label>
							<input type="text" class="form-control" name="qualification" id="qualification" value="${docObj.getQualification()}" required>
						</div>

						<div class="col-md-6 mt-3">
							<label class="form-label" for="specialization">Specialist:</label>
							<select name="specialization" class="form-control" id="specialization">
								<option><p class="font-weight-bold">Select Specialist</p></option>
								<%
									SpecialistDao sd = new SpecialistDao(DbConnect.getConnection());
									List<Specialist> specialists = new ArrayList<>();
									specialists = sd.getAllSpecialist();
									for(Specialist s: specialists){
								%>
								<option value="<%= s.getSpecialistName()%>"><%= s.getSpecialistName()%></option>
								<%
									}
								%>
							</select>
						</div>

						<div class="col-md-6 mt-3">
							<label class="form-label" for="email">Email:</label>
							<input type="email" class="form-control" name="email" id="email" value="${docObj.getEmail()}" required>
						</div>

						<div class="col-md-6 mt-3">
							<label class="form-label" for="phone">Phone:</label>
							<input type="text" class="form-control" name="phone" id="phone" value="${docObj.getPhone()}" required>
						</div>

						<div class="col-md-6 mt-5">
							<label class="form-label">Gender:</label>
							<input type="radio" class="ms-3" name="gender" value="Male"> Male
							<input type="radio" class="ms-3" name="gender" value="Female"> Female
						</div>
						<button type="submit" class="btn btn-success mt-4">Update</button>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
<%--Footer of the page--%>
<div class="mt-5" >
	<%@ include file="/component/footer.jsp" %>
</div>
</body>
</html>
