<?php
$nya = "client";
$act = "details";
include '../../core/query.php';
?>
<script type="text/javascript">
$(document).ready(function(){
	rawr();
  $('#buscador').autocomplete({
		source: "../core/query.php?nya=client&act=search",
		minLength: 2,
		focus: function( event, ui ) {
			$( "#buscador" ).val( ui.item.label );
			$( "#result" ).val( ui.item.value );
			return false;
		},
		select: function( event, ui ) {
			$( "#buscador" ).val( ui.item.label );
			$( "#result" ).val( ui.item.value );
			//lolisearch($('#result'),$(this),"client");
      clickclient($('#result').val());
			return false;
		}
	});
});
function clientesearch(result,text,act) {
	if(!isNaN(result.val())) {
		var href="ui/"+act+"-addpack.php";
		var get="nya="+act+"&act=view&id="+result.val()+"&loli="+text.val();
		//$("#status").html(ajax_load);
		$("#query").load(href,get,function(response, status, xhr){
			if (status == "error")
				$("#status").html(href+" "+xhr.statusText+" "+xhr.status);
			// else
				// $("#status")//.html(ajax_ready)
				// .fadeOut(500,function(){$(this).html("").show();});
		});
	}
}
function clickclient(val) {
  var href="ui/client-addpack.php";
  var get="nya=client&act=details&id="+val;
  $("#query").load(href,get,function(response, status, xhr){
    if (status == "error")
      $("#status").html(href+" "+xhr.statusText+" "+xhr.status);
  });
}

$('div.client.display a').click(function(){
  $(this).addClass('hide');
  var parentdiv = 'div#'+$(this).parent().parent().attr('id');
  $(parentdiv+' input[name="'+$(this).attr('id')+'"]').removeClass('hide').focus();
  $(parentdiv+' button[type="button"]').click(function(){
    //$(this).addClass('hide');
    $(parentdiv+' input[type="text"]:visible').each(function(){
      $(this).addClass('hide');
    });
    $(parentdiv+' input[type="submit"]').addClass('hide');
    $(parentdiv+' button[type="button"]').addClass('hide');
    $(parentdiv+' input[type="checkbox"]').addClass('hide');
    $(parentdiv+' a').each(function(){
      $(this).removeClass('hide');
    });
  });
  if(!$(parentdiv+' input[type="submit"]').is(':visible')) {
    $(parentdiv+' input[type="submit"]').removeClass('hide');
    $(parentdiv+' button[type="button"]').removeClass('hide');
  }
  if($(this).attr('id')=='phone'){
    $(parentdiv+' input[type="checkbox"]').removeClass('hide');
  }
});
$('div.client.display form').each(function(){
  //alert($(this).attr('id'));
  $(this).validate({
    submitHandler: function(form) {
      $(form).ajaxSubmit({
        beforeSubmit: function(arr, $form, options) { 
          $('#submit').attr('disabled','disabled');
        },
        target: '#debug',
        success:    function() { 
          $('#query').load("ui/client-addpack.php","nya=client&act=details&id="+$(form).parent().attr("id"));
        }
      });
    }
  });
});

