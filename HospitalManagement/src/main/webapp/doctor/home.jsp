<%@ page import="com.dao.DoctorDao" %>
<%@ page import="com.dao.AppointmentDao" %>
<%@ page import="com.conn.DbConnect" %>
<%@ page import="com.entity.Doctor" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>

<c:if test="${empty docObj}">
	<c:redirect url="../doctor_login.jsp"></c:redirect>
</c:if>

<%
	DoctorDao docDao = new DoctorDao(DbConnect.getConnection());
	Doctor doc = (Doctor) session.getAttribute("docObj");
    String docId = (doc.getId());
	AppointmentDao appointDao = new AppointmentDao(DbConnect.getConnection());
%>

<head>
	<title>Patient</title>
	<%@ include file="/component/bootstrap_cdn.jsp" %>

	<style>
        .paint-card {
            box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
        }
	</style>
</head>
<body>
<%@ include file="doctorNav.jsp" %>
<div class="container-fluid p-3" style="height: 84vh;">
	<div class="row d-flex justify-content-center">
		<div class="col-md-4 mt-3">
			<div class="card paint-card">
				<div class="card-body">
					<p class="text-center text-success fs-5"><i class="fa-solid fa-user-doctor fa-2x"></i></p>
					<p class="text-center fs-5">Doctors<br>(<%= docDao.countDoctors()%>)</p>
				</div>
			</div>
		</div>
		<div class="col-md-4 mt-3">
			<div class="card paint-card">
				<div class="card-body">
					<p class="text-center text-success fs-5"><i class="fas fa-calendar-check fa-2x"></i><br></p>
					<p class="text-center fs-5">Total Appointments<br>(<%= appointDao.countAppointmentsByDocId(docId)%>)</p>
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
