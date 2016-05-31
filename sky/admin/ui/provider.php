<?php
$nya='provider';
if(isset($_GET['act'])) 
	$act=$_GET['act'];
else
	$act='view';
if(isset($_GET['id'])) 
	$id=$_GET['id'];
else 
	$id="";
?>
<script type="text/javascript">
rawr();
$("#query").load("ui/<?php echo "$nya-$act.php"; ?>","nya=<? echo $nya; ?>&act=<? echo $act; ?>&id=<? echo $id; ?>&max_result=10");
</script>
<h1>Proveedores</h1>
<div id="provider-nav" class="nav">
	<a href="ui/provider-view.php" id="nya=provider&amp;act=view&amp;max_result=10" class="query">Consulta</a>
	<a href="ui/provider-add.php" id="nya=provider&amp;" class="query">Agregar</a>
	<!--<a  href="../core/query.php" class="query" id="nya=client&amp;act=modify">Modificar</a>
	<a  href="../core/query.php" class="query" id="nya=client&amp;act=delete">Eliminar</a>-->
</div>
<div id="query"></div>