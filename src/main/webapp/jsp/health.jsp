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
				<a href="/v1/health/covid-19/daily"><button type="button" class="btn btn-primary" style="width:352px; height:121px; font-size: 24px"><span style="font-family: 'Roboto', sans-serif;">ข้อมูลเกี่ยวกับ Covid-19<br>ประจำวัน</span></button></a>
			</div>
			<div class="col-3">
				<a href="/v1/health/covid-19/timeline"><button type="button" class="btn btn-primary" style="width:352px; height:121px; font-size: 24px"><span style="font-family: 'Roboto', sans-serif;">ข้อมูลเกี่ยวกับ Covid-19<br>สรุปตามช่วงเวลา</span></button></a>
			</div>
			<div class="col-3">
				<a href="/v1/health/covid-19/bycase"><button type="button" class="btn btn-primary" style="width:352px; height:121px; font-size: 24px"><span style="font-family: 'Roboto', sans-serif;">ข้อมูลเกี่ยวกับ Covid-19<br>สรุปจากเคส</span></button></a>
			</div>
		</div>
	</div>
	<div class="container-fluid" style="margin-top: 20px">
		<div class="row justify-content-between">
			<div class="col-3" style="text-align: right; font-family: 'Roboto', sans-serif; font-weight: bold;">
				Public Health ( สาธารณสุข )
			</div>
			<div class="col-4">
				Search : <input readonly="readonly" value="${search}" >
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
	<c:if test="${search == \"Daily Covid-19\"}">
			<div class="container-fluid" style="margin-top: 20px">
				<div class="row justify-content-center" >
					<div class="col-9" >
						<table class="table table-bordered" style="width:1300px">
							<tr>
								<th>Key</th>
								<th>Value</th>
							</tr>
							<tr>
								<td>Recovered</td>
								<td>${Response.get("Recovered")}</td>
							</tr>
							<tr>
								<td>NewRecovered</td>
								<td>${Response.get("NewRecovered")}</td>
							</tr>
							<tr>
								<td>UpdateDate</td>
								<td>${Response.get("UpdateDate")}</td>
							</tr>
							<tr>
								<td>DevBy</td>
								<td>${Response.get("DevBy")}</td>
							</tr>
							<tr>
								<td>NewHospitalized</td>
								<td>${Response.get("NewHospitalized")}</td>
							</tr>
							<tr>
								<td>NewDeaths</td>
								<td>${Response.get("NewDeaths")}</td>
							</tr>
							<tr>
								<td>Deaths</td>
								<td>${Response.get("Deaths")}</td>
							</tr>
							<tr>
								<td>Confirmed</td>
								<td>${Response.get("Confirmed")}</td>
							</tr>
							<tr>
								<td>Hospitalized</td>
								<td>${Response.get("Hospitalized")}</td>
							</tr>
							<tr>
								<td>NewConfirmed</td>
								<td>${Response.get("NewConfirmed")}</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</c:if>
		<c:if test="${search == \"Timeline Covid-19\"}">
			<div class="container-fluid" style="margin-top: 20px">
				<div class="row justify-content-center" >
					<div class="col-9" >
						<table class="table table-bordered" style="width:1300px">
							<tr>
								<th>Date</th>
								<th>Recovered</th>
								<th>NewRecovered</th>
								<th>NewHospitalized</th>
								<th>NewDeaths</th>
								<th>Deaths</th>
								<th>Confirmed</th>
								<th>Hospitalized</th>
								<th>NewConfirmed</th>
							</tr>
							<c:forEach items="${Array }" var="ar" varStatus="index">
								<tr>
									<td>${ar.get("Date") }</td>
									<td>${ar.get("Recovered") }</td>
									<td>${ar.get("NewRecovered") }</td>
									<td>${ar.get("NewHospitalized") }</td>
									<td>${ar.get("NewDeaths") }</td>
									<td>${ar.get("Deaths") }</td>
									<td>${ar.get("Confirmed") }</td>
									<td>${ar.get("Hospitalized") }</td>
									<td>${ar.get("NewConfirmed") }</td>
								</tr>
							</c:forEach>
						</table>
					</div>
				</div>
			</div>
		</c:if>
		<c:if test="${search == \"Summary Case Covid-19\"}">
			<div class="container-fluid" style="margin-top: 20px">
				<div class="row justify-content-center" >
					<div class="col-9" >
						<h4>Basic Information</h4>
						<table class="table table-bordered" style="width:1300px">
							<tr>
								<th>Key</th>
								<th>Value</th>
							</tr>
							<tr>
								<td>MinAge</td>
								<td>${Response.get("MinAge") }</td>
							</tr>
							<tr>
								<td>MaxAge</td>
								<td>${Response.get("MaxAge") }</td>
							</tr>
							<tr>
								<td>AvgAge</td>
								<td>${Response.get("AvgAge") }</td>
							</tr>
							<tr>
								<td>LastData</td>
								<td>${Response.get("LastData") }</td>
							</tr>
							<tr>
								<td>UpdateDate</td>
								<td>${Response.get("UpdateDate") }</td>
							</tr>
							<tr>
								<td>Source</td>
								<td>${Response.get("Source") }</td>
							</tr>
							<tr>
								<td>DevBy</td>
								<td>${Response.get("DevBy") }</td>
							</tr>
						</table>
					</div>
				</div>
				<div class="row justify-content-center" >
					<div class="col-9" >
						<h4>Province</h4>
						<table class="table table-bordered" style="width:1300px">
							<tr>
								<th>Province</th>
								<th>ProvinceEn</th>
								<th>Count</th>
							</tr>
							<c:forEach items="${ProvinceArray }" var="ar" varStatus="index">
								<tr>
									<td>${ar.get("Province") }</td>
									<td>${ar.get("ProvinceEn") }</td>
									<td>${ar.get("Count") }</td>
								</tr>
							</c:forEach>
						</table>
					</div>
				</div>
				<div class="row justify-content-center" >
					<div class="col-9" >
						<h4>Nation</h4>
						<table class="table table-bordered" style="width:1300px">
							<tr>
								<th>Nation</th>
								<th>NationEn</th>
								<th>Count</th>
							</tr>
							<c:forEach items="${NationArray }" var="ar" varStatus="index">
								<tr>
									<td>${ar.get("Nation") }</td>
									<td>${ar.get("NationEn") }</td>
									<td>${ar.get("Count") }</td>
								</tr>
							</c:forEach>
						</table>
					</div>
				</div>
				<div class="row justify-content-center" >
					<div class="col-9" >
						<h4>Gender</h4>
						<table class="table table-bordered" style="width:1300px">
							<tr>
								<th>Gender</th>
								<th>GenderEn</th>
								<th>Count</th>
							</tr>
							<c:forEach items="${GenderArray }" var="ar" varStatus="index">
								<tr>
									<td>${ar.get("Gender") }</td>
									<td>${ar.get("GenderEn") }</td>
									<td>${ar.get("Count") }</td>
								</tr>
							</c:forEach>
						</table>
					</div>
				</div>
			</div>
		</c:if>
</body>
</html>