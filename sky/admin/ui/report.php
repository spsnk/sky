<?php
$nya='report';
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
//$("#query").load("ui/<?php echo "$nya-$act.php"; ?>","nya=<? echo $nya; ?>&act=<? echo $act; ?>&id=<? echo $id; ?>&max_result=10");
$("#rep").validate({
			submitHandler: function(form) {
				$(form).ajaxSubmit({
					beforeSubmit: function(arr, $form, options) { 
						$('#submit').attr('disabled','disabled');
					},
					target: '#debug',
					success:    function() { 
						$('#query').load("ui/report-view.php","nya=report&act=view");
					}
				});
			}
		});
</script>
<h1>Reportes</h1>
<div id="report-nav" class="nav">
  <form id="rep" action="../core/query.php" method="post">
    <input type="hidden" name="nya" value="report" />
    <input type="hidden" name="act" value="view" />
    <label for="date"><b>Selecciona fecha</b></label><br/>
    <input type="month" name="date" id="date" required><br/>
    <input type="submit" value="Mostrar" class="boton" />
  </form>
</div>
<div id="query"></div>