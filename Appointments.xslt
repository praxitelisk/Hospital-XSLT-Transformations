<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions">
	<xsl:output method="html" version="1.0" encoding="UTF-8" indent="yes"/>
	
	<xsl:template match="/">
		<html>
			<head>
				<title>Appointments</title>
				<script src="C:\Users\praxitelis\Desktop\AUTH MASTER\A Semester\Semantic Web\assignment 2\js\jquery-ui-1.11.4-start-theme.custom\jquery-ui-1.11.4.custom\external\jquery\jquery.js"/>
				<script src="C:\Users\praxitelis\Desktop\AUTH MASTER\A Semester\Semantic Web\assignment 2\js\jquery-ui-1.11.4-start-theme.custom\jquery-ui-1.11.4.custom\jquery-ui.js"/>
				<script src="C:\Users\praxitelis\Desktop\AUTH MASTER\A Semester\Semantic Web\assignment 2\js\bootstrap-3.3.6-dist\bootstrap-3.3.6-dist\js\bootstrap.min.js"/>
				<link rel="stylesheet" href="C:\Users\praxitelis\Desktop\AUTH MASTER\A Semester\Semantic Web\assignment 2\js\jquery-ui-1.11.4-start-theme.custom\jquery-ui-1.11.4.custom\jquery-ui.min.css"/>
				<link rel="stylesheet" href="C:\Users\praxitelis\Desktop\AUTH MASTER\A Semester\Semantic Web\assignment 2\js\bootstrap-3.3.6-dist\bootstrap-3.3.6-dist\css\bootstrap.css"/>
				<link rel="stylesheet" href="C:\Users\praxitelis\Desktop\AUTH MASTER\A Semester\Semantic Web\assignment 2\css\style.css"/>
			</head>
			<body>
				<!-- heading -->
				<div class="heading">
					<div class="container">
						<div class="row">
							<div class="col-md-2">
								<img alt="Hospital Management" src="C:\Users\praxitelis\Desktop\AUTH MASTER\A Semester\Semantic Web\assignment 2\images\image-generic.jpg"/>
							</div>
							<div class="col-md-10">
								<h1 class="mainHead">Hospital Management Page</h1>
							</div>
						</div>
					</div>
				</div>
				<!--navigation-->
				<div class="navigation">
					<div class="container">
						<ul class="nav nav-pills">
							<li>
								<a href="index.html">Home</a>
							</li>
							<li>
								<a href="Infrastructure.html">Infrastructure</a>
							</li>
							<li>
								<a href="Staff.html">Staff</a>
							</li>
							<li>
								<a href="Patients.html">Patients</a>
							</li>
							<li class="active">
								<a href="Appointments.html">Appointments</a>
							</li>
							<li>
								<a href="Accounting.html">Accounting</a>
							</li>
						</ul>
					</div>
				</div>
				<div class="main">
					<div class="container">
						<h1 style="text-align:center">Hospital Appointments - Basic Information</h1>
						<div class="accordion">
							<xsl:for-each select="//Appointment">
								<xsl:sort select="AppointedDate/@Aptdate" order="descending"></xsl:sort>
								<h3 id="{@AppointmentID}"><xsl:value-of select="@AppointmentID"></xsl:value-of> - <xsl:value-of select="AppointedDate/@Aptdate"></xsl:value-of></h3>
								<div>
									<table class="table table-bordered table-striped table-condensed table-hover">
										<thead>
											<tr>
												<th>AppointmentID</th>
												<th>Appointed Doctor</th>
												<th>AppointedPatient</th>
												<th>Appointment Date</th>
												<th>Appointment Time</th>
												<th>Appointment Comments</th>
											</tr>
										</thead>
										<tbody>
											<tr>
												<td><xsl:value-of select="@AppointmentID"></xsl:value-of></td>
												<xsl:variable name="doctorID" select="AppointedDoctor/@AppointedDoctorID"></xsl:variable>
												<td>
													<xsl:value-of select="//Doctor[@DoctorID=$doctorID]/DoctorName"/><br></br><a href="Staff.html#{AppointedDoctor/@AppointedDoctorID}" target="_blank"><xsl:value-of select="AppointedDoctor/@AppointedDoctorID"></xsl:value-of></a>
												</td>
												<xsl:variable name="patientID" select="AppointedPatient/@AppointedPatientID"></xsl:variable>
												<td>
													<xsl:value-of select="//Patient[@PatientID=$patientID]/PatientName"/><br></br><a href="Patients.html#{AppointedPatient/@AppointedPatientID}" target="_blank"><xsl:value-of select="AppointedPatient/@AppointedPatientID"></xsl:value-of></a>
												</td>
												<td><xsl:value-of select="AppointedDate/@Aptdate"></xsl:value-of></td>
												<td><xsl:value-of select="AppointedTime/@AptTime"></xsl:value-of></td>
												<td><xsl:value-of select="comments"></xsl:value-of></td>
											</tr>
										</tbody>
									</table>
								</div>
							</xsl:for-each >
						</div>
					</div> <!-- end of main container -->
				</div> <!-- end of main -->
			</body>
			<script>
				  $(function() {
					$( ".accordion" ).accordion({
					  active: false,
					  collapsible: true,
					  heightStyle: "content"
					});
				  });
			  </script>
		</html>
		
	</xsl:template>		
</xsl:stylesheet>
