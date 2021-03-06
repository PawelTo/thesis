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

<link rel="stylesheet" href="static/css/datepicker.css">

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
		<c:when test="${mode == 'MODE-POBIERANIE-DATA-HTML'}">
			<div class="container text-center">
				<h3>Pobieranie danych ze strony PSE</h3>
				<hr>
				<form class="form-horizontal" method="post"
					action="pobieranieWartPodsHTML">
					<div class="form-group">
						<label class="control-label col-md-3">Wartosci Podstawowe
							- ustaw date do pobrania</label>
						<div class="col-mid-7">
							<input type="text" class="form-control" name="string" id="test" />
						</div>
					</div>
					<div class="form-group">
						<input type="submit" class="btn btn-primary" value="pobierz">
					</div>
				</form>
			</div>
		</c:when>
		<c:when test="${mode == 'MODE-POBIERANIE-DATA-CSV'}">
			<div class="container text-center">
				<h3>Pobieranie danych z dysku</h3>
				<hr>
				<form class="form-horizontal" method="post"
					action="pobieranieWartPodsCSV">
					<div class="form-group">
						<label class="control-label col-md-3">Wartosci Podstawowe
							- ustaw date do pobrania</label>
						<div class="col-mid-7">
							<input type="text" class="form-control" name="string" id="test" />
						</div>
					</div>
					<p>
						Pamietaj, zeby plik mial odpowiednia forme <br> oraz
						umieszczony zostal w odpowiedniej lokalizacji. <br>
						Lokalizacja: "C:\wymSQL\" <br> Nazwa Pliku:
						PODSTAWOWE-RRRR-MM-DD
					</p>
					<div class="form-group">
						<input type="submit" class="btn btn-primary" value="pobierz">
					</div>
				</form>
			</div>
		</c:when>
	</c:choose>

	<script src="static/js/jquery-1.11.1.min.js"></script>
	<script src="static/js/bootstrap.min.js"></script>

	<script src="static/js/bootstrap-datepicker.js"></script>
	<script type="text/javascript">
		// When the document is ready
		$(document).ready(function() {

			$('#test').datepicker({
				format : "yyyy-mm-dd"
			});

		});
	</script>
</body>
</html>