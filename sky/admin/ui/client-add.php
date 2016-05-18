<script type="text/javascript">
clientAdd();
</script>
<form id="client" action="../core/query.php" method="post"> 
    <input type="hidden" name="nya" value="client" />
    <input type="hidden" name="act" value="add" />
    <input type="text" name="name" value="Nombre" id="name" minlength="3" maxlength="40" class="required" /> <br />
    <input type="text" name="address" value="Dirección" maxlength="40" id="addr" /> <br />
    <input type="text" name="phone" value="Teléfono" id="phone" minlength="9" maxlength="18" /> 
	<input type="checkbox" id="cel" />
	<label for="cel">¿Celular?</label> <br />
    <input type="submit" class="boton" value="Agregar Cliente" id="submit" /> 
</form>