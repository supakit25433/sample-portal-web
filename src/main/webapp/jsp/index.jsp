<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
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
<body style="font-family: 'Roboto', sans-serif; background: #EDEDED">
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
	<div class= "container-fluid" style="margin-top:150px">
		<div class= "row justify-content-center" >
			<div class= "col-2" style="margin:10px; text-align: center;">
				<a href="/v1/education" ><button type="button" class="btn btn-primary" style="width:300px; height:270px; font-size: 30px"><span style="font-family: 'Roboto', sans-serif;">Education<br><br>การศึกษา</span></button></a>
			</div>
			<div class= "col-2" style="margin:10px; text-align: center;">
				<a href="/v1/health"><button type="button" class="btn btn-primary" style="width:300px; height:270px; font-size: 30px">Public Health<br><br>สาธารณสุข</button></a>
			</div>
			<!-- <div class= "col-2" style="margin:10px; text-align: center;">
				<a href="/v1/resource"><button type="button" class="btn btn-primary" style="width:300px; height:270px; font-size: 30px">Natural Resource<br><br>ทรัพยากรธรรมชาติและสิ่งแวดล้อม</button></a>
			</div> -->
		</div>
		<div class= "row justify-content-center">
			<div class= "col-2" style="margin:10px; text-align: center;">
				<a href="/v1/governBudget"><button type="button" class="btn btn-primary" style="width:300px; height:270px; font-size: 30px">Government Budget and Expenditure<br><br>งบประมาณและการใช้จ่ายของภาครัฐ</button></a>
			</div>
			<div class= "col-2" style="margin:10px; text-align: center;">
				<a href="/v1/politics"><button type="button" class="btn btn-primary" style="width:300px; height:270px; font-size: 30px">Politics and Governance<br><br>การเมืองและการปกครอง</button></a>
			</div>
		</div>
	</div>
</body>
</html>