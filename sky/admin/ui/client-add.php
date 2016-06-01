<script type="text/javascript">
//clientAdd();
$('#client').validate({
  debug: false,
  rules: {
    type: {
      required: true
    },
    name: {
      required: true
    },
    ap: {
      required: true
    },
    pass: {
      required:true
    }
  },submitHandler: function(form) {
    $(form).ajaxSubmit({
      beforeSubmit: function(arr, $form, options) { 
        $('#submits').attr('disabled','disabled');
      },
      target: '#debug',
      success: function(){
        console.log("GREAT SUCESS! \n id="+lastClient);
        //$('#query').load("ui/employee-add.php");
        $('#query').load("ui/client-view.php","nya=client&act=view&id="+lastClient);
      }
    });
  }
});
$('[type=text]').keydown(checkForEnter);

$('#client #phone').one("focus",function(){
  if($('#cel').is(":checked"))
    $(this).mask("(999)-99-9999-9999");
  else
    $(this).mask("9999-9999");
});
$('#client #cel').change(function(){
  if($(this).is(":checked"))
    $('#client #phone').mask("(999)-99-9999-9999");
  else
    $('#client #phone').mask("9999-9999");
  $('#client #phone').focus();
});
</script>
<form id="client" action="../core/query.php" method="post"> 
    <input type="hidden" name="nya" value="client" />
    <input type="hidden" name="act" value="add" />
    <input type="text" name="name" placeholder="Nombre" id="name" minlength="3" maxlength="40" class="required" /> <br />
    <input type="text" name="ap" placeholder="Apellido paterno" id="ap" minlength="3" maxlength="40" class="required" /> <br />
    <input type="text" name="am" placeholder="Apellido materno" id="am" minlength="3" maxlength="40" class="" /> <br />
    <input type="text" name="street" placeholder="Calle" maxlength="40" id="street" required /> <br />
    <input type="text" name="colony" placeholder="Colonia" maxlength="40" id="colony" required /> <br />
    <input type="text" name="cp" placeholder="Código postal" maxlength="40" id="cp" required /> <br />
    <input type="password" name="pass" placeholder="Password" maxlength="40" id="pass" required /> <br />
    <label for="bhda">Fecha de nacimiento</label><br />
    <input type="date" name="bhda" id="bhda" tabindex="9" required /> <br />
    <input type="text" name="phone" placeholder="Teléfono" id="phone" minlength="9" maxlength="18" /> 
	<input type="checkbox" id="cel" />
	<label for="cel">¿Celular?</label> <br />
    <input type="submit" class="boton" value="Agregar Cliente" id="submit" /> 
    
</form>