<%@ page import="com.dao.AppointmentDao" %>
<%@ page import="com.conn.DbConnect" %>
<%@ page import="com.entity.Appointment" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %><%@ page contentType="text/html;charset=UTF-8" language="java" %>


<c:if test="${empty docObj}">
	<c:redirect url="../doctor_login.jsp"></c:redirect>
</c:if>

<%
	int id = Integer.parseInt(request.getParameter("appointmentId"));
	AppointmentDao dao = new AppointmentDao(DbConnect.getConnection());
    Appointment app = dao.displayAppointmentById(id);
%>


<html>
<head>
	<title>Title</title>
	<%@ include file="/component/bootstrap_cdn.jsp" %>
	<style>
        .paint-card {
            box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
        }

        .backImg{
            height: 45vh;
            width:100%;
            background-size: cover;
	        background-position: center;
            background-repeat: no-repeat;
            background-image: linear-gradient(rgba(0, 0, 0, .4), rgba(0, 0, 0, .4)), url("../img/slider/hos2.jpg");
        }
	</style>
</head>
<body>
<%@ include file="/doctor/doctorNav.jsp" %>
	<div class="container-fluid">
		<div class="backImg"></div>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-md-6 offset-md-3 p-3">
				<div class="card paint-card">
					<div class="card-body">
						<p class="text-center fs-5 fw-bold">Comments</p>

						<form class="row" action="../updateAppointment" method="post">
							<input type="hidden" name="userId" value="<%= app.getUserId()%>">
							<input type="hidden" name="appointmentId" value="<%= id%>">
							<input type="hidden" name="appointDate" value="<%=app.getAppointDate() %>">
							<input type="hidden" name="email" value="<%=app.getEmail()%>">
							<input type="hidden" name="doctorId" value="<%=app.getDoctorId()%>">
							<input type="hidden" name="address" value="<%=app.getAddress()%>">

							<div class="col-md-6">
								<label for="fName" >Patient Name:</label>
								<input type="text" class="form-control" name="fName" id="fName" value="<%=app.getfName()%>" readonly required>
							</div>

							<div class="col-md-6">
								<label for="age" class="form-label">Age:</label>
								<input type="number" class="form-control" name="age" id="age" value="<%=app.getAge()%>" readonly required>
							</div>
							<div class="col-md-6">
								<label for="phone" class="form-label">Phone:</label>
								<input type="text" class="form-control" name="phone" id="phone" value="<%=app.getPhone()%>" readonly required>
							</div>
							<div class="col-md-6">
								<label for="disease" class="form-label">Disease:</label>
								<input type="text" class="form-control" name="disease" id="disease" value="<%=app.getDisease()%>" readonly required>
							</div>
							<div class="col-md-6">
								<label class="form-label mt-4">Gender:</label>
									<%if("Male".equals(app.getGender())){%>
										<input type="radio" class="ms-3" name="gender" value="Male" checked> <% out.print("Male"); %>
									<% }
									else{
									%>
										<input type="radio" class="ms-3" name="gender" value="Female" checked> <% out.print("Female"); %>
									<% } %>
							</div>
							<div class="col-md-6">
								<label class="form-label">Status:</label>
								<select name="status" class="form-select">
									<option>Status</option>
									<option value="Booked">Booked</option>
									<option value="Check up complete">Check up complete</option>
								</select>
							</div>
							<button type="submit" class="col-md-12 mt-3 btn btn-success">Submit</button>
						</form>

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
