<%@ page import="com.entity.Specialist" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.dao.SpecialistDao" %>
<%@ page import="com.conn.DbConnect" %>
<%@ page import="com.entity.Doctor" %>
<%@ page import="com.dao.DoctorDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>



<c:if test="${empty adminObj}">
	<c:redirect url="../admin_login.jsp"></c:redirect>
</c:if>

<html>
<head>
	<title>Doctor's Dashboard</title>
	<%@ include file="/component/bootstrap_cdn.jsp" %>

	<style>
        .paint-card {
            box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
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
<%@ include file="/admin/admin_nav.jsp" %>
<div class="container-fluid p-3" style="height: 80vh; background-color: #F2F3F4;">
	<div class="row d-flex justify-content-center">
		<%--			displaying all the doctors details--%>
		<div class="col-md-9">
			<div class="card paint-card">
				<div class="card-body">
					<c:if test="${not empty success_msg}">
						<p class="text-center text-success">${success_msg}</p>
						<c:remove var="success_msg" scope="session"/>
					</c:if>
					<c:if test="${not empty fail_msg}">
						<p class="text-center text-danger">${fail_msg}</p>
						<c:remove var="fail_msg" scope="session"/>
					</c:if>

					<p class="text-center fs-6">List of Doctors</p>
					<a href="doctorDashboard.jsp">
						<button type="button" class="btn btn-success">Add Doctor</button>
					</a>
<%--					<a style="text-decoration: none;" href="doctorDashboard.jsp">Add Doctor</a>--%>
					<table class="table table-striped table-hover">
						<thead >
						<tr>
							<th scope="col">Id</th>
							<th scope="col">Name</th>
							<th scope="col">DOB</th>
							<th scope="col">Qualification</th>
							<th scope="col">Specialization</th>
							<th scope="col">Email</th>
							<th scope="col">Phone</th>
							<th scope="col">Gender</th>
							<th scope="col" style="width: 20%;">Actions</th>
						</tr>
						</thead>
						<tbody>
						<%
							// Retrieving the list of doctors from DoctorDao
							DoctorDao dao = new DoctorDao(DbConnect.getConnection());
							List<Doctor> listDoctors = dao.displayAllDoctors();
						%>
						<% for(Doctor doc: listDoctors){ %>
						<tr>
							<td><%= doc.getId()%></td>
							<td><%= doc.getDocname()%></td>
							<td><%= doc.getDob()%></td>
							<td><%= doc.getQualification()%></td>
							<td><%= doc.getSpecialization()%></td>
							<td><%= doc.getEmail()%></td>
							<td><%= doc.getPhone()%></td>
							<td><%= doc.getGender()%></td>
							<td style="width: 20%;">
								<p>
									<a href="updateDoc.jsp?id=<%= doc.getId() %>" class="btn btn-sm btn-primary">Edit</a>
									<a href="../deleteDoc?id=<%= doc.getId() %>" class="btn btn-sm btn-danger ms-3">Delete</a>
								</p>
							</td>
						</tr>
						<% } %>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
<%--Footer of the page--%>
<div class="mt-5" >
	<%@ include file="/component/footer.jsp" %>
</div></body>
</html>
