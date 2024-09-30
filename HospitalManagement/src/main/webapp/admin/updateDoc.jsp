<%@ page import="com.entity.Specialist" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.dao.SpecialistDao" %>
<%@ page import="com.conn.DbConnect" %>
<%@ page import="com.entity.Doctor" %>
<%@ page import="com.dao.DoctorDao" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<%
	DoctorDao dao = new DoctorDao(DbConnect.getConnection());
	String id = request.getParameter("id");
    Doctor doc = dao.displayDoctorById(id);
%>

<html>
<head>
	<title>Edit Doctor</title>
	<%@ include file="/component/bootstrap_cdn.jsp" %>

	<style>
        .paint-card {
            box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
        }
	</style>

</head>
<body>
<%@ include file="/admin/admin_nav.jsp" %>
<div class="container-fluid p-3">
	<div class="row d-flex justify-content-center">
		<div class="col-md-6">
			<div class="card paint-card">
				<div class="card-body">
					<p class="text-center fs-5">Update Details</p>

					<c:if test="${not empty fail_msg}">
						<p class="text-center text-danger">${fail_msg}</p>
						<c:remove var="fail_msg" scope="session"/>
					</c:if>

					<form action="../updateDoc" method="post">
						<div class="mb-3">
							<label class="form-label" for="id">Id:</label>
							<input type="text" class="form-control" name="id" id="id" value="<%= doc.getId()%>" placeholder="Enter id" required>
						</div>
						<div class="mb-3">
							<label class="form-label" for="docname">Name:</label>
							<input type="text" class="form-control" name="docname" id="docname" value="<%= doc.getDocname()%>" placeholder="Enter name" required>
						</div>
						<div class="mb-3">
							<label class="form-label" for="dob">DOB:</label>
							<input type="date" class="form-control" name="dob" id="dob" value="<%= doc.getDob()%>" required>
						</div>
						<div class="mb-3">
							<label class="form-label" for="qualification">Qualification:</label>
							<input type="text" class="form-control" name="qualification" id="qualification" value="<%= doc.getQualification()%>" required>
						</div>
						<div class="mb-3">
							<label class="form-label" for="specialization">Specialist:</label>
							<select name="specialization" class="form-control" id="specialization" >
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
						<div class="mb-3">
							<label class="form-label" for="email">Email:</label>
							<input type="email" class="form-control" name="email" id="email" value="<%= doc.getEmail()%>" required>
						</div>

						<div class="mb-3">
							<label class="form-label" for="password">Password:</label>
							<input type="password" class="form-control" name="password"  id="password" value="<%= doc.getPassword()%>" required>
						</div>
						<div class="mb-3">
							<label class="form-label" for="phone">Phone:</label>
							<input type="text" class="form-control" name="phone" id="phone" value="<%= doc.getPhone()%>" required>
						</div>
						<div class="mb-3">
							<label class="form-label">Gender:</label>
							<input type="radio" class="ms-3" name="gender" value="Male" checked> Male
							<input type="radio" class="ms-3" name="gender" value="Female"> Female
						</div>
						<button type="submit" class="btn btn-success">Update</button>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="mt-5" >
	<%@ include file="/component/footer.jsp" %>
</div>
</body>
</html>
