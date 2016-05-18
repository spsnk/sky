<?php
define("NYA_INIT", "READ");
$cat = $_GET['nya']; 
require_once '../core/PDOconstruct.php';
echo "<br />Catalogo -> $cat <br />";
?>
<script type="text/javascript">rawr();</script>
<br />
<a class="replace-link" href="pages/catalog.php" id="nya=item">Prendas</a>