<?php
if(isset($_GET['nya'])) 
	$nya=$_GET['nya']; 
if(isset($_GET['act'])) 
	$act=$_GET['act'];
echo "<br />Database -> $nya -> $act <br />";
?>
<script type="text/javascript">rawr();</script>
<br />
<a class="query" href="../core/query.php" id="nya=<?echo $nya;?>&amp;act=<?echo $act;?>">Ejecutar Query</a>
<div id="query"></div>