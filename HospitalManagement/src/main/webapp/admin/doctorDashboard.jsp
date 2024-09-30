<%@ page import="com.entity.Specialist" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.dao.SpecialistDao" %>
<%@ page import="com.conn.DbConnect" %>
<%--<%@ page import="com.entity.Doctor" %>--%>
<%--<%@ page import="com.dao.DoctorDao" %>--%>
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
	<div class="container-fluid p-3">
		<div class="row d-flex justify-content-center">
			<div class="col-md-6">
				<div class="card paint-card">
					<div class="card-body">
						<p class="text-center fs-5">Add Doctor</p>
						<c:if test="${not empty suc_msg}">
							<p class="text-success">${suc_msg}</p>
							<c:remove var="suc_msg" scope="session"></c:remove>
						</c:if>
						<c:if test="${not empty failure_msg}">
							<p class="text-danger">${failure_msg}</p>
							<c:remove var="failure_msg" scope="session"></c:remove>
						</c:if>

						<form action="../addDoctor" method="post">
							<div class="mb-3">
								<label class="form-label" for="id">Id:</label>
								<input type="text" class="form-control" name="id" id="id" placeholder="Enter id" required>
							</div>

							<div class="mb-3">
								<label class="form-label" for="docname">Name:</label>
								<input type="text" class="form-control" name="docname" id="docname" placeholder="Enter name" required>
							</div>

							<div class="mb-3">
								<label class="form-label" for="dob">DOB:</label>
								<input type="date" class="form-control" name="dob" id="dob" required>
							</div>

							<div class="mb-3">
								<label class="form-label" for="qualification">Qualification:</label>
								<input type="text" class="form-control" name="qualification" id="qualification" required>
							</div>

							<div class="mb-3">
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

							<div class="mb-3">
								<label class="form-label" for="email">Email:</label>
								<input type="email" class="form-control" name="email" id="email" required>
							</div>

							<div class="mb-3">
								<label class="form-label" for="password">Password:</label>
								<input type="password" class="form-control" name="password" id="password" required>
							</div>

							<div class="mb-3">
								<label class="form-label" for="phone">Phone:</label>
								<input type="text" class="form-control" name="phone" id="phone" required>
							</div>

							<div class="mb-3">
								<label class="form-label">Gender:</label>
									<input type="radio" class="ms-3" name="gender" value="Male" checked> Male
									<input type="radio" class="ms-3" name="gender" value="Female"> Female
							</div>
							<button type="submit" class="btn btn-success">Add</button>
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
