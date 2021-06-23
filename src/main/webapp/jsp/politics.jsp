<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x"
	crossorigin="anonymous">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link
	href="https://fonts.googleapis.com/css2?family=Roboto&display=swap"
	rel="stylesheet">
<meta charset="utf-8">
<title>Portal API Web Application</title>
</head>
<body style="font-family: 'Roboto', sans-serif;">
	<div class="container-fluid"
		style="background-color: #C4C4C4; height: 50px">
		<div class="row justify-content-between">
			<div class="col-2" style="font-size: 24px; margin: 6px;">
				<a href="/v1/index" style="color: black">Portal API</a>
			</div>
			<div class="col-2"
				style="font-size: 24px; color: #646464; margin: 6px">Date :
				${Date.date}/${Date.month+1}/${1900+Date.year}</div>
		</div>
	</div>
	<div class="container-fluid" style="margin-top: 20px">
		<div class="row justify-content-center">
			<div class="col-3">
				<a href="/v1/politics/localoffice/location"><button type="button" class="btn btn-primary" style="width:352px; height:121px; font-size: 24px"><span style="font-family: 'Roboto', sans-serif;">ข้อมูลสถานที่ตั้งของสำนักงานท้องถิ่นจังหวัด</span></button></a>
			</div>
			<div class="col-3">
				<a href="/v1/politics/organizationoffice/location"><button type="button" class="btn btn-primary" style="width:352px; height:121px; font-size: 24px"><span style="font-family: 'Roboto', sans-serif;">ข้อมูลสถานที่ตั้งของสำนักงานองค์กรปกครองส่วนท้องถิ่น</span></button></a>
			</div>
			<div class="col-3">
				<a href="/v1/politics/organizationoffice/website"><button type="button" class="btn btn-primary" style="width:352px; height:121px; font-size: 24px"><span style="font-family: 'Roboto', sans-serif;">ข้อมูลเว็บไซต์องค์กรปกครองส่วนท้องถิ่น</span></button></a>
			</div>
		</div>
	</div>
	<div class="container-fluid" style="margin-top: 20px">
		<div class="row justify-content-center">
			<div class="col-3">
				<a href="/v1/politics/organizationoffice/code"><button type="button" class="btn btn-primary" style="width:352px; height:121px; font-size: 24px"><span style="font-family: 'Roboto', sans-serif;">รหัส อปท. ตามมาตรฐานเขตการปกครองของไทยรายจังหวัด</span></button></a>
			</div>
		</div>
	</div>
	<div class="container-fluid" style="margin-top: 20px">
		<div class="row justify-content-between">
			<div class="col-5" style="text-align: right; font-family: 'Roboto', sans-serif; font-weight: bold;">
				Politics and Governance ( การเมืองและการปกครอง )
			</div>
			<div class="col-4">
				Search : <input readonly="readonly" value="${search}">
			</div>
		</div>
	</div>
	<div class="container-fluid" style="margin-top: 20px">
		<div class="row justify-content-center" >
			<div class="col-9" >
				<table class="table table-bordered" style="width:1300px">
					<tr>
						<th>Key</th>
						<th>Response</th>
					</tr>
					<c:forEach items="${Map}" var="m">
						<tr>
							<td>${m.key}</td>
							<td>${m.value}</td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
	</div>
	<c:if test="${search == \"Location of Provincial Local Office\"}">
			<div class="container-fluid" style="margin-top: 20px">
				<div class="row justify-content-center" >
					<div class="col-9" >
						<table class="table table-bordered" style="width:1300px">
							<tr>
								<th>Key</th>
								<th>Value</th>
							</tr>
							<tr>
								<td>Total location</td>
								<td>${Total.get("total")}</td>
							</tr>
						</table>
					</div>
				</div>
				<div class="row justify-content-center" >
					<div class="col-9" >
						<table class="table table-bordered" style="width:1300px">
							<tr>
								<th>ID</th>
								<th>Province ID</th>
								<th>Province Name</th>
								<th>Latitude</th>
								<th>Longitude</th>
							</tr>
							<c:forEach items="${Array }" var="ar" varStatus="index">
								<tr>
									<td>${ar.get("_id") }</td>
									<td>${ar.get("PROVINCE_ID") }</td>
									<td>${ar.get("PROVINCE_NAME") }</td>
									<td>${ar.get("LAT") }</td>
									<td>${ar.get("LNG") }</td>
								</tr>
							</c:forEach>
						</table>
					</div>
				</div>
			</div>
		</c:if>
		<c:if test="${search == \"Location of Local Administrative Organization Office\"}">
			<div class="container-fluid" style="margin-top: 20px">
				<div class="row justify-content-center" >
					<div class="col-9" >
						<table class="table table-bordered" style="width:1300px">
							<tr>
								<th>Key</th>
								<th>Value</th>
							</tr>
							<tr>
								<td>Total location</td>
								<td>${Total.get("total")}</td>
							</tr>
						</table>
					</div>
				</div>
				<div class="row justify-content-center" >
					<div class="col-9" >
						<table class="table table-bordered" style="width:1400px">
							<tr>
								<th>ID</th>
								<th>Local Government Organization Name</th>
								<th>Number</th>
								<th>Road</th>
								<th>Village No</th>
								<th>District</th>
								<th>Amphure</th>
								<th>Province</th>
								<th>Zipcode</th>
								<th>Latitude</th>
								<th>Longitude</th>
							</tr>
							<c:forEach items="${Array }" var="ar" varStatus="index">
								<tr>
									<td>${ar.get("_id") }</td>
									<td>${ar.get("Local_government_organization") }</td>
									<td>${ar.get("Number") }</td>
									<td>${ar.get("Road") }</td>
									<td>${ar.get("Village No") }</td>
									<td>${ar.get("Address_district") }</td>
									<td>${ar.get("Address_amphure") }</td>
									<td>${ar.get("Address_province") }</td>
									<td>${ar.get("Zipcode") }</td>
									<td>${ar.get("LAT") }</td>
									<td>${ar.get("LNG") }</td>
									
								</tr>
							</c:forEach>
						</table>
					</div>
				</div>
			</div>
		</c:if>
		<c:if test="${search == \"Website of Provincial Local Office\"}">
			<div class="container-fluid" style="margin-top: 20px">
				<div class="row justify-content-center" >
					<div class="col-9" >
						<table class="table table-bordered" style="width:1300px">
							<tr>
								<th>Key</th>
								<th>Value</th>
							</tr>
							<tr>
								<td>Total location</td>
								<td>${Total.get("total")}</td>
							</tr>
						</table>
					</div>
				</div>
				<div class="row justify-content-center" >
					<div class="col-9" >
						<table class="table table-bordered" >
							<tr>
								<th>ID</th>
								<th>Local Government Organization Name</th>
								<th>Amphure</th>
								<th>Province</th>
								<th>Website</th>
							</tr>
							<c:forEach items="${Array }" var="ar" varStatus="index">
								<tr>
									<td>${ar.get("_id") }</td>
									<td>${ar.get("Local_government_organization") }</td>
									<td>${ar.get("AMP_NAME") }</td>
									<td>${ar.get("PROVINCE_NAME") }</td>
									<td>${ar.get("WEBSITE") }</td>
								</tr>
							</c:forEach>
						</table>
					</div>
				</div>
			</div>
		</c:if>
		<c:if test="${search == \"Code of Provincial Local Office\"}">
			<div class="container-fluid" style="margin-top: 20px">
				<div class="row justify-content-center" >
					<div class="col-9" >
						<table class="table table-bordered" style="width:1300px">
							<tr>
								<th>Key</th>
								<th>Value</th>
							</tr>
							<tr>
								<td>Total location</td>
								<td>${Total.get("numData")}</td>
							</tr>
						</table>
					</div>
				</div>
				<div class="row justify-content-center" >
					<div class="col-9" >
						<table class="table table-bordered" >
							<tr>
								<th>No.</th>
								<th>Code</th>
								<th>Name</th>
								<th>Amphure</th>
								<th>Province</th>
							</tr>
							<c:forEach items="${Array }" var="ar" varStatus="index">
								<tr>
									<td>${ar.get("�ӴѺ") }</td>
									<td>${ar.get("����ͻ�.") }</td>
									<td>${ar.get("����ͻ�.") }</td>
									<td>${ar.get("�����") }</td>
									<td>${ar.get("�ѧ��Ѵ") }</td>
								</tr>
							</c:forEach>
						</table>
					</div>
				</div>
			</div>
		</c:if>
</body>
</html>