$(' #phone').one("focus",function(){
  if($('#cel').is(":checked"))
    $(this).mask("(999)-99-9999-9999");
  else
    $(this).mask("9999-9999");
});
$(' #cel').change(function(){
  if($(this).is(":checked"))
    $(' #phone').mask("(999)-99-9999-9999");
  else
    $(' #phone').mask("9999-9999");
  $(' #phone').focus();
});
$('#buscapak').autocomplete({
  source: "../core/query.php?nya=package&act=search",
  minLength: 2,
  focus: function( event, ui ) {
    $( "#buscapak" ).val( ui.item.label );
    $( "#pakid" ).val( ui.item.value );
    return false;
  },
  select: function( event, ui ) {
    $( "#buscapak" ).val( ui.item.label );
    $( "#pakid" ).val( ui.item.value );
    //lolisearch($('#pakid'),$(this),"client");
    //clickclient(<?echo $result['nocuenta'];?>);
    return false;
  }
});
$('#buscaser').autocomplete({
  source: "../core/query.php?nya=service&act=search",
  minLength: 2,
  focus: function( event, ui ) {
    $( "#buscaser" ).val( ui.item.label );
    $( "#serid" ).val( ui.item.value );
    return false;
  },
  select: function( event, ui ) {
    $( "#buscaser" ).val( ui.item.label );
    $( "#serid" ).val( ui.item.value );
    //lolisearch($('#pakid'),$(this),"client");
    //clickclient(<?echo $result['nocuenta'];?>);
    return false;
  }
});
$('#buscatec').autocomplete({
  source: "../core/query.php?nya=employee&act=tecsearch",
  minLength: 2,
  focus: function( event, ui ) {
    $( "#buscatec" ).val( ui.item.label );
    $( "#tecid" ).val( ui.item.value );
    return false;
  },
  select: function( event, ui ) {
    $( "#buscatec" ).val( ui.item.label );
    $( "#tecid" ).val( ui.item.value );
    //lolisearch($('#pakid'),$(this),"client");
    //clickclient(<?echo $result['nocuenta'];?>);
    return false;
  }
});
  $("#pak").validate({
    submitHandler: function(form) {
      $(form).ajaxSubmit({
        beforeSubmit: function(arr, $form, options) { 
          $('#submit').attr('disabled','disabled');
        },
        target: '#debug',
        success:    function() { 
          //$('#query').load("ui/client-addpack.php","nya=client&act=details&id="+$(form).parent().attr("id"));
          clickclient(<?echo $result['nocuenta'];?>);
        }
      });
    }
  });
  $("#ser").validate({
    submitHandler: function(form) {
      $(form).ajaxSubmit({
        beforeSubmit: function(arr, $form, options) { 
          $('#submit').attr('disabled','disabled');
        },
        target: '#debug',
        success:    function() { 
          //$('#query').load("ui/client-addpack.php","nya=client&act=details&id="+$(form).parent().attr("id"));
          clickclient(<?echo $result['nocuenta'];?>);
        }
      });
    }
  });
</script>
<div id="client-view-nav">
	<input type="text" value="<?php if(isset($_GET['loli'])) echo $_GET['loli'];?>" placeholder="Buscar" id="buscador" />
	<input type="hidden" id="result" disabled="disabled"/>
