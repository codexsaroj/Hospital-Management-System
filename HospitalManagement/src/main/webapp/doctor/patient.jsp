<%@ page import="java.util.List" %>
<%@ page import="com.conn.DbConnect" %>
<%@ page import="com.entity.Doctor" %>
<%@ page import="com.entity.Appointment" %>
<%@ page import="com.dao.AppointmentDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>



<c:if test="${empty docObj}">
	<c:redirect url="../doctor_login.jsp"></c:redirect>
</c:if>

<html>
<head>
	<title>Doctor's Dashboard</title>
	<%@ include file="/component/bootstrap_cdn.jsp" %>

	<style>
        .paint-card {
            box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
        }

        .backImg{
            height: 30vh;
            width:100%;
            background-size: cover;
            background-repeat: no-repeat;
            background-image: linear-gradient(rgba(0, 0, 0, .4), rgba(0, 0, 0, .4)), url("../img/slider/hos2.jpg");
        }

        table{
            width: 60%;
            border-collapse: collapse;
        }

        td{
            word-wrap: break-word;
        }

        #docImg{
	        border-radius: 5px;
        }
	</style>
</head>
<body>
<%@ include file="/doctor/doctorNav.jsp" %>
<div class="container-fluid backImg p-3" style="height: 100vh;">
	<div class="row d-flex justify-content-center">
		<%--displaying all the patient details--%>
		<div class="col-md-9">
			<div class="card paint-card mt-5">
				<div class="card-body">
					<c:if test="${not empty succ_msg}">
						<p class="text-center text-success">${succ_msg}</p>
						<c:remove var="succ_msg" scope="session"/>
					</c:if>
					<c:if test="${not empty fail_msg}">
						<p class="text-center text-danger">${fail_msg}</p>
						<c:remove var="fail_msg" scope="session"/>
					</c:if>

					<p class="text-center fs-5 fw-bold">Patient list</p>
					<table class="table table-striped table-hover">
						<thead >
						<tr>
							<th scope="col">Name</th>
							<th scope="col">Age</th>
							<th scope="col">Gender</th>
							<th scope="col">Appointment Date</th>
							<th scope="col">Email</th>
							<th scope="col">Phone</th>
							<th scope="col">Disease</th>
							<th scope="col">Status</th>
							<th scope="col">Action</th>
						</tr>
						</thead>
						<tbody>
						<%
							Doctor doc = (Doctor) session.getAttribute("docObj");
							String id = doc.getId();
							// Retrieving the list of doctors from DoctorDao
							AppointmentDao dao = new AppointmentDao(DbConnect.getConnection());
							List<Appointment> listAppointment = dao.displayAppointmentsByDocId(id);
						%>
						<% for(Appointment app: listAppointment){ %>
						<tr>
							<td><%= app.getfName()%></td>
							<td><%= app.getAge()%></td>
							<td><%= app.getGender()%></td>
							<td><%= app.getAppointDate()%></td>
							<td><%= app.getEmail()%></td>
							<td><%= app.getPhone()%></td>
							<td><%= app.getDisease()%></td>
							<td><%= app.getStatus()%></td>
							<td>
								<%  if("Check up complete".equals(app.getStatus())){  %>
										<a href="updateStatus.jsp?appointmentId=<%= app.getAppointmentId()%>" class="btn btn-sm btn-success disabled">Done</a>
								<%  }
									else{ %>
										<a href="updateStatus.jsp?appointmentId=<%= app.getAppointmentId()%>" class="btn btn-sm btn-success">Update Status</a>
								<% }%>
							</td>
							<%--<td>
								<%
									if("Pending".equals(app.getStatus())){  %>
								<a href="#" class="btn btn-sm btn-warning">Pending</a>
								<% }
								else{ %>
								<%= app.getStatus()%>
								<% }
								%>
							</td>--%>
						</tr>
						<% } %>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<div class="col-md-3 p-3">
			<img id="docImg" src="../img/doctors/12.png" width="300px" height="400px">
		</div>
	</div>
</div>

<%--Footer of the page--%>
<div class="mt-5" >
	<%@ include file="/component/footer.jsp" %>
</div></body></body>
</html>
