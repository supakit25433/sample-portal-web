<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
<meta charset="UTF-8">
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
				<a href="/v1/education/university"><button type="button"
						class="btn btn-primary"
						style="width: 352px; height: 121px; font-size: 24px">
						<span style="font-family: 'Roboto', sans-serif;">ข้อมูลพื้นฐานสถาบันอุดมศึกษา<br>ปีการศึกษา
							2563
						</span>
					</button></a>
			</div>
			<div class="col-3">
				<a href="/v1/education/demonstration"><button type="button"
						class="btn btn-primary"
						style="width: 352px; height: 121px; font-size: 24px">
						<span style="font-family: 'Roboto', sans-serif;">รายชื่อโรงเรียนสาธิต<br>ในสถาบันอุดมศึกษา
						</span>
					</button></a>
			</div>
			<div class="col-3">
				<a href="/v1/education/demonstration/nameandsex"><button
						type="button" class="btn btn-primary"
						style="width: 352px; height: 121px; font-size: 24px">
						<span style="font-family: 'Roboto', sans-serif;">จำนวนนักเรียนโรงเรียนสาธิต<br>ปีการศึกษา
							2563<br>จำแนกตาม ชื่อโรงเรียน และเพศ
						</span>
					</button></a>
			</div>
		</div>
	</div>
	<div class="container-fluid" style="margin-top: 20px">
		<div class="row justify-content-between">
			<div class="col-3"
				style="text-align: right; font-family: 'Roboto', sans-serif; font-weight: bold;">
				Education ( การศึกษา )</div>
			<div class="col-4">
				Search : <input readonly="readonly" value="${search}">
			</div>
		</div>
	</div>
	<div class="container-fluid" style="margin-top: 20px">
		<div class="row justify-content-center">
			<div class="col-9">
				<table class="table table-bordered" style="width: 1300px">
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
	<c:if test="${search == \"University\"}">
		<div class="container-fluid" style="margin-top: 20px">
			<div class="row justify-content-center">
				<div class="col-12">
					<table class="table table-bordered" style="width: 1300px">
						<tr>
							<th>No</th>
							<th>UNIV_MASTER_ID</th>
							<th>UNIV_ID</th>
							<th>UNIV_MASTER_NAME</th>
							<th>SchoolNameEng</th>
							<th>UNIV_NAME</th>
							<th>campus_type</th>
							<th>UNIV_TYPE_NAME</th>
							<th>PROVINCE_NAME</th>
							<th>province_name_eng</th>
							<th>REGION_NAME</th>
							<th>Latitude</th>
							<th>Longitude</th>
							<th>Website</th>
						</tr>
						<c:forEach items="${Array}" var="array" varStatus="index">
							<tr>
								<td>${index.index+1}</td>
								<td>${array.get("UNIV_MASTER_ID")}</td>
								<td>${array.get("﻿UNIV_ID")}</td>
								<td>${array.get("UNIV_MASTER_NAME")}</td>
								<td>${array.get("SchoolNameEng")}</td>
								<td>${array.get("UNIV_NAME")}</td>
								<td>${array.get("campus_type")}</td>
								<td>${array.get("UNIV_TYPE_NAME")}</td>
								<td>${array.get("PROVINCE_NAME")}</td>
								<td>${array.get("province_name_eng")}</td>
								<td>${array.get("REGION_NAME")}</td>
								<td>${array.get("Latitude")}</td>
								<td>${array.get("Longitude")}</td>
								<td>${array.get("Website")}</td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
		</div>
	</c:if>
	<c:if test="${search == \"Demonstration School\"}">
		<div class="container-fluid" style="margin-top: 20px">
			<div class="row justify-content-center">
				<div class="col-9">
					<table class="table table-bordered" style="width: 1300px">
						<tr>
							<th>No</th>
							<th>SCHOOL_ID</th>
							<th>UNIV_MASTER_NAME</th>
							<th>SCHOOL_NAME</th>
						</tr>
						<c:forEach items="${Array}" var="array" varStatus="index">
							<tr>
								<td>${index.index+1}</td>
								<td>${array.get("SCHOOL_ID")}</td>
								<td>${array.get("UNIV_MASTER_NAME")}</td>
								<td>${array.get("SCHOOL_NAME")}</td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
		</div>
	</c:if>
	<c:if test="${search == \"Number of Students\"}">
		<div class="container-fluid" style="margin-top: 20px">
			<div class="row justify-content-center">
				<div class="col-9">
					<table class="table table-bordered" style="width: 1300px">
						<tr>
							<th>No</th>
							<th>SCHOOL_NAME</th>
							<th>GENDER_NAME</th>
							<th>TOTAL SATIT STD</th>
						</tr>
						<c:forEach items="${Array}" var="array" varStatus="index">
							<tr>
								<td>${index.index+1}</td>
								<td>${array.get("SCHOOL_NAME")}</td>
								<td>${array.get("GENDER_NAME")}</td>
								<td>${array.get("TOTAL SATIT STD")}</td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
		</div>
	</c:if>
</body>
</html>