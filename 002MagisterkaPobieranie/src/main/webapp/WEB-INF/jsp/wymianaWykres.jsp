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
					<li><a href="wymianaMiedzysystemowa">Pokaz dane z bazy</a></li>
					<li><a href="nowaWymiana">Dodaj Nowe Parametry</a></li>
					<li><a href="ustawDateWymianaCSV">Pobierz dane z dysku</a></li>
					<li><a href="ustawDateWymianaHTML">Pobierz dane ze strony
							PSE</a></li>
					<li><a href="wykresWymianaData">Inna data</a></li>
					<li><a href="http://www.pse.pl/index.php?modul=21&id_rap=9">Wymiana
							na stronie PSE</a></li>
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
[ 'Godzina', 'eksport Czechy', 'import Czechy', 'eksport Slowacja', 'import Slowacja', 'eksport Niemcy', 'import Niemcy', 'eksport Szwecja', 'import Szwecja', 'eksport Ukraina', 'import Ukraina', 'eksport Litwa', 'import Litwa' ],
<c:forEach items="${Wymiana}" var="wymianaMiedzysystemowa">
['${wymianaMiedzysystemowa.godzina}', ${wymianaMiedzysystemowa.eCzechy}, ${wymianaMiedzysystemowa.iCzechy}, ${wymianaMiedzysystemowa.eSlowacja}, ${wymianaMiedzysystemowa.iSlowacja}, ${wymianaMiedzysystemowa.eNiemcy}, ${wymianaMiedzysystemowa.iNiemcy}, ${wymianaMiedzysystemowa.eSzwecja}, ${wymianaMiedzysystemowa.iSzwecja}, ${wymianaMiedzysystemowa.eUkraina}, ${wymianaMiedzysystemowa.iUkraina}, ${wymianaMiedzysystemowa.eLitwa}, ${wymianaMiedzysystemowa.iLitwa} ],
</c:forEach>];
		var data = google.visualization.arrayToDataTable(dataDB);

		var options = {
			title : 'Wymiana Miedzysystemowa',
			titlePosition: 'in',
			curveType : 'function',
			hAxis: {title: 'godzina'},
			vAxis: {title: 'MWh'},
	        colors: ['#003366', '#006699','#000066','#3333ff','#660066','#cc00cc','#993333','#cc0000','#663300','#cc9900','#003300','#009933'],
	        backgroundColor: '#f2f2f2',
	        legend : {
				position : 'top',textStyle: {color: 'black', fontSize: 10},
			}
		};

		var chart = new google.visualization.LineChart(document
				.getElementById('curve_chart'));

		chart.draw(data, options);
	}
	
</script>
	<div id="curve_chart" style="width: 1400px; height: 600px"></div>

	<div class="container text-center" id="wiatrDiv">
		<h3>Wymiana Miedzysystemowa</h3>
		<hr>
		<div class="table-responsive">
			<table class="table table-striped table-bordered text-left">
				<thead>
					<tr>
						<th>Data</th>
						<th>Godzina</th>
						<th>eksport Czechy [MWh]</th>
						<th>import Czechy [MWh]</th>
						<th>eksport Slowacja [MWh]</th>
						<th>import Slowacja [MWh]</th>
						<th>eksport Niemcy [MWh]</th>
						<th>import Niemcy [MWh]</th>
						<th>eksport Szwecja [MWh]</th>
						<th>import Szwecja [MWh]</th>
						<th>eksport Ukraina [MWh]</th>
						<th>import Ukraina [MWh]</th>
						<th>eksport Litwa [MWh]</th>
						<th>import Litwa [MWh]</th>
						<th>Edytuj</th>
						<th>Kasuj</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="wymianaMiedzysystemowa" items="${Wymiana}">
						<tr>
							<td>${wymianaMiedzysystemowa.data}</td>
							<td>${wymianaMiedzysystemowa.godzina}</td>
							<td>${wymianaMiedzysystemowa.eCzechy}</td>
							<td>${wymianaMiedzysystemowa.iCzechy}</td>
							<td>${wymianaMiedzysystemowa.eSlowacja}</td>
							<td>${wymianaMiedzysystemowa.iSlowacja}</td>
							<td>${wymianaMiedzysystemowa.eNiemcy}</td>
							<td>${wymianaMiedzysystemowa.iNiemcy}</td>
							<td>${wymianaMiedzysystemowa.eSzwecja}</td>
							<td>${wymianaMiedzysystemowa.iSzwecja}</td>
							<td>${wymianaMiedzysystemowa.eUkraina}</td>
							<td>${wymianaMiedzysystemowa.iUkraina}</td>
							<td>${wymianaMiedzysystemowa.eLitwa}</td>
							<td>${wymianaMiedzysystemowa.iLitwa}</td>
							<td><a href="updateWymiana?id=${wymianaMiedzysystemowa.id}"><span
									class="glyphicon glyphicon-pencil"></span></a></td>
							<td><a href="updateWymiana?id=${wymianaMiedzysystemowa.id}"><span
									class="glyphicon glyphicon-trash"></span></a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>


</body>
</html>