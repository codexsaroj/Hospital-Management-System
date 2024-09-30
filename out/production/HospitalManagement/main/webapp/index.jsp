<%@ page import="java.sql.Connection" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.conn.DbConnect" %>

<!DOCTYPE html>
<html>

<head>
	<title>Title</title>
	<%@ include file="component/bootstrap_cdn.jsp" %>
	<style>
        .paint-card {
            box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
        }
	</style>
</head>

<body>
<%@ include file="component/navbar.jsp" %>




<section class="slides">
	<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
		<div class="carousel-indicators">
			<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active"
			        aria-current="true" aria-label="Slide 1"></button>
			<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1"
			        aria-label="Slide 2"></button>
			<button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2"
			        aria-label="Slide 3"></button>
		</div>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="./img/slider/9.avif" class="d-block w-100" alt="..." height="650px">
			</div>
			<div class="carousel-item">
				<img src="./img/slider/6.avif" class="d-block w-100" alt="..." height="650px">
			</div>
			<div class="carousel-item">
				<img src="./img/slider/12.avif" class="d-block w-100" alt="..." height="650px">
			</div>
		</div>
		<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators"
		        data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span>
			<span class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators"
		        data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span>
			<span class="visually-hidden">Next</span>
		</button>
	</div>
</section>

<section class="features">
	<div class="container p-3">
		<p class="text-center fs-2">Our Specialities</p>
		<div class="row">
			<div class="col-md-8 p-5">
				<div class="row g-3">
					<div class="col-md-6">
						<div class="card paint-card">
							<div class="card-body">
								<h5 class="card-title">100% Safety</h5>
								<p class="card-text">klasjdfl ksjalfj lksdfj lkasjfl sdflakjfla
									falksdjflaksdjfal</p>
							</div>
						</div>
					</div>
					<div class="col-md-6">
						<div class="card paint-card">
							<div class="card-body">
								<h5 class="card-title">Clean Environment</h5>
								<p class="card-text">This is a wider card with supporting text below as a natural
									lead-in to
									additional
									content. This content is a little bit longer.</p>
							</div>
						</div>
					</div>
					<div class="col-md-6">
						<div class="card paint-card">
							<div class="card-body">
								<h5 class="card-title">Friendly Doctors</h5>
								<p class="card-text">This is a wider card with supporting text below as a natural
									lead-in to
									additional
									content. This content is a little bit longer.</p>
							</div>
						</div>
					</div>
					<div class="col-md-6">
						<div class="card paint-card">
							<div class="card-body">
								<h5 class="card-title">Medical Research</h5>
								<p class="card-text">This is a wider card with supporting text below as a natural
									lead-in to
									additional
									content. This content is a little bit longer.</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<hr>
<section class="docs">
	<p class="text-center fs-2">Our Team</p>
	<div class="container p-2">
		<div class="row">
			<div class="col-md-3">
				<div class="card paint-card">
					<div class="card-body text-center">
						<img src="img/doctors/7.jpg" width="250px" height="300px">
						<div class="card-footer">
							<p class="fw-bold fs-5">Dr. Lalu</p>
							<p class="fw-bold fs-6">(CEO & Chairman)</p>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-3">
				<div class="card paint-card">
					<div class="card-body text-center">
						<img src="img/doctors/10.jpg" width="250px" height="300px">
						<div class="card-footer">
							<p class="fw-bold fs-5">Dr. Rabdi Devi</p>
							<p class="fw-bold fs-5">(Chief Doctor)</p>
						</div>
					</div>
				</div>
			</div>
			<div class="col-md-3">
				<div class="card paint-card">
					<div class="card-body text-center">
						<img src="img/doctors/12.png" width="250px" height="300px">
						<div class="card-footer">
							<p class="fw-bold fs-5">Dr. Irani</p>
							<p class="fw-bold fs-5">(Cardiologists)</p>
						</div>
					</div>

				</div>
			</div>
			<div class="col-md-3">
				<div class="card paint-card">
					<div class="card-body text-center">
						<img src="img/doctors/13.png" width="250px" height="300px">
						<div class="card-footer">
							<p class="fw-bold fs-5">Dr. Papu</p>
							<p class="fw-bold fs-5">(Cheif Doctor)</p>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>
</section>
<%--</div>--%>


<%--Footer of the page--%>
<div class="mt-5" >
	<%@ include file="/component/footer.jsp" %>
</div></body></body>

</html>