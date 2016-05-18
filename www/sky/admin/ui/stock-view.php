<?php
include '../../core/query.php';
?>
<script type="text/javascript">
$(document).ready(function(){
	rawr();
	stockView();
	setTimeout(function(){
		$('.stock .img').animate({opacity:1},900);
	},50);
});
///////////////////////////////////////
//$( "#miau" ).css('top',$(window).height()-20);//.draggable();
</script>
<div id="miau">
	<form id="pekenia" action="<? echo WEB_PATH; ?>core/query.php" method="post">
		<img id="photo" />
		<span class="hide"></span>
		<p>Agregar piezas de</p><br>
		<b><a></a></b><br>
		<input type="hidden" name="nya" value="stock" />
		<input type="hidden" name="act" value="add_stock" />
		<input type="hidden" name="id" value="-1" />
		<!--<input type="hidden" name="units" value="-1" />-->
		<button type="button" class="boton minus" title="Menos">
			<img height=13 width=13 src="img/minus.png"/>
		</button>
		<input type="text" name="suma" value="0" class="number" />
		<button type="button" class="boton plus" title="Más">
			<img height=13 width=13 src="img/plus2.png"/>
		</button><br>
		<input type="submit" name="stock" class="boton" value="Agregar" id="submit"/>
		<button type="button" class="boton cancelar">Cancelar</button>
	</form>
</div>
<div id="stock-view-nav">
	<!--<input type="text" value="<?php if(isset($_GET['loli'])) echo $_GET['loli']; else echo "Buscar"; ?>" id="buscador" />
	<input type="hidden" id="result" disabled="disabled"/>-->
	<!--Total de prendas: <? echo $count; ?>-->
	<div id="pages" style="display:inline-block;">
		<?php 
		if(isset($_GET['page'])) $cosita=$_GET['page']; 
		else $cosita=1;
		if(isset($_GET['max_result'])) $limite=$_GET['max_result']; 
		else $limite=10;
		if($cosita>1){ ?>
			<a title='Página #<? echo $cosita-1; ?>' href='ui/stock-view.php?nya=stock&amp;act=view&amp;start=<? echo ($cosita-2)*$limite; ?>&amp;max_result=<? echo $limite; ?>&amp;page=<? echo $cosita-1; ?>' class='query'><</a>
		<? } else { ?>
			<a>&lt;</a>
		<? }
		for($cuenta=0,$thingie=0,$loli=1;$cuenta <= $count/$limite;$cuenta++,$loli++){
			$thingie = $cuenta==0 ? 0 : $cuenta*$limite;
			if($cosita!=$loli) {
				if($thingie<$count){ ?>
					<a title='Página #<? echo $loli; ?>' href='ui/stock-view.php?nya=stock&amp;act=view&amp;start=<? echo $thingie; ?>&amp;max_result=<? echo $limite; ?>&amp;page=<? echo $loli; ?>' class='query'><? echo $loli; ?></a>
				<? } ?>
			<? } else { ?>
				<a title='Página #<? echo $loli; ?>' class='active'><? echo $loli; ?></a>
			<? }
		} ?>
		<? if($cosita*$limite<$count){ ?>
			<a title='Página #<? echo $cosita+1; ?>' href='ui/stock-view.php?nya=stock&amp;act=view&amp;start=<? echo $cosita*$limite; ?>&amp;max_result=<? echo $limite; ?>&amp;page=<? echo $cosita+1; ?>' class='query'>></a>
		<? } else { ?>
			<a>&gt;</a>
		<? } ?>
	</div>
</div>
<div id="results">
	<?php 
	foreach($result as $key => $arr) { ?>
	<?php $arr['schools']=explode( ',' , $arr['schools'] ); ?>
	<div class="display stock" id="<?php echo $arr['ID']; ?>">
		<!--<p style="line-height:80%;">&nbsp;</p>-->
		<form id="update<?php echo $key; ?>" action="<? echo WEB_PATH; ?>core/query.php" method="post" enctype="multipart/form-data">
			<button type="button" class="boton add" title="Agregar Inventario"><img height=13 width=13 src="img/plus2.png"/></button>
			<input type="hidden" name="nya" value="stock" />
			<input type="hidden" name="act" value="update" />
			<input type="hidden" name="id" value=<? echo $arr['ID']; ?> />
			<input type="hidden" name="filename" value="<? echo $arr['img']; ?>" />
			<img class="img" onclick="window.open('<? echo WEB_PATH . "img/catalog/".$arr['img']; ?>','_blank')" id="filename" src="<? echo WEB_PATH . "img/thumb/t_".$arr['img']; ?>" />
			<input type="file" name="img" id="img" accept="image/gif,image/jpeg,image/png" class="hide" style="width:150px;"/><br>
			<!--<a title="Tipo" id="typeID">
				<div class="flechita"></div>
				<?php echo $types[$arr['typeID']-1]['type']; ?>
			</a>-->
			<a title="Nombre" id="name">
				<div class="flechita"></div>
				<?php echo $arr['name']; ?>
			</a>
			<select name="typeID" class="hide">
				<? foreach($types as $typ){ ?>
					<option value=<? echo $typ['ID'].' '; if($arr['typeID']==$typ['ID']) echo 'selected'; ?>><? echo $typ['type']; ?></option>
				<? } ?>
			</select>
			<!--<a title="Descripción" id="desc">
				<?php echo $arr['desc']; ?>
			</a>-->
			<input type="text" name="desc" value="<? echo htmlspecialchars($arr['desc']); ?>" class="hide" id="desc"/><br>
			<a title="Talla" id="size">
				<div class="flechita"></div> 
				Talla <?php echo$arr['size']; ?>
			</a>
			<select name="size" class="hide">
				<? for($talla=2;$talla<=44;$talla++,$talla++){ ?>
					<option value=<? echo $talla.' '; if($talla==$arr['size'])echo 'selected'; ?>><? echo$talla; ?></option>
				<? } ?>
			</select>
			<br>
			<a title="Precio" id="price">
				<div class="flechita"></div> 
				<?php if($arr['price']<=9000) echo "$".$arr['price']; else echo "OVER NINE THOUSAND"; ?>
			</a>
			<input type="text" name="price" value="<? echo $arr['price']; ?>" class="hide required number" /><br>
			<a title="Existencia" id="units"<? echo ($arr['units']<MIN_STOCK_NOTIFY ? 'class="error"':'' );  ?>>
				<div class="flechita"></div> 
				<?php echo$arr['units']; echo" Unidad"; echo ((abs($arr['units'])>1|$arr['units']==0)?"es":""); ?>
			</a>
			<input type="text" name="units" value="<? echo $arr['units']; ?>" class="hide required number" />
			<input type="submit" name="stock" class="hide boton" value="Actualizar" id="submits"/>
			<button type="button" class="hide boton cancelar">Cancelar</button>
			<button type="button" class="boton editar">Editar</button>
			<br>
			<div class="multiple_select">
				<? foreach($schools as $schkey => $sch){ ?>
					<input type="checkbox" value="<? echo $sch['ID']; ?>" name="school[]" id="sch<? echo $schkey.'_'.$arr['ID']; ?>" class="hide" <? foreach($arr['schools'] as $ang){if($ang==$sch['ID']) echo"checked";} ?>/>
					<label for="sch<? echo $schkey.'_'.$arr['ID']; ?>" class="<? foreach($arr['schools'] as $ang){if($ang==$sch['ID']) echo"active";} ?>"><? echo $sch['name']; ?></label>
				<? } ?>
			</div><br>
		</form>
	</div>
	<? } ?>
</div>
