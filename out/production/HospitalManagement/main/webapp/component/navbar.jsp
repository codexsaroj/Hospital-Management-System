<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<nav class="navbar sticky-top navbar-expand-lg navbar-light bg-primary">
	<div class="container-fluid">
		<a class="navbar-brand" href="#"><i class="fa-solid fa-house-medical"></i> Hospital Management
			System</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
		        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav ms-auto mb-2 mb-lg-0">


				<c:if test="${ empty userObj}">
					<li class="nav-item">
						<a class="nav-link active" aria-current="page" href="./admin_login.jsp"><i
								class="fa-solid fa-right-to-bracket"></i>
							Admin</a>
					</li>
					<li class="nav-item">
						<a class="nav-link active" href="./doctor_login.jsp">Doctor</a>
					</li>
					<li class="nav-item">
						<a class="nav-link active" href="./user_login.jsp">User</a>
					</li>
				</c:if>


				<c:if test="${ not empty userObj}">
					<li class="nav-item">
						<a class="nav-link active" href="./user_profile.jsp">Home</a>
					</li>

					<li class="nav-item">
						<a class="nav-link active" href="./userAppointment.jsp">Book Appointment</a>
					</li>


					<div class="dropdown btn-group">
						<button class="btn btn-primary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							<i style="color: white;" class="fa-solid fa-circle-user"></i> ${ userObj.getName()}
						</button>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="changePassword.jsp">Change Password</a></li>
							<li><a class="dropdown-item" href="userLogout">Logout</a></li>
						</ul>
					</div>
				</c:if>


			</ul>
		</div>
	</div>
</nav>