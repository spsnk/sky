<?php
// if(isset($_GET['nya'])) 
	// $nya = $_GET['nya'];
// else
$nya='report';
if(isset($_GET['act'])) 
	$act=$_GET['act'];
else
	$act='view';
if(isset($_GET['id'])) 
	$id=$_GET['id'];
else
	$id="";
//echo "$nya $act<br><br>";
?>
<script type="text/javascript">
rawr();
$("#query").load("ui/<?php echo "$nya-$act.php"; ?>","nya=<? echo $nya; ?>&act=<? echo $act; ?>&id=<? echo $id; ?>&max_result=10");
</script>
<h1>Reportes</h1>
<div id="report-nav">
	<a href="ui/order-view.php" id="nya=order&amp;act=view&amp;max_result=10" class="query">Todos los Pedidos</a>
	<a href="ui/stock-add.php" id="nya=stock&amp;" class="query">Agregar</a>
	<!--<a  href="../core/query.php" class="query" id="nya=client&amp;act=modify">Modificar</a>
	<a  href="../core/query.php" class="query" id="nya=client&amp;act=delete">Eliminar</a>-->
</div>
<div id="buscanav" style="float:left;margin-bottom:-1px;">
	<div id="basic">
		<input type="text" value="<?php if(isset($_GET['loli'])) echo $_GET['loli']; else echo "Buscar"; ?>" id="buscador" />
		<input type="hidden" id="result" disabled="disabled"/>
	</div>
	<div id="adv">
	</div>
</div>
<div id="query"></div>