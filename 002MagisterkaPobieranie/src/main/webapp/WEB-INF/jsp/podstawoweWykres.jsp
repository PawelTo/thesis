<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE-edge">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache">
<meta http-equiv="Expires" content="Sat, 01 Dec 2001 00:00:00 GMT">

<link href="static/css/bootstrap.min.css" rel="stylesheet">
<link href="static/css/bootstrap.style.css" rel="stylesheet">
<title>Krajowy System Elektroenergetyczny</title>

</head>

<body>

	<div role="navigation">
		<div class="navbar navbar-inverse">
			<a href="start" class="navbar-brand">Menu</a>
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<li><a href="wartosciPodstawowe">Pokaz dane z bazy</a></li>
					<li><a href="nowaWartPodst">Dodaj Nowe Parametry</a></li>
					<li><a href="ustawDateWartPodsCSV">Pobierz dane z dysku</a></li>
					<li><a href="ustawDateWartPodsHTML">Pobierz dane ze strony
							PSE</a></li>
					<li><a href="wykresPodstawaData">Inna data</a></li>
					<li><a href="http://www.pse.pl/index.php?modul=21&id_rap=8">Wielkosci
							podstawowe na PSE</a></li>
				</ul>
			</div>
		</div>
	</div>

	<script type="text/javascript"
		src="https://www.gstatic.com/charts/loader.js"></script>
	<script type="text/javascript">
	google.charts.load('current', {
		'packages' : [ 'corechart' ]
	});
	google.charts.setOnLoadCallback(drawChart);


	function drawChart() {

		var dataDB = [
[ 'Godzina', 'Zapotrzebowanie KSE', 'Generacja JWCD', 'Generacja PI', 'Generacja IRZ', 'Generacja nJWCD', 'Wymiana miedzysystemowa rownolegla', 'Wymiana miedzysystemowa nierownolegla' ],
<c:forEach items="${wartPodst}" var="wartosciPodstawowe">
['${wartosciPodstawowe.godzina}', ${wartosciPodstawowe.zapotrzebowanie}, ${wartosciPodstawowe.generacjaJWCD}, ${wartosciPodstawowe.generacjaPI}, ${wartosciPodstawowe.generacjaIRZ}, ${wartosciPodstawowe.generacjaNJWCD}, ${wartosciPodstawowe.wymianaRow}, ${wartosciPodstawowe.wymianaNieRow} ],
</c:forEach>];
		var data = google.visualization.arrayToDataTable(dataDB);

		var options = {
			title : 'Wartosci Podstawowe',
			seriesType: 'bars',
			series: {
				0: {type: 'area'},
				1: {type: 'line'},
				4: {type: 'line'}
				},
			hAxis: {title: 'godzina'},
			vAxis: {title: 'MWh'},
	        legend : {
				position : 'top',textStyle: {color: 'black', fontSize: 10},
			}
		};

		var chart = new google.visualization.ComboChart(document
				.getElementById('curve_chart'));

		chart.draw(data, options);
	}
	
</script>
	<div id="curve_chart" style="width: 1400px; height: 600px"></div>

	<div class="container text-center" id="WartoscPodstawowaDiv">
		<h3>Podstawowe parametry systemu</h3>
		<hr>
		<div class="table-responsive">
			<table class="table table-striped table-bordered text-left">
				<thead>
					<tr>
						<th>Data</th>
						<th>Godzina</th>
						<th>Zapotrzebowanie KSE</th>
						<th>Generacja JWCD</th>
						<th>Generacja PI</th>
						<th>Generacja IRZ</th>
						<th>Generacja nJWCD</th>
						<th>Wymiana miedysystemowa rownolegla</th>
						<th>Wymiana miedysystemowa nierownolegla</th>
						<th>Edytuj</th>
						<th>Kasuj</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="wartosciPodstawowe" items="${wartPodst}">
						<tr>
							<td>${wartosciPodstawowe.data}</td>
							<td>${wartosciPodstawowe.godzina}</td>
							<td>${wartosciPodstawowe.zapotrzebowanie}</td>
							<td>${wartosciPodstawowe.generacjaJWCD}</td>
							<td>${wartosciPodstawowe.generacjaPI}</td>
							<td>${wartosciPodstawowe.generacjaIRZ}</td>
							<td>${wartosciPodstawowe.generacjaNJWCD}</td>
							<td>${wartosciPodstawowe.wymianaRow}</td>
							<td>${wartosciPodstawowe.wymianaNieRow}</td>
							<td><a href="updateWartPodst?id=${wartosciPodstawowe.id}"><span
									class="glyphicon glyphicon-pencil"></span></a></td>
							<td><a href="delateWartPodst?id=${wartosciPodstawowe.id}"><span
									class="glyphicon glyphicon-trash"></span></a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>


</body>
</html>