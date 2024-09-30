<%@ page import="com.dao.DoctorDao" %>
<%@ page import="com.conn.DbConnect" %>
<%@ page import="com.entity.Doctor" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>



<c:if test="${empty userObj}">
	<c:redirect url="user_login.jsp"></c:redirect>
</c:if>

<html>
<head>
	<title>User Appointements</title>
	<%@ include file="component/bootstrap_cdn.jsp" %>
	<style>
        .paint-card {
            box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
        }

        .backImg{
	        background: linear-gradient(rgba(0,0,0,.4), rgba(0,0,0,.4)), url("./img/slider/hos.jpg");
            height: 30vh;
	        width: 100%;
	        background-size: cover;
	        background-repeat: no-repeat;
        }
	</style>
</head>
<body>
<%@ include file="component/navbar.jsp" %>
	<div class="container-fluid backImg p-5">
		<p class="text-center text-white mt-3 fs-5">Welcome to Care Hospital</p>
	</div>
	<div class="container p-3">
		<div class="row">
			<div class="col-md-6">
				<img src="img/doctors/7.jpg" alt="Chairman of Hospital">
			</div>
			<div class="col-md-6">
				<div class="card paint-card">
					<div class="card-body">
						<p class="text-center fs-3">User Appointment</p>
						<c:if test="${not empty suc_msg}">
							<p class="text-center text-success fs-6">${suc_msg}</p>
							<c:remove var="suc_msg" scope="session"></c:remove>
						</c:if>
						<c:if test="${not empty fail_msg}">
							<p class="text-center text-danger fs-6">${fail_msg}</p>
							<c:remove var="fail_msg" scope="session"></c:remove>
						</c:if>

						<form action="bookAppointment" method="post">
							<input type="hidden" name="userId" value="${userObj.id}">

							<div class="mb-3">
								<label for="fName" class="form-label">Name:</label>
								<input type="text" class="form-control" name="fName" id="fName" required>
							</div>

							<div class="mb-3">
								<label for="age" class="form-label">Age:</label>
								<input type="number" class="form-control" name="age" id="age" required>
							</div>
							<div class="mb-3">
								<label for="appointDate" class="form-label">Appointment Date:</label>
								<input type="date" class="form-control" name="appointDate" id="appointDate" required>
							</div>
							<div class="mb-3">
								<label for="email" class="form-label">Email:</label>
								<input type="email" class="form-control" name="email" id="email" required>
							</div>
							<div class="mb-3">
								<label for="phone" class="form-label">Phone:</label>
								<input type="text" class="form-control" name="phone" id="phone" required>
							</div>
							<div class="mb-3">
								<label for="disease" class="form-label">Disease:</label>
								<input type="text" class="form-control" name="disease" id="disease" required>
							</div>
							<div class="mb-3">
								<label for="fname" class="form-label">Doctor:</label>
								<select name="doctorId" class="form-control">
									<option value="">Select Doctor</option>
									<% DoctorDao dao = new DoctorDao(DbConnect.getConnection());
										List<Doctor> listDoctors = dao.displayAllDoctors();
                                        for (Doctor doctor : listDoctors) {
									%>
									<option value="<%= doctor.getId()%>"><%= doctor.getDocname()%> (<%= doctor.getSpecialization()%>)</option>
									<% } %>
								</select>
							</div>
							<div class="mb-3">
								<label class="form-label" for="address">Address:</label>
								<textarea placeholder="Enter address..." class="form-control" name="address" id="address"></textarea>
							</div>
							<div class="mb-3">
								<label class="form-label">Gender:</label>
								<input type="radio" class="ms-3" name="gender" value="Male"> Male
								<input type="radio" class="ms-3" name="gender" value="Female"> Female
							</div>

							<c:if test="${empty userObj}">
								<a href="user_login.jsp?msg=User Login Required" class="col-md-6 offset-md-3 mt-3 btn btn-success">Submit</a>
							</c:if>
							<c:if test="${not empty userObj}">
								<button class="col-md-6 offset-md-3 btn btn-success">Submit</button>
							</c:if>


						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

<%--Footer of the page--%>
<div class="mt-5" >
	<%@ include file="/component/footer.jsp" %>
</div></body>
</body>
</html>
