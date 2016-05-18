<?php
$nya='stock';
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
$("#query").load("ui/<?php echo "$nya-$act.php"; ?>","nya=<? echo $nya; ?>&act=<? echo $act; ?>&id=<? echo $id; ?> &max_result=10");
</script>
<h1>Empleados</h1>
<div id="employee-nav">
	<a href="ui/employee-view.php" id="nya=employee&amp;act=view&amp;max_result=10" class="query">Consulta</a>
	<a href="ui/employee-add.php" id="nya=employee&amp;" class="query">Agregar</a>
	<!--<a  href="../core/query.php" class="query" id="nya=client&amp;act=modify">Modificar</a>
	<a  href="../core/query.php" class="query" id="nya=client&amp;act=delete">Eliminar</a>-->
</div>
<div id="buscanav" style="float:left;margin-bottom:-1px;">
	<div id="basic">
		<input type="text" value="<?php if(isset($_GET['loli'])) echo $_GET['loli']; else echo "";?>" placeholder="Buscar" id="buscador" />
		<input type="hidden" id="result" disabled="disabled"/>
	</div>
	<div id="adv">
	</div>
</div>
<div id="query"></div>