<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions">
	<xsl:output method="html" version="1.0" encoding="UTF-8" indent="yes"/>
	<xsl:template match="/">
		<html>
			<head>
				<title>Patients</title>
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
							<li class="active">
								<a href="#">Patients</a>
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
				<!--main-->
				<div class="main">
					<div class="container">
						<h1 style="text-align:center">Patients - Basic Information</h1>
						<div class="accordion">
							<h1 id="patientsAccordion">Patients</h1>
							<div>
								<h3>Patient Statistics</h3>
								<div class="container">
									<h4>Total Number of Patients: <xsl:value-of select="count(//Patient)"></xsl:value-of></h4>
									<h4>Total Number of InPatients: <xsl:value-of select="count(//Patient[@PatientType='InPatient'])"></xsl:value-of></h4>
									<h4>Total Number of Visiting Patients: <xsl:value-of select="count(//Patient[@PatientType='VisitPatient'])"></xsl:value-of></h4>
									<h4>Total Number of OutPatients: <xsl:value-of select="count(//Patient[@PatientType='OutPatient'])"></xsl:value-of></h4>
								</div>
								<div class="accordion">
									<xsl:for-each select="//Patient">
										<h3 id="{@PatientID}">
											<xsl:value-of select="@PatientID"/>
										</h3>
										<div>
											<h3>Patient: <xsl:value-of select="@PatientID"/> - Basic Information</h3>
											<table class="table table-bordered table-striped table-condensed table-hover">
												<thead>
													<tr>
														<th>Patient ID</th>
														<th>Patient Type</th>
														<th>Patient Name</th>
														<th>Gender</th>
														<th>Weight</th>
														<th>Age</th>
														<th>Attended In</th>
														<th>Attended Doctor</th>
														<th>Assigned Bed</th>
														<th>Date Admitted</th>
														<th>Date Released</th>
														<th>Patient Address</th>
														<th>Patient Phone</th>
														<th>Patient Bill</th>
													</tr>
												</thead>
												<tbody>
													<tr>
														<td><xsl:value-of select="@PatientID"></xsl:value-of></td>
														<td><xsl:value-of select="@PatientType"/></td>
														<td><xsl:value-of select="PatientName"/></td>
														<td><xsl:value-of select="Sex/@GenderGategory"/></td>
														<xsl:choose>
															<xsl:when test="exists(Weight/@PatientWeight)">
																<td><xsl:value-of select="Weight/@PatientWeight"/></td>
															</xsl:when>
															<xsl:otherwise>
																<td>Unknown Weight</td>
															</xsl:otherwise>
														</xsl:choose>
														<xsl:choose>
															<xsl:when test="exists(Age/@PatientAge)">
																<td><xsl:value-of select="Age/@PatientAge"/></td>
															</xsl:when>
															<xsl:otherwise>
																<td>Unknown Age</td>
															</xsl:otherwise>
														</xsl:choose>
														<xsl:variable name="attendedIn" select="AttendedDept/@AttendedIn"></xsl:variable>
														<td><xsl:value-of select="//Department[@DeptartID=$attendedIn]/DepartmentName"/></td>
														<td><xsl:for-each select="AttendedDoctor/@AttendedBy"><a href="Staff.html#{current()}"><xsl:value-of select="current()"/></a></xsl:for-each></td>
														<xsl:choose>
															<xsl:when test="exists(BedTo/@assignedBed)">
																<td><xsl:value-of select="BedTo/@assignedBed"/></td>
															</xsl:when>
															<xsl:otherwise>
																<td>Not Assigned</td>
															</xsl:otherwise>
														</xsl:choose>
														<td><xsl:value-of select="RecoveryPeriod/@dateAdmitted"></xsl:value-of></td>
														<xsl:choose>
															<xsl:when test="exists(RecoveryPeriod/@dateDischarged)">
																<td><xsl:value-of select="RecoveryPeriod/@dateDischarged"/></td>
															</xsl:when>
															<xsl:otherwise>
																<td>Still In Hospital for InPatient<br/>OR<br/>Visiting Patient</td>
															</xsl:otherwise>
														</xsl:choose>
														<td><xsl:value-of select="PatientContact/PatientAddress"></xsl:value-of></td>
														<td><xsl:for-each select="PatientContact/PatientPhone"><xsl:value-of select="current()"/><br></br> </xsl:for-each></td>
														<td>
															<xsl:variable name="PatientID" select="@PatientID"></xsl:variable>
															<xsl:choose>
																<xsl:when test="exists(//PatientBill[@BilledPatient=$PatientID])">
																	<xsl:value-of select="//PatientBill[@BilledPatient=$PatientID]/BillCost/@amount"></xsl:value-of>
																	<br></br>
																	<a href="Accounting.html#{//PatientBill[@BilledPatient=$PatientID]/@BillID}"><xsl:value-of select="//PatientBill[@BilledPatient=$PatientID]/@BillID"></xsl:value-of></a>
																</xsl:when>
																<xsl:otherwise>
																	-
																</xsl:otherwise>	
															</xsl:choose>
														</td>
													</tr>
												</tbody>
											</table>
											<h3>Patient: <xsl:value-of select="@PatientID"/> - Health History</h3>
											<xsl:variable name="PatientID" select="@PatientID"></xsl:variable>
											<div class="accordion">
												<xsl:for-each select="//Record/AffiliatedPatient[@AffiliatedPatientID=$PatientID]/parent::Record">
													<h3><xsl:value-of select="@HistoryRecID"></xsl:value-of></h3>
													<div>
														<h4>Patient Latest State: <xsl:value-of select="PatientState/@Pstate"></xsl:value-of></h4>
														<div class="accordion">
															<xsl:for-each select="HistoryUpdate">
																<h3 id="{@HistoryUpdateID}"><xsl:value-of select="@HistoryUpdateID"></xsl:value-of></h3>
																<div>
																	<table class="table table-bordered table-striped table-condensed table-hover">
																		<thead>
																			<tr>
																				<th>Update Date</th>
																				<th>Update Time</th>
																				<th>Affiliated Doctor</th>
																				<th>Affiliated Department</th>
																				<th>Medical Case</th>
																				<th>Doctor Comments</th>
																				<th>Presciption</th>
																			</tr>
																		</thead>
																		<tbody>
																			<tr>
																				<td><xsl:value-of select="UpdateDate/@UptDate"></xsl:value-of></td>
																				<td><xsl:value-of select="UpdateTime/@UptTime"></xsl:value-of></td>
																				<td><xsl:value-of select="AffiliatedDoctor/@AffiliatedDoctorID"></xsl:value-of></td>
																				<td><xsl:value-of select="AffiliatedDepart/@AffiliatedDepartID"></xsl:value-of></td>
																				<td><xsl:value-of select="MedicalCase"></xsl:value-of></td>
																				<td><xsl:value-of select="DoctorComments"></xsl:value-of></td>
																				<td>
																					<xsl:for-each select="Prescription/Pill">
																						<xsl:value-of select="@PillName"></xsl:value-of>, <xsl:value-of select="@Instructions"></xsl:value-of>
																					</xsl:for-each>
																				</td>
																			</tr>
																		</tbody>
																	</table>
																</div>
															</xsl:for-each>
														</div>
													</div>	
												</xsl:for-each>
											</div>
										</div>
									</xsl:for-each>
								</div>
							</div>
						</div>
					</div>
					<!-- end of main container -->
				</div>
				<!-- end of main -->
				<script>
				  $(function() {
					$( ".accordion" ).accordion({
					  active: false,
					  collapsible: true,
					  heightStyle: "content"
					}); if(location.hash) { 
							 var hash = window.location.hash;
							 var thash = hash.substring(hash.lastIndexOf('#'), hash.length);
							 thash = thash.substring(1,thash.length);
							$("#patientsAccordion").trigger('click');
							  thash = $('#' + thash);
							 $(thash).trigger('click');
						}
				  });
			  </script>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
