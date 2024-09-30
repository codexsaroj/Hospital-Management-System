<nav class="navbar sticky-top navbar-expand-lg navbar-light bg-primary">
	<div class="container-fluid">
		<a class="navbar-brand" href="#"><i class="fa-solid fa-user-tie"></i> Admin Panel</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
		        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<li class="nav-item">
					<a class="nav-link active" href="adminDashboard.jsp">Home</a>
				</li>
<%--				<li class="nav-item">--%>
<%--					<a class="nav-link active" href="doctorDashboard.jsp">Doctor</a>--%>
<%--				</li>--%>
				<li class="nav-item">
					<a class="nav-link active" href="viewDoctor.jsp">View Doctors</a>
				</li>
				<li class="nav-item">
					<a class="nav-link active" href="adminViewAppointment.jsp">View Appointments</a>
				</li>
			</ul>
			<div class="d-flex">
				<div class="dropdown">
					<button class="btn btn-light dropdown-toggle" type="button"
					id="dropdownMenuButton1" data-bs-toggle="dropdown"
					aria-expanded="false">Admin</button>
					<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
						<li><a class="dropdown-item" href="../adminLogout">Logout</a></li>
					</ul>
				</div>
			</div>

		</div>
	</div>
</nav>
