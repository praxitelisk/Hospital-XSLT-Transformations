<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions">
	<xsl:output method="html" version="1.0" encoding="UTF-8" indent="yes"/>
	<xsl:template match="/">
		<html>
			<head>
				<title>Staff</title>
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
							<li class="active">
								<a href="#">Staff</a>
							</li>
							<li>
								<a href="Patients.html">Patients</a>
							</li>
							<li>
								<a href="Appointments.html">Appointments</a>
							</li>
							<li>
								<a href="Accounting.html">Accounting</a>
							</li>
						</ul>
					</div>
				</div>
				<!-- main -->
				<div class="main">
					<div class="container">
						<h1 style="text-align:center">Current Staff  - Basic Information</h1>
						<div class="accordion">
								<h4 id="doctorAccordion">Doctor Staff - Basic Information</h4>
									<div>
										<h3>Doctor Statistics</h3>
										<div class="container">
											<h4>Total Number of Doctors: <xsl:value-of select="count(//Doctor)"></xsl:value-of></h4>
											<h4>Total Number of Permanent Doctors: <xsl:value-of select="count(//Doctor/Relantionship[@RelantionshipType='Permanent'])"></xsl:value-of></h4>
											<h4>Total Number of Visiting Doctors: <xsl:value-of select="count(//Doctor/Relantionship[@RelantionshipType='Visiting'])"></xsl:value-of></h4>
											<h4>Total Number of Trainee Doctors: <xsl:value-of select="count(//Doctor/Relantionship[@RelantionshipType='Trainee'])"></xsl:value-of></h4>
										</div>		
										<div class="accordion">
											<xsl:for-each select="//Doctor">
												<h3  id="{@DoctorID}">
													<xsl:value-of select="@DoctorID"/>
												</h3>
												<div>
													<table class="table table-bordered table-striped table-condensed table-hover">
														<thead>
															<tr>
																<th>Doctor ID</th>
																<th>Doctor Name</th>
																<th>Works In</th>
																<th>Speciality</th>
																<th>Relation</th>
																<th>Address</th>
																<th>Phones</th>
																<th>Salary</th>
															</tr>
														</thead>
														<tbody>
															<tr>
																<td>
																	<xsl:value-of select="@DoctorID"/>
																</td>
																<td>
																	<xsl:value-of select="DoctorName"/>
																</td>
																<xsl:variable name="works" select="@WorksIn"/>
																<xsl:variable name="doctorID" select="@DoctorID"/>
																<td>
																	<xsl:value-of select="//Department[@DeptartID=$works]/DepartmentName"/>
																</td>
																<td>
																	<xsl:value-of select="Speciality"/>
																</td>
																<td>
																	<xsl:value-of select="Relantionship/@RelantionshipType"/>
																</td>
																<td>
																	<xsl:value-of select="DoctorContact/DoctorAddress"/>
																</td>
																<td><xsl:for-each select="DoctorContact/DoctorPhone"><xsl:value-of select="current()"/><br></br> </xsl:for-each></td>
																<td>
																	<xsl:value-of select="//Salary[@staffID=$doctorID]/Payment/@amount"></xsl:value-of>
																	<br></br>
																	<a href="Accounting.html#{//Salary[@staffID=$doctorID]/@SalaryID}"><xsl:value-of select="//Salary[@staffID=$doctorID]/@SalaryID"></xsl:value-of></a>
																</td>
															</tr>
														</tbody>
													</table>
												</div>
											</xsl:for-each>
										</div>
									</div>
							</div>
						<div class="accordion">
							<h3 id="nurseAccordion">Nurse Staff Basic Information</h3>
							<div>
								<h3>Nurse Statistics</h3>
								<div class="container">
									<h4>Total Number of Doctors: <xsl:value-of select="count(//Nurse)"></xsl:value-of></h4>
								</div>	
								<div class="accordion">
									<xsl:for-each select="//Nurse">
										<h3 id="{@NurseID}">
											<xsl:value-of select="@NurseID"/>
										</h3>
										<div>
										<table class="table table-bordered table-striped table-condensed table-hover">
											<thead>
												<tr>
													<th>NurseID ID</th>
													<th>Nurse Name</th>
													<th>Works In</th>
													<th>Address</th>
													<th>Phones</th>
													<th>Salary</th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<td>
														<xsl:value-of select="@NurseID"/>
													</td>
													<td>
														<xsl:value-of select="NurseName"/>
													</td>
													<xsl:variable name="works" select="@WorksIn"/>
													<xsl:variable name="nurseID" select="@NurseID"/>
													<td>
														<xsl:value-of select="//Department[@DeptartID=$works]/DepartmentName"/>
													</td>
													<td>
														<xsl:value-of select="NurseContact/NurseAddress"/>
													</td>
													<td><xsl:for-each select="NurseContact/NursePhone"><xsl:value-of select="current()"/><br></br> </xsl:for-each></td>
													<td>
														<xsl:value-of select="//Salary[@staffID=$nurseID]/Payment/@amount"></xsl:value-of>
														<br></br>
														<a href="Accounting.html#{//Salary[@staffID=$nurseID]/@SalaryID}"><xsl:value-of select="//Salary[@staffID=$nurseID]/@SalaryID"></xsl:value-of></a>
													</td>
												</tr>
											</tbody>
										</table>
									</div>										
									</xsl:for-each>
								</div>	
							</div>
						</div>
					</div>	<!-- end main container -->
				</div> <!-- end main -->
			</body>
			<script>
				  $(function() {
					$( ".accordion" ).accordion({
						 active: false,
						 collapsible: true,
						 heightStyle: "content"
					});  if(location.hash) { 
							 var hash = window.location.hash;
							 var thash = hash.substring(hash.lastIndexOf('#'), hash.length);
							 thash = thash.substring(1,thash.length);
							 if (thash.indexOf("Doctor")>-1)
								 $("#doctorAccordion").trigger('click');
							 
							 else  $("#nurseAccordion").trigger('click');
							  thash = $('#' + thash);
							 $(thash).trigger('click');
						}	  
				  }); 
			  </script>
		</html>
	</xsl:template>
</xsl:stylesheet>
