<!DOCTYPE HTML>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE-edge">
<meta http-equiv="Pragma" content="no-cache">
<meta http-equiv="Cache-Control" content="no-cache">
<meta http-equiv="Expires" content="Sat, 01 Dec 2001 00:00:00 GMT">

<title>Wymiana Miedzysystemowa - KSE</title>
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
					<li><a href="http://www.pse.pl/index.php?modul=21&id_rap=9">Wymiana na stronie PSE</a></li>
				</ul>
			</div>
		</div>
	</div>

	<c:choose>
		<c:when test="${mode == 'MODE-WYMIANA'}">
			<div class="container text-center" id="wiatrDiv">
				<h3>Wymiana Miedzysystemowa</h3>
				<hr>
				<div class="table-responsive">
					<table class="table table-striped table-bordered text-left">
						<thead>
							<tr>
								<th>ID</th>
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
									<td>${wymianaMiedzysystemowa.id}</td>
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
									<td><a
										href="updateWymiana?id=${wymianaMiedzysystemowa.id}"><span
											class="glyphicon glyphicon-pencil"></span></a></td>
									<td><a
										href="updateWymiana?id=${wymianaMiedzysystemowa.id}"><span
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
				<h3>Wymiana Miedzysystemowa</h3>
				<hr>
				<form class="form-horizontal" method="post" action="zapiszWymiana">
					<input type="hidden" name="id" value="${wymianaMiedzysystemowa.id}" />
					<div class="form-group">
						<label class="control-label col-md-3">Data</label>
						<div class="col-mid-7">
							<input type="text" class="form-control" name="data"
								value="${wymianaMiedzysystemowa.data}" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">godzina</label>
						<div class="col-mid-7">
							<input type="text" class="form-control" name="godzina"
								value="${wymianaMiedzysystemowa.godzina}" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Eksport Czechy [MWh]</label>
						<div class="col-mid-7">
							<input type="text" class="form-control" name="eCzechy"
								value="${wymianaMiedzysystemowa.eCzechy}" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Import Czechy [MWh]</label>
						<div class="col-mid-7">
							<input type="text" class="form-control" name="iCzechy"
								value="${wymianaMiedzysystemowa.iCzechy}" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Eksport Slowacja
							[MWh]</label>
						<div class="col-mid-7">
							<input type="text" class="form-control" name="eSlowacja"
								value="${wymianaMiedzysystemowa.eSlowacja}" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Import Slowacja
							[MWh]</label>
						<div class="col-mid-7">
							<input type="text" class="form-control" name="iSlowacja"
								value="${wymianaMiedzysystemowa.iSlowacja}" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Eksport Niemcy [MWh]</label>
						<div class="col-mid-7">
							<input type="text" class="form-control" name="eNiemcy"
								value="${wymianaMiedzysystemowa.eNiemcy}" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Import Niemcy [MWh]</label>
						<div class="col-mid-7">
							<input type="text" class="form-control" name="iNiemcy"
								value="${wymianaMiedzysystemowa.iNiemcy}" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Eksport Szwecja
							[MWh]</label>
						<div class="col-mid-7">
							<input type="text" class="form-control" name="eSzwecja"
								value="${wymianaMiedzysystemowa.eSzwecja}" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Import Szwecja [MWh]</label>
						<div class="col-mid-7">
							<input type="text" class="form-control" name="iSzwecja"
								value="${wymianaMiedzysystemowa.iSzwecja}" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Eksport Ukraina
							[MWh]</label>
						<div class="col-mid-7">
							<input type="text" class="form-control" name="eUkraina"
								value="${wymianaMiedzysystemowa.eUkraina}" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Import Ukraina [MWh]</label>
						<div class="col-mid-7">
							<input type="text" class="form-control" name="iUkraina"
								value="${wymianaMiedzysystemowa.iUkraina}" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Eksport Litwa [MWh]</label>
						<div class="col-mid-7">
							<input type="text" class="form-control" name="eLitwa"
								value="${wymianaMiedzysystemowa.eLitwa}" />
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-md-3">Import Litwa [MWh]</label>
						<div class="col-mid-7">
							<input type="text" class="form-control" name="iLitwa"
								value="${wymianaMiedzysystemowa.iLitwa}" />
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