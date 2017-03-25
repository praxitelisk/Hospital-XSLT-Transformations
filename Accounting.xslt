<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:xs="http://www.w3.org/2001/XMLSchema" xmlns:fn="http://www.w3.org/2005/xpath-functions">
	<xsl:output method="html" version="1.0" encoding="UTF-8" indent="yes"/>
	<xsl:template match="/">
		<html>
			<head>
				<title>Accounting</title>
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
							<li>
								<a href="Appointments.html">Appointments</a>
							</li>
							<li class="active">
								<a href="#">Accounting</a>
							</li>
						</ul>
					</div>
				</div>
				<div class="main">
					<div class="container">
						<h1 style="text-align:center">Accounting - Basic Information</h1>
						<div class="accordion">
							<h3 id="expendituresID">Expenditures</h3>
							<div>
								<h4>Total Expenditures: <xsl:value-of select="sum(//Salary/Payment/@amount)+sum(//Order/Cost/@TotalCost)"></xsl:value-of></h4>
								<div class="accordion">
									<h3 id="salariesID">Salaries</h3>
									<div>
										<h3>Salaries Statistics</h3>
										<div class="container">
											<h4>Total Salaries: <xsl:value-of select="sum(//Salary/Payment/@amount)"></xsl:value-of></h4>
										</div>
										<div class="accordion">
											<xsl:for-each select="//Salary">
												<h3 id="{@SalaryID}">
													<xsl:value-of select="@SalaryID"/>
												</h3>
												<table class="table table-bordered table-striped table-condensed table-hover">
													<thead>
														<tr>
															<th>Staff ID</th>
															<th>Payment Amount</th>
														</tr>
													</thead>
													<tbody>
														<tr>
															<td>
																<xsl:value-of select="@staffID"/>
															</td>
															<td>
																<xsl:value-of select="Payment/@amount"/>
															</td>
														</tr>
													</tbody>
												</table>
											</xsl:for-each>
										</div>
									</div>
									<h3>Miscellaneous Orders</h3>
									<div>
										<h4>Total Miscellaneous Orders: <xsl:value-of select="sum(//Order/Cost/@TotalCost)"></xsl:value-of></h4>
										<div class="accordion">
											<xsl:for-each select="//Order">
												<h3 id="{@OrderID}">
													<xsl:value-of select="@OrderID"/>
												</h3>
												<div>
													<table class="table table-bordered table-striped table-condensed table-hover">
														<thead>
															<tr>
																<th>Order ID</th>
																<th>For Department</th>
																<th>Order Date</th>
																<th>Cost</th>
															</tr>
														</thead>
														<tbody>
															<tr>
																<td>
																	<xsl:value-of select="@OrderID"/>
																</td>
																<td>
																	<xsl:value-of select="@ForDepartment"/>
																</td>
																<td>
																	<xsl:value-of select="@OrderDate"/>
																</td>
																<td>
																	<xsl:value-of select="Cost/@TotalCost"/>
																</td>
															</tr>
														</tbody>
													</table>
												</div>
											</xsl:for-each>
										</div>
									</div>
								</div>
							</div>
							<h3 id="incomesID">Incomes</h3>
							<div>
							<h3>Incomes Statistics</h3>
								<div class="container">
									<h4>Total Income: <xsl:value-of select="sum(//PatientBill/BillCost/@amount)"></xsl:value-of></h4>
								</div>
								<div class="accordion">
									<h3 id="patientBillsID">Patient Bills</h3>
									<div>
										<h3>Patient Bills Statistics</h3>
										<div class="container">
											<h4>Sum of all Bills: <xsl:value-of select="sum(//PatientBill/BillCost/@amount)"></xsl:value-of></h4>
										</div>
										<div class="accordion">
											<xsl:for-each select="//PatientBill">
												<h3 id="{@BillID}">
													<xsl:value-of select="@BillID"/>
												</h3>
												<div>
													<table class="table table-bordered table-striped table-condensed table-hover">
														<thead>
															<tr>
																<th>Bill ID</th>
																<th>BilledPatient</th>
																<th>Billed Amount</th>
															</tr>
														</thead>
														<tbody>
															<tr>
																<td>
																	<xsl:value-of select="@BillID"/>
																</td>
																<td>
																	<xsl:value-of select="@BilledPatient"/>
																</td>
																<td>
																	<xsl:value-of select="BillCost/@amount"/>
																</td>
															</tr>
														</tbody>
													</table>
												</div>
											</xsl:for-each>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
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
							 if (thash.indexOf("Salary")>-1) {
								 $("#expendituresID").trigger('click');
								 $("#salariesID").trigger('click');
							 }
							 else {
								 $("#incomesID").trigger('click');
								 $("#patientBillsID").trigger('click'); 
							 }
							  thash = $('#' + thash);
							 $(thash).trigger('click');
						}	
				  });
			  </script>
			</body>
		</html>
	</xsl:template>
</xsl:stylesheet>
