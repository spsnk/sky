<?php
include '../../core/query.php';
?>
<script type="text/javascript">
stockAdd();
</script>
<form id="stock" action="../core/query.php" method="post" enctype="multipart/form-data"> 
    <input type="hidden" name="nya" value="stock" />
    <input type="hidden" name="act" value="add" />
	<div style="float:left;">
		<select name="typeID">
			<option value=-1>Tipo</option>
			<? foreach($types as $arr){?>
				<option value=<?echo $arr['ID'];?>><?echo $arr['type'];?></option>
			<?}?>
		</select> <br />
		<input type="text" name="desc" id="desc" value="Descripción"/> <br />
		<select name="size">
			<option value=-1>Talla</option>
			<?for($talla=2;$talla<=44;$talla++,$talla++){?>
				<option value=<?echo $talla.' ';?>><?echo$talla;?></option>
			<?}?>
		</select> <br />
		<input type="text" name="price" id="price" value="Precio" class="required number" /> <br />
		<input type="text" name="units" value="Existencia" class="required number" /> <br />
	</div>
	<div class="multiple_select">
		<p>Escuelas</p>
		<? foreach($schools as $key => $arr){?>
			<input type="checkbox" value="<?echo $arr['ID'];?>" name="school[]" id="sch<?echo $key;?>" class="hide"/>
			<label for="sch<?echo $key;?>"><?echo $arr['name'];?></label>
		<?}?>
	</div>
	<br />
	<input type="file" name="img" id="img" accept="image/gif,image/jpeg,image/png" /> <br />
    <input type="submit" name="stock" class="boton" value="Agregar a Inventario" id="submits" /> 
</form>