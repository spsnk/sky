<script type="text/javascript">
	function checkForEnter (event) {
		if (event.keyCode == 13) {
			var textboxes = $("[type=text]:visible");
			currentBoxNumber = textboxes.index(this);
			if (textboxes[currentBoxNumber + 1] != null) {
				nextBox = textboxes[currentBoxNumber + 1]
				nextBox.focus(); 
				nextBox.select();
				event.preventDefault();
				return false;
			}
		}
	};
	$('#stock').validate({
		rules: {
			typeID: {
				notEqual: "-1"
			},
			size: {
				notEqual: "-1"
			},
			price: {
				notEqual: "Precio",
				min: 1
			},
			units: {
				notEqual: "Existencia"
			},
			img: {
				accept: "jpg|jpeg|gif|png"
			}
		},
		messages: {
			typeID: {
				notEqual: "Seleccione un tipo de ropa.",
			},
			size: {
				notEqual: "Seleccione una talla."
			},
			price: {
				required: "Escriba un precio.",
				notEqual: "Escriba un precio.",
				number: "Escriba un precio <i><b>unicamente</b></i> en numeros y punto decimal.",
				min: "El precio debe ser mayor a $1.00."
			},
			units: {
				required: "Escriba el numero de existencias para inventario.",
				notEqual: "Escriba el numero de existencias para inventario.",
				number: "Escriba el numero de existencias para inventario."
			},
			img: {
				accept: "Por favor seleccione una imagen de tipo jpg,jpeg,gif,png."
			}
		},
		submitHandler: function(form) {
			$(form).ajaxSubmit({
				beforeSubmit: function(arr, $form, options) { 
					$('#submits').attr('disabled','disabled');
					if($("#desc").val()=='Descripción')
						$("#desc").val('');
				},
				target: '#debug',
				success: function(){
					$('#query').load("ui/stock-add.php","nya=stock&");
				}
			});
		}
	});
	$('[type=text]').one("focus",function(){
		$(this).css('color','#2d2d2d');
		$(this).val("");
	});
	$('select').one("focus",function(){
		$(this).css('color','#2d2d2d');
		$('[name="'+$(this).attr('name')+'"] > option[value="-1"]').remove();
	});
	$('[type=text]').keydown(checkForEnter);
	$('[type=checkbox]').change(function(){
		$('[for='+$(this).attr("id")+']').toggleClass('active');
	});
  $('#buscanav').filter(':visible').toggle();
</script>
<form id="employee" action="../core/query.php" method="post" enctype="multipart/form-data"> 
    <input type="hidden" name="nya" value="employee" />
    <input type="hidden" name="act" value="add" />
	<div style="float:left;">
		<input type="text" name="name" id="name" placeholder="Nombre"/> <br />
		<input type="text" name="ap" id="ap" placeholder="Apellido Paterno" /> <br />
		<input type="text" name="am" id="am" placeholder="Apellido Materno" /> <br />
		<input type="date" name="hiredt" id="hiredt" /> <br />
		<select name="type">
			  <option value="-1" disabled selected>Tipo</option>
				<option value='T'>Técnico</option>
        <option value='A'>Administrativo</option>
		</select> <br />
    <div id="tech">
      <input type="text" name="area" id="area" placeholder="Area" /> <br />
    </div>
    <div id="admon">
      <input type="text" name="salary" id="salary" placeholder="Salario" /> <br />
      <input type="text" name="hours" id="hours" placeholder="Horas" /> <br />
      <input type="text" name="pass" id="pass" placeholder="Password" /> <br />
    </div>
	</div>
	<br />
	<input type="file" name="img" id="img" accept="image/gif,image/jpeg,image/png" /> <br />
  
  <input type="submit" name="employee" class="boton" value="Agregar a Inventario" id="submits" /> 
</form>
<script>
  document.getElementById('hiredt').value = new Date().toISOString().slice(0,10);
</script>