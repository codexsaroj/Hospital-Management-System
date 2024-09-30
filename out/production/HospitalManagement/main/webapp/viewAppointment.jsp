<%@ page import="com.entity.Specialist" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.dao.SpecialistDao" %>
<%@ page import="com.conn.DbConnect" %>
<%@ page import="com.entity.Doctor" %>
<%@ page import="com.dao.DoctorDao" %>
<%@ page import="com.entity.Appointment" %>
<%@ page import="com.dao.AppointmentDao" %>
<%@ page import="com.entity.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>



<c:if test="${empty userObj}">
	<c:redirect url="user_login.jsp"></c:redirect>
</c:if>

<html>
<head>
	<title>Doctor's Dashboard</title>
	<%@ include file="component/bootstrap_cdn.jsp" %>

	<style>
        .paint-card {
            box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
        }

        .backImg{
	        background: linear-gradient(rgba(0,0,0,.4), rgba(0,0,0,.4)), url("img/slider/hos.jpg");
            height: 30vh;
	        width:100%;
	        background-size: cover;
	        background-repeat: no-repeat;
        }

        table{
            width: 60%;
            border-collapse: collapse;
        }

        td{
            word-wrap: break-word;
        }
	</style>
</head>
<body>
<%@ include file="/component/navbar.jsp" %>
<div class="container-fluid backImg p-3" style="height: 84vh;">
	<div class="row d-flex justify-content-center">
		<%--			displaying all the appointment details--%>
		<div class="col-md-9">
			<div class="card paint-card">
				<div class="card-body">
					<c:if test="${not empty succ_msg}">
						<p class="text-center text-success">${succ_msg}</p>
						<c:remove var="succ_msg" scope="session"/>
					</c:if>
					<c:if test="${not empty fail_msg}">
						<p class="text-center text-danger">${fail_msg}</p>
						<c:remove var="fail_msg" scope="session"/>
					</c:if>

					<p class="text-center fs-6 fw-bold">Appointments list:</p>
					<a href="userAppointment.jsp">
						<button type="button" class="btn btn-success">Book another appointment</button>
					</a>
					<table class="table table-striped table-hover">
						<thead >
						<tr>
							<th scope="col">Name</th>
							<th scope="col">Age</th>
							<th scope="col">Appointment Date</th>
							<th scope="col">Disease</th>
							<th scope="col">Doctor Name</th>
							<th scope="col">Status</th>
						</tr>
						</thead>
						<tbody>
						<%
							User us = (User)session.getAttribute("userObj");
                            int id = us.getId();
							// Retrieving the list of doctors from DoctorDao
							 AppointmentDao dao = new AppointmentDao(DbConnect.getConnection());
                            List<Appointment> listAppointment = dao.displayAppointmentsByUserId(id);
						%>
						<% for(Appointment app: listAppointment){ %>
						<tr>
							<td><%= app.getfName()%></td>
							<td><%= app.getAge()%></td>
							<td><%= app.getAppointDate()%></td>
							<td><%= app.getDisease()%></td>
							<td><%= app.getDoctorId()%></td>
							<td>
								<%
								if("Pending".equals(app.getStatus())){  %>
                                    <a href="#" class="btn btn-sm btn-warning">Pending</a>
								<% }
								else{ %>
								<a href="#" class="btn btn-sm btn-success"><%= app.getStatus()%></a>
								<% }
								%>
							</td>
						</tr>
						<% } %>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<div class="col-md-3 p-3">
			<img src="img/doctors/3.jpg" width="300px" height="450px">
		</div>
	</div>
</div>

<%--Footer of the page--%>
<div class="mt-5" >
	<%@ include file="/component/footer.jsp" %>
</div></body></body>
</html>
