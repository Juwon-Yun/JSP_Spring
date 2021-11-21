<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://www.google.com/jsapi"></script>
<title>구글차트(오라클 DBMS) /chart/chart02.jsp</title>
</head>
<body>
<div class="row">
	<div class="col-xl-8 col-lg-7">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary">상품 가격</h6>
		</div>
		<div id="chart_div"></div>
	</div>
</div>

<script type="text/javascript">
google.load("visualization", "1", {
	"packages" : ["corechart"]
});

google.setOnLoadCallback(drawChart);
// .responseText => json을 텍스트로 로컬로 읽어들임 console에서 확인 가능함
function drawChart(){
	var = jsonData = $.ajax({
		url : "/chart/chart02_money",
		dataType : "json",
		async:false
	}).responseText;
	
	console.log("jsonData " + jsonData);

	var data = new google.visualization.DataTable(jsonData);
	
	//어떤 모양으로 출력할지 정해줌
// 	var chart = new google.visualization.ColumnChart(
// 			document.getElementById("chart_div"));
// 	var chart = new google.visualization.PieChart(
// 		document.getElementById("chart_div"));
	var chart = new google.visualization.LineChart(
		document.getElementById("chart_div"));
	
	//chart.draw(데이터테이블, 옵션)
	chart.draw(data,{
		title:"차트 예제",
		width:500,
		height:400
	});
	
}


</script>
</body>
</html>