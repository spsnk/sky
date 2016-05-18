<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" class="back">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Administración</title>
<link rel="stylesheet" type="text/css" href="css/main.css" />
<link rel="stylesheet" type="text/css" href="css/redmond/jquery-ui-1.8.16.custom.css" />
<link rel="shortcut icon" type="image/x-icon" href="favicon.ico" />
<!--<script type="text/javascript" src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.7.min.js"></script>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery-ui-1.8.14.custom.min.js"></script>
<script type="text/javascript" src="js/jquery-ui.min.js"></script>-->
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1/jquery-ui.min.js"></script>
<script type="text/javascript" src="js/jquery.form.js"></script>
<script type="text/javascript" src="js/jquery.validate.min.js"></script>
<script type="text/javascript" src="js/jquery.maskedinput-1.3.min.js"></script>
<script type="text/javascript" src="js/main.js"></script>
</head>
<body>
	<!-- Begin Wrapper -->
	<div id="wrapper">
		<!-- Begin Left Column -->
		<div id="nav" class="hud">
			<div id="menu">
				<a href="ui/employee.php" class="ajax">
				<div class="flechita"></div>
				Empleados </a>
				<a href="ui/service.php" class="ajax">
				<div class="flechita"></div>
				Servicios </a>
				<a href="ui/channel.php" class="ajax">
				<div class="flechita"></div>
				Canales </a>
				<a href="ui/package.php" class="ajax">
				<div class="flechita"></div>
				Paquetes </a>
				<a href="ui/equipment.php" class="ajax">
				<div class="flechita"></div>
				Equipos </a>
				<a href="ui/client.php" class="ajax">
				<div class="flechita"></div>
				Clientes </a>
				<a href="ui/payment.php" class="ajax">
				<div class="flechita"></div>
				Pagos </a>
				<a href="ui/provider.php" class="ajax">
				<div class="flechita"></div>
				Proveedores </a>
			</div>
			<div id="devmenu">
				<a onclick="$('#ajax').html('');">CLS</a><br>
				<a onclick="toggleFx();">EFF</a><br>
				<a onclick="$('#debug').toggle(400);">DBG</a>
			</div>
		</div>
		<!-- End Left Column -->
		<!-- Begin Right Column -->
		<div id="content">
			<div id="toggle" title="Esconder" class="hud"><div id="toggle-icon"></div></div>
			<div id="ajax"></div>
		</div>
		<!-- End Right Column -->
		<!-- Begin Footer -->
		<div id="footer" class="hud">
			<div id="status"><img height="16" width="16" src='img/ajaxloading.gif' /> Cargando...</div>
			<div id="footertext">&copy; <?php date_default_timezone_set('UTC'); echo date("Y"); ?> <!--| Desarrollado por <a href="http://pinkuproject.net">ThePinkuProject</a> | <a href="http://jigsaw.w3.org/css-validator/check/referer?profile=css3&amp;vextwarning=true">CSS3 Valid</a> | <a href="http://validator.w3.org/check?uri=referer">XHTML 1.0s Valid</a>-->
			</div>
			<span id="infoboton" class="infoboton"></span>
		</div>
		<!-- End Footer -->
	</div>
	<!-- End Wrapper -->
	<div id="overlay" class="overlay"></div>
	<div id="debug"></div>
	<div id="infopopup"></div>
</body>
</html>