</div>
<div id="results">
	<?php $arr = $result;
	//foreach($result as $key => $arr) { 
  ?>
    <div class="client display" style="width:300px; float:left; margin: 10px;" id="<?php echo $arr['nocuenta']; ?>">
      <p style="line-height:80%;">&nbsp;</p>
      <form id="update<?php echo $result['nocuenta'];?>" action="../core/query.php" method="post">
        <input type="hidden" name="nya" value="client" />
        <input type="hidden" name="act" value="update" />
        <input type="hidden" name="id" value=<?php echo $arr['nocuenta']; ?> />
        <a title="Nombre" id="name">
          <div class="flechita"></div> 
          <?php echo $arr['nombre']. " " . $arr['ap'] . " " . $arr['am']; ?>
        </a>
        <input type="text" name="name" value="<?echo htmlspecialchars($arr['nombre']);?>" class="hide" maxlength="40" id="name"/><br>
        <a title="Calle" id="street">
          <div class="flechita"></div> 
          <?php if($arr['calle']!="") echo $arr['calle']; else for($i=0;$i<20;$i++) echo "&nbsp"; ?>
        </a>
        <input type="text" name="street" value="<? echo htmlspecialchars($arr['calle']); ?>" class="hide" maxlength="40" id="street" /><br>
        <a title="Colonia" id="colony">
          <div class="flechita"></div> 
          <?php echo $arr['colonia'];?>
        </a>
        <input type="text" name="colony" value="<? echo htmlspecialchars($arr['colonia']); ?>" class="hide" maxlength="40" id="colony" /><br>
        <a title="Codigo postal" id="cp">
          <div class="flechita"></div> 
          <?php echo $arr['cp'];?>
        </a>
        <input type="text" name="cp" value="<?echo htmlspecialchars($arr['cp']);?>" class="hide" maxlength="40" id="cp"/><br />
        <a title="Fecha de nacimiento" id="bhda">
          <div class="flechita"></div> 
          <?php echo $arr['fechanacimiento'];?>
        </a>
        <input type="text" name="bhda" value="<?echo htmlspecialchars($arr['fechanacimiento']);?>" required class="hide dateISO" maxlength="40" id="bdha"/>
        <br />
        <a title="Teléfono" id="phone">
          <div class="flechita"></div> 
          <?php if($arr['telefono']!="") echo$arr['telefono']; else for($i=0;$i<20;$i++) echo "&nbsp"; ?>
        </a>
        <input type="text" name="phone" value="<?echo $arr['telefono']; ?>" class="hide" maxlength="18" id="phone" style="width: 120px;" />
        <input type="checkbox" id="cel" class="hide cel" title="¿Celular?" /><br>
        <br>
        <input type="submit" class="hide boton" value="Actualizar" id="submit"/> 
        <button type="button" class="hide boton">Cancelar</button>
      </form>
    </div>
    <div class="display" style=" width:250px; float:left; margin: 10px;">
      <p><b>Paquetes contratados</b></p><br/>
      <? foreach($paquete as $pkey => $parr) { ?>
        <div>
        <p>Paquete: <? echo $parr['nombre']; ?></p>
        <p>Fecha de subscripción: <? echo $parr['fechasubscripcion']; ?></p>
        <p>Tarjeta de equipo: <? echo $parr['notarjeta']; ?></p>
        <?if($parr['fechacancelacion']){ ?>
          <p>Cancelación: <? echo $parr['fechacancelacion']; ?></p>
        <? } else { echo "<p><b>Activo</b></p>"; } ?>
        </div><br/>
      <? } ?>
    </div>
    <div class="display" style="width:200px; float:right;  margin: 10px;">
      <p><b>Ultimos servicios</b></p><br/>
      <? foreach($ser as $serkey => $serarr) { ?>
        <p>Fecha: <? echo $serarr['fecha']; ?></p>
        <p>Servicio: <? echo $serarr['nombre']; ?></p>
        <p>Tecnico: <? echo $serarr['tecn']; ?></p>
        <p>Costo: $<? echo $serarr['costo']; ?></p></br>
      <? } ?>
    </div>
    <div class="display" style="width:200px; float:right; margin: 10px;">
      <p><b>Ultimos pagos</b></p><br/>
      <? foreach($pago as $pagokey => $pagoarr) { ?>
        <p>Fecha: <? echo $pagoarr['fecha']; ?></p>
        <p>Monto: <? echo $pagoarr['monto']; ?></p>
        <p>Concepto: <? echo $pagoarr['concepto']; ?></p></br>
      <? } ?>
    </div>
    <div class="display" style="width:200px; clear:left; float:left;   margin: 10px;">
      <p><b>Agregar paquete</b></p><br/>
      <form id="pak" action="../core/query.php" method="post">
          <input type="hidden" name="nya" value="client" />
          <input type="hidden" name="act" value="pak" />
          <input type="hidden" name="id" value=<?php echo $arr['nocuenta']; ?> />
          <input type="text" required placeholder="Buscar paquete" value id="buscapak" autocomplete="off" /><br/>
          <input type="hidden" name="pakid" id="pakid" value required />
          <label for="subdt">Fecha de subscripción</label><br />
          <input type="date" name="subdt" id="subdt" tabindex="9"  required/> <br />
          <input type="submit" class="boton" value="Agregar Paquete" id="submit"/> 
          <script>
            document.getElementById('subdt').value = new Date().toISOString().slice(0,10);
          </script>
      </form>
    </div>
    <div class="display" style="width:200px; float:left;  margin: 10px;">
      <p><b>Agregar Servicio</b></p><br/>
      <form id="ser" action="../core/query.php" method="post">
          <input type="hidden" name="nya" value="client" />
          <input type="hidden" name="act" value="ser" />
          <input type="hidden" name="id" value=<?php echo $arr['nocuenta']; ?> />
          <input type="text" required placeholder="Buscar servicio" value id="buscaser" autocomplete="off" /><br/>
          <input type="hidden" name="serid" id="serid" value required />
          <input type="text" required placeholder="Buscar tecnico" value id="buscatec" autocomplete="off" /><br/>
          <input type="hidden" name="tecid" id="tecid" value required />
          <label for="serdt">Fecha de servicio</label><br />
          <input type="date" name="serdt" id="serdt" tabindex="9"  required/> <br />
          <input type="submit" class="boton" value="Agregar Servicio" id="submit"/> 
          <script>
            document.getElementById('serdt').value = new Date().toISOString().slice(0,10);
          </script>
      </form>
    </div>
	<? 
  //} 
  ?><br>
</div>
