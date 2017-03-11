<!DOCTYPE HTML>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE-edge">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache">
<meta http-equiv="Expires" content="Sat, 01 Dec 2001 00:00:00 GMT">

<title>Generacja wiatrowa - KSE</title>
<link href="static/css/bootstrap.min.css" rel="stylesheet">
<link href="static/css/bootstrap.style.css" rel="stylesheet">

</head>
<body>

	<div role="navigation">
		<div class="navbar navbar-inverse">
			<a href="start" class="navbar-brand">Menu</a>
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#">Wartosci Podstawowe<span
							class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="wartosciPodstawowe">Pokaz dane z bazy</a></li>
							<li><a href="nowaWartPodst">Dodaj Nowe Parametry</a></li>
							<li><a href="ustawDateWartPodsCSV">Pobierz dane z dysku</a></li>
							<li><a href="ustawDateWartPodsHTML">Pobierz dane ze
									strony PSE</a></li>
							<li><a href="wykresPodstawaData">Pokaz Wykres</a></li>
						</ul> <li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#">Generacja Wiatr<span
							class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="generacjaWiatr">Pokaz dane z bazy</a></li>
							<li><a href="nowaGenWiatr">Dodaj Nowe Parametry</a></li>
							<li><a href="ustawDateWiatrCSV">Pobierz dane z dysku</a></li>
							<li><a href="ustawDateWiatrHTML">Pobierz dane ze strony
									PSE</a></li>
							<li><a href="wykresWiatrData">Pokaz Wykres</a></li>
						</ul>
					
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#">Wymiana Miedzysystemowa<span
							class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="wymianaMiedzysystemowa">Pokaz dane z bazy</a></li>
							<li><a href="nowaWymiana">Dodaj Nowe Parametry</a></li>
							<li><a href="ustawDateWymianaCSV">Pobierz dane z dysku</a></li>
							<li><a href="ustawDateWymianaHTML">Pobierz dane ze
									strony PSE</a></li>
							<li><a href="wykresWymianaData">Pokaz Wykres</a></li>
						</ul>
					<li><a href="http://www.pse.pl/index.php?modul=21&id_rap=24">Wiatr na stronie PSE</a></li>
					<li><a href="http://psew.pl">PSEW</a></li>
				</ul>
			</div>
		</div>
	</div>

	<c:choose>
		<c:when test="${mode == 'MODE-WIATR'}">
			<div class="container text-center" id="wiatrDiv">
				<h3>Generacja z elektrowni wiatrowych</h3>
				<hr>
				<div class="table-responsive">
					<table class="table table-striped table-bordered text-left">
						<thead>
							<tr>
								<th>ID</th>
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
									<td>${generacjaWiatr.id}</td>
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
		</c:when>

		<c:when test="${mode == 'MODE-NOWY' || mode == 'MODE-UPDATE'}">
			<div class="container text-center">
				<h3>Generacja z Wiatru</h3>
				<hr>
				<form class="form-horizontal" method="post" action="zapiszWiatr">
					<input type="hidden" name="id" value="${generacjaWiatr.id}" />
					<div class="form-group">
						<label class="control-label col-md-3">Data</label>
						<div class="col-mid-7">
							<input type="text" class="form-control" name="data"
								value="${generacjaWiatr.data}" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">godzina</label>
						<div class="col-mid-7">
							<input type="text" class="form-control" name="godzina"
								value="${generacjaWiatr.godzina}" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Generacja [MWh]</label>
						<div class="col-mid-7">
							<input type="text" class="form-control" name="generacjaWiatrDouble"
								value="${generacjaWiatr.generacjaWiatrDouble}" />
						</div>
					</div>
					<div class="form-group">
						<input type="submit" class="btn btn-primary" value="zapisz">
					</div>
				</form>
			</div>
		</c:when>
	</c:choose>

	<script src="static/js/jquery-1.11.1.min.js"></script>
	<script src="static/js/bootstrap.min.js"></script>
</body>
</html>