<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://www.google.com/jsapi"></script>
<title>구글차트(JSON)</title>
<script type="text/javascript">
google.load("visualization", "1", {
	"packages" : ["corechart"]
});

google.setOnLoadCallback(drawChart);
// .responseText => json을 텍스트로 로컬로 읽어들임 console에서 확인 가능함
function drawChart(){
	var jsonData = $.ajax({
		url : "/resources/json/sampleData.json",
		dataType : "json",
		async : false
	}).responseText;
	
	console.log("jsonData => " + jsonData);

	//jsonData를 2차원 배열 형태로 변환 (google에서 해줌)
	var data = new google.visualization.DataTable(jsonData);
	
// 	var chart = new google.visualization.ColumnChart(document.getElementById("chart_div"));
// 	var chart = new google.visualization.PieChart(document.getElementById("chart_div"));
	var chart = new google.visualization.LineChart(document.getElementById("chart_div"));
	
	chart.draw(data, {
		title:"차트 예제",
		width:600,
		height:400
	});

}
</script>
</head>
<body>
<div class="row">
   <div class="col-xl-8 col-lg-7">
       <!-- Area Chart -->
       <div class="card shadow mb-4">
           <div class="card-header py-3">
               <h6 class="m-0 font-weight-bold text-primary">상품 가격</h6>
           </div>
           <div id="chart_div"></div>
       </div>
	</div>
</div>

</body>
</html>