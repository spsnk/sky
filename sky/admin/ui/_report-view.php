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
//echo "$nya $act<br><br>";
?>
<script type="text/javascript">
rawr();
//$("#query").load("ui/<?php echo "$nya-$act.php";?>","nya=<?echo $nya;?>&act=<?echo $act;?>&id=<?echo $id;?>&max_result=10");
</script>
<div id="buscanav" style="float:left;margin-bottom:-1px;">
	<div id="basic">
		<input type="text" value="<?php if(isset($_GET['loli'])) echo $_GET['loli']; else echo "Buscar"; ?>" id="buscador" />
		<input type="hidden" id="result" disabled="disabled"/>
	</div>
	<div id="adv">
	</div>
</div>
<div id="query"></div>