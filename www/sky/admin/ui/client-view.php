<?php
include '../../core/query.php';
?>
<script type="text/javascript">
$(document).ready(function(){
	rawr();
	clientView();
});
</script>
<div id="client-view-nav">
	<input type="text" value="<?php if(isset($_GET['loli'])) echo $_GET['loli']; else echo "Buscar";?>" id="buscador" />
	<input type="hidden" id="result" disabled="disabled"/>
	<!--Total de clientes: <?php echo $count; ?>-->&nbsp;&nbsp;&nbsp;
	<div id="pages" style="display:inline-block;">
		<?php 
		if(isset($_GET['page'])) $cosita=$_GET['page']; 
		else $cosita=1;
		if(isset($_GET['max_result'])) $limite=$_GET['max_result']; 
		else $limite=10;
		if($cosita>1){ ?>
			<a title='Página #<?php echo $cosita-1; ?>' href='ui/client-view.php?nya=client&amp;act=view&amp;start=<?php echo ($cosita-2)*$limite; ?>&amp;max_result=<?php echo $limite; ?>&amp;page=<?php echo $cosita-1; ?>' class='query'><</a>
		<?php } else { ?>
			<a>&lt;</a>
		<?php }
		for($cuenta=0,$thingie=0,$loli=1;$cuenta <= $count/$limite;$cuenta++,$loli++){
			$thingie = $cuenta==0 ? 0 : $cuenta*$limite;
			if($cosita!=$loli) {
				if($thingie<$count){ ?>
					<a title='Página #<?php echo $loli;?>' href='ui/client-view.php?nya=client&amp;act=view&amp;start=<?php echo $thingie/* > 1 ? $thingie-1 : 0*/; ?>&amp;max_result=<?php echo $limite; ?>&amp;page=<?php echo $loli; ?>' class='query'><? echo $loli; ?></a>
				<?php } ?>
			<?php } else { ?>
				<a title='Página #<?echo $loli;?>' class='active'><?echo $loli;?></a>
			<?php }
		} ?>
		<?php if($cosita*$limite<$count){ ?>
			<a title='Página #<?php echo $cosita+1; ?>' href='ui/client-view.php?nya=client&amp;act=view&amp;start=<? echo $cosita*$limite; ?>&amp;max_result=<?php echo $limite; ?>&amp;page=<?php echo $cosita+1; ?>' class='query'>></a>
		<?php } else { ?>
			<a>&gt;</a>
		<?php } ?>
	</div>
</div>
<div id="results">
	<?php 
	foreach($result as $key => $arr) { ?>
	<div class="client-display" id="<?php echo $arr['ID']; ?>">
		<p style="line-height:80%;">&nbsp;</p>
		<form id="update<?php echo $key;?>" action="../core/query.php" method="post">
			<input type="hidden" name="nya" value="client" />
			<input type="hidden" name="act" value="update" />
			<input type="hidden" name="id" value=<?php echo $arr['ID']; ?> />
			<a title="Nombre" id="name">
				<div class="flechita"></div> 
				<?php echo $arr['name']; ?>
			</a>
			<input type="text" name="name" value="<?echo htmlspecialchars($arr['name']);?>" class="hide" maxlength="40" id="name"/><br>
			<!--<a title="Dirección" id="address">
				<div class="flechita"></div> 
				<?php if($arr['address']!="") echo $arr['address']; else for($i=0;$i<20;$i++) echo "&nbsp"; ?>
			</a>
			<input type="text" name="address" value="<? echo htmlspecialchars($arr['address']); ?>" class="hide" maxlength="40" id="address" /><br>-->
			<a title="Teléfono" id="phone">
				<div class="flechita"></div> 
				<?php if($arr['phone']!="") echo$arr['phone']; else for($i=0;$i<20;$i++) echo "&nbsp"; ?>
			</a>
			<input type="text" name="phone" value="<?echo $arr['phone']; ?>" class="hide" maxlength="18" id="phone" style="width: 120px;" />
			<input type="checkbox" id="cel" class="hide cel" title="¿Celular?" /><br>
			<br>
			<input type="submit" class="hide boton" value="Actualizar" id="submit"/> 
			<button type="button" class="hide boton">Cancelar</button>
		</form>
	</div>
	<? } ?><br>
</div>
