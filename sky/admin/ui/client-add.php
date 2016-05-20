<script type="text/javascript">
clientAdd();
</script>
<form id="client" action="../core/query.php" method="post"> 
    <input type="hidden" name="nya" value="client" />
    <input type="hidden" name="act" value="add" />
    <input type="text" name="name" placeholder="Nombre" id="name" minlength="3" maxlength="40" class="required" /> <br />
    <input type="text" name="ap" placeholder="Apellido paterno" id="ap" minlength="3" maxlength="40" class="required" /> <br />
    <input type="text" name="am" placeholder="Apellido materno" id="am" minlength="3" maxlength="40" class="" /> <br />
    <input type="text" name="street" placeholder="Calle" maxlength="40" id="street" /> <br />
    <input type="text" name="colony" placeholder="Colonia" maxlength="40" id="colony" /> <br />
    <input type="text" name="cp" placeholder="Código postal" maxlength="40" id="cp" /> <br />
    <input type="text" name="pass" placeholder="Password" maxlength="40" id="pass" /> <br />
    <label for="bhda">Fecha de nacimiento</label><br />
    <input type="date" name="bhda" id="bhda" tabindex="9" /> <br />
    <input type="text" name="phone" placeholder="Teléfono" id="phone" minlength="9" maxlength="18" /> 
	<input type="checkbox" id="cel" />
	<label for="cel">¿Celular?</label> <br />
    <input type="submit" class="boton" value="Agregar Cliente" id="submit" /> 
</form>