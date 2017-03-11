<!DOCTYPE HTML>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE-edge">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache">
<meta http-equiv="Expires" content="Sat, 01 Dec 2001 00:00:00 GMT">

<title>Krajowy System Elektroenergetyczny</title>

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
						data-toggle="dropdown" href="#">Wartosci Podstawowe<span class="caret"></span></a>
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
					<li><a href="http://www.pse.pl/index.php">Strona glowna
							PSE</a></li>
				</ul>
			</div>
		</div>
	</div>

	<c:choose>
		<c:when test="${mode == 'MODE-DOM'}">
			<div class="container" id="homeDiv">
				<div class="jumbotron text-center">
					<h1>Aplikacja do monitorowania pracy Krajowego Systemu
						Elektroenergetycznego</h1>
				</div>
			</div>
		</c:when>
		<c:when test="${mode == 'MODE-BRAK'}">
			<div class="container" id="homeDiv">
				<div class="jumbotron text-center">
					<h3>Aplikacja do monitorowania pracy Krajowego Systemu
						Elektroenergetycznego</h3>
				</div>
			</div>
			<div class="container" id="brakDiv">
				<div class="jumbotron text-center">
					<h2>Brak danych za wybrany dzien<br>
					Wybierz inna date</h2>
				</div>
			</div>

		</c:when>
	</c:choose>

	<script src="static/js/jquery-1.11.1.min.js"></script>
	<script src="static/js/bootstrap.min.js"></script>

</body>
</html>