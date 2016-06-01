<?php
include '../../core/query.php';
?>
<script type="text/javascript">
$(document).ready(function(){
	rawr();
	//clientView();
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
			lolisearch($('#result'),$(this),"client");
			return false;
		}
	}).focus(function(){
		$(this).css('color','#2d2d2d');
		$(this).val("");
	}).blur(function(){
		$(this).css('color','#aaa');
		$(this).val("Buscar");
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
	<div class="client display" id="<?php echo $arr['nocuenta']; ?>">
		<p style="line-height:80%;">&nbsp;</p>
		<form id="update<?php echo $key;?>" action="../core/query.php" method="post">
			<input type="hidden" name="nya" value="client" />
			<input type="hidden" name="act" value="update" />
			<input type="hidden" name="id" value=<?php echo $arr['nocuenta']; ?> />
			<a title="Nombre" id="name">
				<div class="flechita"></div> 
				<?php echo $arr['nombre']. " " . $arr['ap'] . " " . $arr['am']; ?>
			</a>
			<input type="text" name="name" value="<?echo htmlspecialchars($arr['nombre']);?>" class="hide" maxlength="40" id="name" tabindex="1" /><br>
			<a title="Calle" id="street">
				<div class="flechita"></div> 
				<?php if($arr['calle']!="") echo $arr['calle']; else for($i=0;$i<20;$i++) echo "&nbsp"; ?>
			</a>
			<input type="text" name="street" value="<? echo htmlspecialchars($arr['calle']); ?>" class="hide" maxlength="40" id="street" tabindex="2" /><br>
			<a title="Colonia" id="colony">
				<div class="flechita"></div> 
				<?php echo $arr['colonia'];?>
			</a>
			<input type="text" name="colony" value="<? echo htmlspecialchars($arr['colonia']); ?>" class="hide" maxlength="40" id="colony"  tabindex="3" /><br>
			<a title="Codigo postal" id="cp">
				<div class="flechita"></div> 
				<?php echo $arr['cp'];?>
			</a>
      <input type="text" name="cp" value="<? echo htmlspecialchars($arr['cp']); ?>" class="hide" maxlength="40" id="cp" tabindex="4" /><br />
			<a title="Fecha de nacimiento" id="bhda">
				<div class="flechita"></div> 
				<?php echo $arr['fechanacimiento'];?>
			</a>
      <input type="date" name="bhda" class="hide" value="<? echo $arr['fechanacimiento']; ?>" id="bhda" required tabindex="5" />
      <br />
			<a title="Teléfono" id="phone">
				<div class="flechita"></div> 
				<?php if($arr['telefono']!="") echo$arr['telefono']; else for($i=0;$i<20;$i++) echo "&nbsp"; ?>
			</a>
			<input type="text" name="phone" value="<?echo $arr['telefono']; ?>" class="hide" maxlength="18" id="phone" style="width: 120px;" tabindex="6" />
			<input type="checkbox" id="cel" class="hide cel" title="¿Celular?" /><br>
			<br>
			<input type="submit" class="hide boton" value="Actualizar" id="submit"/> 
			<button type="button" class="hide boton">Cancelar</button>
		</form>
    <button type="button" onclick="javascript: clickclient(<?php echo $arr['nocuenta']; ?>);" class="boton">Detalles</button>
	</div>
	<? } ?><br>
</div>
