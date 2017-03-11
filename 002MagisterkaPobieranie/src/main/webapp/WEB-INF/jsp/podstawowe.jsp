<!DOCTYPE HTML>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE-edge">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache">
<meta http-equiv="Expires" content="Sat, 01 Dec 2001 00:00:00 GMT">

<title>Podstawowe Parametry - KSE</title>
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
						</ul>
					<li class="dropdown"><a class="dropdown-toggle"
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
					<li><a href="http://www.pse.pl/index.php?modul=21&id_rap=8">Wielkosci
							podstawowe na PSE</a></li>
				</ul>
			</div>
		</div>
	</div>

	<c:choose>
		<c:when test="${mode == 'MODE-PODSTAWA'}">
			<div class="container text-center" id="WartoscPodstawowaDiv">
				<h3>Podstawowe parametry systemu</h3>
				<hr>
				<div class="table-responsive">
					<table class="table table-striped table-bordered text-left">
						<thead>
							<tr>
								<th>ID</th>
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
									<td>${wartosciPodstawowe.id}</td>
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
		</c:when>

		<c:when test="${mode == 'MODE-NOWY' || mode == 'MODE-UPDATE'}">
			<div class="container text-center">
				<h3>Podstawowe informacje o pracy systemu</h3>
				<hr>
				<form class="form-horizontal" method="post" action="zapiszWartPodst">
					<input type="hidden" name="id" value="${wartoscipodstawowe.id}" />
					<div class="form-group">
						<label class="control-label col-md-3">Data</label>
						<div class="col-mid-7">
							<input type="text" class="form-control" name="data"
								value="${wartoscipodstawowe.data}" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">godzina</label>
						<div class="col-mid-7">
							<input type="text" class="form-control" name="godzina"
								value="${wartoscipodstawowe.godzina}" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Generacja [MWh]</label>
						<div class="col-mid-7">
							<input type="text" class="form-control" name="zapotrzebowanie"
								value="${wartoscipodstawowe.zapotrzebowanie}" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Sumaryczna generacja
							JWCD [MWh]</label>
						<div class="col-mid-7">
							<input type="text" class="form-control" name="generacjaJWCD"
								value="${wartoscipodstawowe.generacjaJWCD}" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Generacja PI [MWh]</label>
						<div class="col-mid-7">
							<input type="text" class="form-control" name="generacjaPI"
								value="${wartoscipodstawowe.generacjaPI}" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Generacja IRZ [MWh]</label>
						<div class="col-mid-7">
							<input type="text" class="form-control" name="generacjaIRZ"
								value="${wartoscipodstawowe.generacjaIRZ}" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Sumaryczna generacja
							nJWCD [MWh]</label>
						<div class="col-mid-7">
							<input type="text" class="form-control" name="generacjaNJWCD"
								value="${wartoscipodstawowe.generacjaNJWCD}" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Saldo wymiany
							miedzysystemowej rownoleglej [MWh]</label>
						<div class="col-mid-7">
							<input type="text" class="form-control" name="wymianaRow"
								value="${wartoscipodstawowe.wymianaRow}" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">SSaldo wymiany
							miedzysystemowej rownoleglej [MWh]</label>
						<div class="col-mid-7">
							<input type="text" class="form-control" name="wymianaNieRow"
								value="${wartoscipodstawowe.wymianaNieRow}" />
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