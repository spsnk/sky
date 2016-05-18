<?php
// if(isset($_GET['nya'])) 
	// $nya = $_GET['nya'];
// else
	$nya='client';
if(isset($_GET['act'])) 
	$act=$_GET['act'];
else
	$act='view';
//echo "$nya $act<br/><br/>";
?>
<script type="text/javascript">
rawr();
$("#query").load("ui/<?php echo "$nya-$act.php"; ?>","nya=<? echo $nya; ?>&act=<? echo $act; ?>&max_result=20");
//$('[alt=current]').click().removeAttr('alt');
</script>
<h1>Clientes</h1>
<div id="client-nav">
	<a href="ui/client-view.php" class="query" id="nya=client&amp;act=view&amp;max_result=20" >Consulta</a>
	<a href="ui/client-add.php" class="query">Agregar</a>
	<!--<a  href="../core/query.php" class="query" id="nya=client&amp;act=modify">Modificar</a>
	<a  href="../core/query.php" class="query" id="nya=client&amp;act=delete">Eliminar</a>-->
</div>
<div id="query"></div>