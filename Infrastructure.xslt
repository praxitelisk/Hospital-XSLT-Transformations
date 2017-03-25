<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions">
	<xsl:output method="html" version="1.0" encoding="UTF-8" indent="yes"/>
	<xsl:template match="/">
		<html>
			<head>
				<title>Infrastructure</title>
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
							<li class="active">
								<a href="#">Infrastructure</a>
							</li>
							<li>
								<a href="Staff.html">Staff</a>
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
				<div class=" main">
					<div class="container">
						<h1 style="text-align:center">Hospital Infrastructure - Basic Information</h1>
						<div class="accordion">
							<xsl:for-each select="//Wing">
								<h3>Wing: <xsl:value-of select="@wingID"/>
								</h3>
								<div>
									<h2>Departments in Wing <xsl:value-of select="@wingID"/>
									</h2>
									<xsl:for-each select="Departments/Department">
										<div class="container">
											<div class="accordion myResize">
												<h4>
													<xsl:value-of select="DepartmentName"/>
												</h4>
												<div>
													<h3>General Information about the Department</h3>
													<table class="table table-bordered table-striped table-condensed table-hover">
														<thead>
															<tr>
																<th>Department ID</th>
																<th>Department Name</th>
																<th>Department Phone</th>
															</tr>
														</thead>
														<tbody>
															<tr>
																<td>
																	<xsl:value-of select="@DeptartID"/>
																</td>
																<td>
																	<xsl:value-of select="DepartmentName"/>
																</td>
																<td>
																	<xsl:value-of select="DepartmentPhone"/>
																</td>
															</tr>
														</tbody>
													</table>
													<xsl:variable name="dept" select="@DeptartID"/>
													<h4>Head of Department: <xsl:value-of select="//Doctor[@HeadOfDept=$dept]/DoctorName"/>
													</h4>
													<h3>Employees Information</h3>
													<table class="table table-bordered table-striped table-condensed table-hover">
														<thead>
															<tr>
																<th>Total Number of Employees</th>
																<th>Total Number of Doctors</th>
																<th>Total Number of Nurses</th>
															</tr>
														</thead>
														<tbody>
															<tr>
																<xsl:variable name="works" select="@DeptartID"/>
																<td>
																	<xsl:value-of select="count(//Doctor[@WorksIn=$works]/DoctorName) + count(//Nurse[@WorksIn=$works]/NurseName)"/>
																</td>
																<td>
																	<xsl:value-of select="count(//Doctor[@WorksIn=$works]/DoctorName)"/>
																</td>
																<td>
																	<xsl:value-of select="count(//Nurse[@WorksIn=$works]/NurseName)"/>
																</td>
															</tr>
														</tbody>
													</table>
													<h4>Doctor Staff</h4>
													<table class="table table-bordered table-striped table-condensed table-hover">
														<thead>
															<tr>
																<th>Doctor Name</th>
																<th>Speciality</th>
																<th>Relation</th>
															</tr>
														</thead>
														<xsl:variable name="works" select="@DeptartID"/>
														<xsl:for-each select="//Doctor[@WorksIn=$works]">
															<tbody>
																<tr>
																	<td>
																		<a href="Staff.html#{@DoctorID}" target="_blank"><xsl:value-of select="DoctorName"/></a>
																	</td>
																	<td>
																		<xsl:value-of select="Speciality"/>
																	</td>
																	<td>
																		<xsl:value-of select="Relantionship/@RelantionshipType"/>
																	</td>
																</tr>
															</tbody>
														</xsl:for-each>
													</table>
													<h4>Doctor Information</h4>
													<table class="table table-bordered table-striped table-condensed table-hover">
														<thead>
															<tr>
																<th>Total Number of Permanent Doctors</th>
																<th>Total Number of Visiting Doctors</th>
																<th>Total Number of Trainee Doctors</th>
															</tr>
														</thead>
															<xsl:variable name="works" select="@DeptartID"/>
															<tr>
																<td><xsl:value-of select="count(//Doctor[@WorksIn=$works]/Relantionship[@RelantionshipType='Permanent'])"></xsl:value-of></td>
																<td><xsl:value-of select="count(//Doctor[@WorksIn=$works]/Relantionship[@RelantionshipType='Visiting'])"></xsl:value-of></td>
																<td><xsl:value-of select="count(//Doctor[@WorksIn=$works]/Relantionship[@RelantionshipType='Trainee'])"></xsl:value-of></td>
															</tr>
													</table>
													<h4>Nurse Staff</h4>
													<table class="table table-bordered table-striped table-condensed table-hover">
														<thead>
															<tr>
																<th>Nurse Name</th>
															</tr>
														</thead>
														<xsl:variable name="works" select="@DeptartID"/>
														<xsl:for-each select="//Nurse[@WorksIn=$works]">
															<tbody>
																<tr>
																	<td>
																		<a href="Staff.html#{@NurseID}" target="_blank"><xsl:value-of select="NurseName"/></a>
																	</td>
																</tr>
															</tbody>
														</xsl:for-each>
													</table>
												</div>
											</div>
										</div>
									</xsl:for-each>
									<h2>Wards in Wing <xsl:value-of select="@wingID"/>
									</h2>
									<div class="container">
										<div class="accordion myResize">
											<xsl:for-each select="Wards/Ward">
												<xsl:sort select="@WardID"></xsl:sort>
												<h3>Ward ID: <xsl:value-of select="@WardID"/></h3>
												<div>
													<div class="container">
														<xsl:variable name="ward" select="@WardID"></xsl:variable>
														<h4>Used by Department: <xsl:value-of select="//Department[@useWard=$ward]/DepartmentName"/></h4>
														<h4>Is Inspected by the Nurse: <xsl:value-of select="//Nurse[@InspectWard=$ward]/NurseName"></xsl:value-of></h4>
														<h4>Total Number of Rooms: <xsl:value-of select="count(//Ward[@WardID=$ward]/Rooms/Room)"></xsl:value-of></h4>
														<h4>Total Number of Beds: <xsl:value-of select="count(//Ward[@WardID=$ward]/Rooms/Room/Beds/Bed)"></xsl:value-of></h4>
														<xsl:for-each select="//Department">
															<xsl:if test="$ward = @useWard">
																<xsl:variable name="useWard" select="@useWard"></xsl:variable>
																<xsl:variable name="depart" select="@DeptartID"></xsl:variable>
																<h4>Available Beds: <xsl:value-of select="count(//Ward[@WardID = $useWard]/Rooms/Room/Beds/Bed) - count(//Patient[@PatientType='InPatient']/AttendedDept[@AttendedIn=$depart])"></xsl:value-of></h4>
															</xsl:if>
														</xsl:for-each>
														<div class="accordion myResizeForRoom">
															<xsl:for-each select="Rooms/Room">
																<h3>Room ID:<xsl:value-of select="@RoomID"/></h3>
																<div>
																	<div class="container">
																		<h4>Beds in Room ID: <xsl:value-of select="@RoomID"></xsl:value-of></h4>
																		<table class="table table-bordered table-striped table-condensed table-hover tableForRoom">
																			<thead>
																				<tr>
																					<th>Bed ID</th>
																					<th>Bed Size</th>
																					<th>Assigned To:</th>
																				</tr>
																			</thead>
																			<tbody>
																				<xsl:for-each select="Beds/Bed">
																					<xsl:variable name="bed" select="@BedID"/>
																					<xsl:choose>
																						<xsl:when test="string-length(//Patient/BedTo[@assignedBed=$bed]/@assignedBed) &gt; 0">
																							<tr class="danger">
																								<td>
																									<xsl:value-of select="@BedID"/>
																								</td>
																								<td>
																									<xsl:value-of select="@BedSize"/>
																								</td>
																								<td>
																									<a href="Patients.html#{//Patient/BedTo[@assignedBed=$bed]/parent::Patient/@PatientID}" target="_blank"><xsl:value-of select="//Patient/BedTo[@assignedBed=$bed]/parent::Patient/PatientName"/></a>
																								</td>
																							</tr>
																						</xsl:when>
																						<xsl:otherwise>
																							<tr class="success">
																								<td>
																									<xsl:value-of select="@BedID"/>
																								</td>
																								<td>
																									<xsl:value-of select="@BedSize"/>
																								</td>
																								<td>
																									Empty
																								</td>
																							</tr>
																						</xsl:otherwise>
																					</xsl:choose>
																				</xsl:for-each>
																			</tbody>
																		</table>
																	</div>
																</div>
															</xsl:for-each>
														</div>
													</div>
												</div>
											</xsl:for-each>
										</div>
									</div>
								</div>
							</xsl:for-each>
						</div>
					</div>
				</div>
				<script>
				  $(function() {
					$( ".accordion" ).accordion({
					  active: false,
					  collapsible: true,
					  heightStyle: "content"
					});
				  });
			  </script>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
