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
				<a href="/v1/governBudget/ministry"><button type="button"
						class="btn btn-primary"
						style="width: 352px; height: 121px; font-size: 24px">
						<span style="font-family: 'Roboto', sans-serif;">รายชื่อหน่วยงานระดับกระทรวง</span>
					</button></a>
			</div>
			<div class="col-3">
				<a href="/v1/governBudget/procurementproject"><button
						type="button" class="btn btn-primary"
						style="width: 352px; height: 121px; font-size: 24px">
						<span style="font-family: 'Roboto', sans-serif;">ข้อมูลโครงการจัดซื้อจัดจ้าง</span>
					</button></a>
			</div>
			<div class="col-3">
				<a href="/v1/governBudget/disbursement2563"><button
						type="button" class="btn btn-primary"
						style="width: 352px; height: 121px; font-size: 24px">
						<span style="font-family: 'Roboto', sans-serif;">ข้อมูลงบประมาณและการเบิกจ่าย<br>ปี 2563</span>
					</button></a>
			</div>
		</div>
	</div>
	<div class="container-fluid" style="margin-top: 20px">
		<div class="row justify-content-center">
			<div class="col-3">
				<a href="/v1/governBudget/province"><button type="button"
						class="btn btn-primary"
						style="width: 352px; height: 121px; font-size: 24px">
						<span style="font-family: 'Roboto', sans-serif;">ข้อมูลรายชื่อจังหวัด</span>
					</button></a>
			</div>
			<div class="col-3">
				<a href="/v1/governBudget/department"><button type="button"
						class="btn btn-primary"
						style="width: 352px; height: 121px; font-size: 24px">
						<span style="font-family: 'Roboto', sans-serif;">ข้อมูลรายชื่อหน่วยงานระดับกรม</span>
					</button></a>
			</div>
			<div class="col-3">
				<a href="/v1/governBudget/juristic"><button type="button"
						class="btn btn-primary"
						style="width: 352px; height: 121px; font-size: 24px">
						<span style="font-family: 'Roboto', sans-serif;">ข้อมูลนิติบุคคล บริษัท ซิโนสยาม จำกัด</span>
					</button></a>
			</div>
		</div>
	</div>
	<div class="container-fluid" style="margin-top: 20px">
		<div class="row justify-content-between">
			<div class="col-5"
				style="text-align: right; font-family: 'Roboto', sans-serif; font-weight: bold;">
				Government Budget and Expenditure ( งบประมาณและการใช้จ่ายของภาครัฐ )</div>
			<div class="col-4">
				Search : <input readonly="readonly" value="${search}"
					style="width: 220px">
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
	<c:if test="${search == \"Ministry List\"}">
		<div class="container-fluid" style="margin-top: 20px">
			<div class="row justify-content-center">
				<div class="col-9">
					<table class="table table-bordered" style="width: 1300px">
						<tr>
							<th>No</th>
							<th>Year</th>
							<th>Ministry Code</th>
							<th>Ministry Name</th>
						</tr>
						<c:forEach items="${Array }" var="ar" varStatus="index">
							<tr>
								<td>${index.index+1 }</td>
								<td>${ar.get("year") }</td>
								<td>${ar.get("min_code") }</td>
								<td>${ar.get("min_name") }</td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
		</div>
	</c:if>
	<c:if test="${search == \"Procurement Project\"}">
		<div class="container-fluid" style="margin-top: 20px">
			<div class="row justify-content-center">
				<div class="col-12">
					<table class="table table-bordered">
						<tr>
							<th>Project ID</th>
							<th>Budget Year</th>
							<th>Project Name</th>
							<th>Project Type</th>
							<th>Project Money</th>
							<th>Project Money Agree</th>
							<th>Winner</th>
							<th>Transaction Date</th>
							<th>Project Status</th>
							<th>Dept Name</th>
							<th>Dept Sub Name</th>
							<th>Group Method</th>
							<th>Method</th>
							<th>Price Build</th>
							<th>Province</th>
							<th>Subdistrict</th>
							<th>district</th>
						</tr>
						<c:forEach items="${Array }" var="ar" varStatus="index">
							<tr>
								<td>${ar.get("project_id") }</td>
								<td>${ar.get("budget_year") }</td>
								<td>${ar.get("project_name") }</td>
								<td>${ar.get("project_type_name") }</td>
								<td>${ar.get("project_money") }</td>
								<td>${ar.get("sum_price_agree") }</td>
								<td>${ar.get("contract").get(0).get("winner") }</td>
								<td>${ar.get("transaction_date") }</td>
								<td>${ar.get("project_status") }</td>
								<td>${ar.get("dept_name") }</td>
								<td>${ar.get("dept_sub_name") }</td>
								<td>${ar.get("purchase_method_group_name") }</td>
								<td>${ar.get("purchase_method_name") }</td>
								<td>${ar.get("price_build") }</td>
								<td>${ar.get("province") }</td>
								<td>${ar.get("subdistrict") }</td>
								<td>${ar.get("district") }</td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
		</div>
	</c:if>
	<c:if test="${search == \"Budget & Disbursement 2563\"}">
		<div class="container-fluid" style="margin-top: 20px">
			<div class="row justify-content-center">
				<div class="col-9">
					<table class="table table-bordered" style="width: 1300px">
						<tr>
							<th>Dept Name</th>
							<th>Total_BB</th>
							<th>Total_GF</th>
							<th>Percent</th>
						</tr>
						<tr>
							<td>${Response.get("dept_name")}</td>
							<td>${Response.get("total_bb")}</td>
							<td>${Response.get("total_gf")}</td>
							<td>${Response.get("percent")}</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</c:if>
	<c:if test="${search == \"Provinces List\"}">
		<div class="container-fluid" style="margin-top: 20px">
			<div class="row justify-content-center">
				<div class="col-9">
					<table class="table table-bordered" style="width: 1300px">
						<tr>
							<th>Province ID</th>
							<th>Province Name</th>
							<th>Province GF Code</th>
							<th>Province Code</th>
						</tr>
						<c:forEach items="${Array }" var="ar" varStatus="index">
							<tr>
								<td>${ar.get("prov_id") }</td>
								<td>${ar.get("prov_name") }</td>
								<td>${ar.get("prov_gf_code") }</td>
								<td>${ar.get("prov_code") }</td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
		</div>
	</c:if>
	<c:if test="${search == \"Department List\"}">
		<div class="container-fluid" style="margin-top: 20px">
			<div class="row justify-content-center">
				<div class="col-9">
					<table class="table table-bordered" style="width: 1300px">
						<tr>
							<th>No</th>
							<th>Agc Code</th>
							<th>Year</th>
							<th>Agc Name</th>
						</tr>
						<c:forEach items="${Array }" var="ar" varStatus="index">
							<tr>
								<td>${index.index+1 }</td>
								<td>${ar.get("agc_code") }</td>
								<td>${ar.get("year") }</td>
								<td>${ar.get("agc_name") }</td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
		</div>
	</c:if>
	<c:if test="${search == \"Juristic ID 0105537004444\"}">
		<div class="container-fluid" style="margin-top: 20px">
			<div class="row justify-content-center">
				<div class="col-9">
					<table class="table table-bordered" style="width: 1300px">
						<tr>
							<th>Key</th>
							<th>Value</th>
						</tr>
						<tr>
							<td>registerCapital</td>
							<td>${Response.get("registerCapital")}</td>
						</tr>
						<tr>
							<td>addressDetail</td>
							<td>${Response.get("addressDetail").get("addressName")}
								${Response.get("addressDetail").get("subDistrict")}
								${Response.get("addressDetail").get("district")}
								${Response.get("addressDetail").get("province")}</td>
						</tr>
						<tr>
							<td>juristicNameTH</td>
							<td>${Response.get("juristicNameTH")}</td>
						</tr>
						<tr>
							<td>juristicStatus</td>
							<td>${Response.get("juristicStatus")}</td>
						</tr>
						<tr>
							<td>juristicNameEN</td>
							<td>${Response.get("juristicNameEN")}</td>
						</tr>
						<tr>
							<td>standardObjective</td>
							<td>${Response.get("standardObjective")}</td>
						</tr>
						<tr>
							<td>juristicType</td>
							<td>${Response.get("juristicType")}</td>
						</tr>
						<tr>
							<td>juristicID</td>
							<td>${Response.get("juristicID")}</td>
						</tr>
						<tr>
							<td>standardObjectiveDetail</td>
							<td>${Response.get("standardObjectiveDetail").get("objectiveDescription")}</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</c:if>
</body>
</html>