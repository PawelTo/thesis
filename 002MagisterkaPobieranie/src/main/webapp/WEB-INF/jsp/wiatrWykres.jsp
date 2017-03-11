<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
					<li><a href="generacjaWiatr">Pokaz dane z bazy</a></li>
					<li><a href="nowaGenWiatr">Dodaj Nowe Parametry</a></li>
					<li><a href="ustawDateWiatrCSV">Pobierz dane z dysku</a></li>
					<li><a href="ustawDateWiatrHTML">Pobierz dane ze strony
							PSE</a></li>
					<li><a href="wykresWiatrData">Inna data</a></li>
					<li><a href="http://www.pse.pl/index.php?modul=21&id_rap=24">Wiatr
							na stronie PSE</a></li>
					<li><a href="http://psew.pl">PSEW</a></li>
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
[ 'Godzina', 'generacja'],
<c:forEach items="${Wiatr}" var="generacjaWiatr">
['${generacjaWiatr.godzina}', ${generacjaWiatr.generacjaWiatrDouble} ],
</c:forEach>];
		var data = google.visualization.arrayToDataTable(dataDB);

		var options = {
			title : 'Generacja z wiatru',
			curveType : 'function',
			hAxis: {title: 'godzina'},
			vAxis: {title: 'MWh'},
			legend : {
				position : 'none'
			}
		};

		var chart = new google.visualization.AreaChart(document
				.getElementById('curve_chart'));

		chart.draw(data, options);
	}
	
</script>
	<div id="curve_chart" style="width: 1400px; height: 600px"></div>

	<div class="container text-center" id="wiatrDiv">
		<h3>Generacja z elektrowni wiatrowych</h3>
		<hr>
		<div class="table-responsive">
			<table class="table table-striped table-bordered text-left">
				<thead>
					<tr>
						<th>Data</th>
						<th>Godzina</th>
						<th>Generacja [MWh]</th>
						<th>Edytuj</th>
						<th>Kasuj</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="generacjaWiatr" items="${Wiatr}">
						<tr>
							<td>${generacjaWiatr.data}</td>
							<td>${generacjaWiatr.godzina}</td>
							<td>${generacjaWiatr.generacjaWiatrDouble}</td>
							<td><a href="updateWiatr?id=${generacjaWiatr.id}"><span
									class="glyphicon glyphicon-pencil"></span></a></td>
							<td><a href="delateWiatr?id=${generacjaWiatr.id}"><span
									class="glyphicon glyphicon-trash"></span></a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>


</body>
</html>