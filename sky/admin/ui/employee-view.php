<?php
include '../../core/query.php';
?>
<script type="text/javascript">
  $('#buscador').autocomplete({
		source: "../core/query.php?nya=employee&act=search",
		minLength: 2,
		focus: function( event, ui ) {
			$( "#buscador" ).val( ui.item.label );
			$( "#result" ).val( ui.item.value );
			return false;
		},
		select: function( event, ui ) {
			$( "#buscador" ).val( ui.item.label );
			$( "#result" ).val( ui.item.value );
			lolisearch($('#result'),$(this),"employee");
			return false;
		}
	}).focus(function(){
		$(this).css('color','#2d2d2d');
		$(this).val("");
	}).blur(function(){
		$(this).css('color','#aaa');
		$(this).val("Buscar");
	});
	$('div.client-display a').click(function(){
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
	$('div.employee.display form').each(function(){
		//alert($(this).attr('id'));
		$(this).validate({
			submitHandler: function(form) {
				$(form).ajaxSubmit({
					beforeSubmit: function(arr, $form, options) { 
						$('#submit').attr('disabled','disabled');
					},
					target: '#debug',
					success:    function() { 
						$('#query').load("ui/employee-view.php","nya=employee&act=view&id="+$(form).parent().attr("id"));
					}
				});
			}
		});
	});
	$('input#name').each(function(){
		$(this).rules('add',{
			required: true,
			messages: {
				required: "Por favor escriba un nombre."
			}
		});
	});
  $(document).ready(function(){
    rawr();
    setTimeout(function(){
      $('.employee .img').animate({opacity:1},900);
    },50);
  });
    </script>
<div id="employee-view-nav">
	<input type="text" value="<?php if(isset($_GET['loli'])) echo $_GET['loli']; else echo "";?>" id="buscador" placeholder="Buscar" />
	<input type="hidden" id="result" disabled="disabled"/>
	<!--Total de clientes: <?php echo $count; ?>-->&nbsp;&nbsp;&nbsp;
	<div id="pages" style="display:inline-block;">
		<?php 
		if(isset($_GET['page'])) $cosita=$_GET['page']; 
		else $cosita=1;
		if(isset($_GET['max_result'])) $limite=$_GET['max_result']; 
		else $limite=10;
		if($cosita>1){ ?>
			<a title='Página #<?php echo $cosita-1; ?>' href='ui/employee-view.php?nya=employee&amp;act=view&amp;start=<?php echo ($cosita-2)*$limite; ?>&amp;max_result=<?php echo $limite; ?>&amp;page=<?php echo $cosita-1; ?>' class='query'><</a>
		<?php } else { ?>
			<a>&lt;</a>
		<?php }
		for($cuenta=0,$thingie=0,$loli=1;$cuenta <= $count/$limite;$cuenta++,$loli++){
			$thingie = $cuenta==0 ? 0 : $cuenta*$limite;
			if($cosita!=$loli) {
				if($thingie<$count){ ?>
					<a title='Página #<?php echo $loli;?>' href='ui/employee-view.php?nya=employee&amp;act=view&amp;start=<?php echo $thingie/* > 1 ? $thingie-1 : 0*/; ?>&amp;max_result=<?php echo $limite; ?>&amp;page=<?php echo $loli; ?>' class='query'><? echo $loli; ?></a>
				<?php } ?>
			<?php } else { ?>
				<a title='Página #<?echo $loli;?>' class='active'><?echo $loli;?></a>
			<?php }
		} ?>
		<?php if($cosita*$limite<$count){ ?>
			<a title='Página #<?php echo $cosita+1; ?>' href='ui/employee-view.php?nya=employee&amp;act=view&amp;start=<? echo $cosita*$limite; ?>&amp;max_result=<?php echo $limite; ?>&amp;page=<?php echo $cosita+1; ?>' class='query'>></a>
		<?php } else { ?>
			<a>&gt;</a>
		<?php } ?>
	</div>
</div>
<div id="results">
	<?php 
	foreach($result as $key => $arr) { ?>
	<div class="employee display" id="<?php echo $arr['idEmpleado']; ?>">
		<p style="line-height:80%;">&nbsp;</p>
		<form id="update<?php echo $key;?>" action="../core/query.php" method="post">
			<input type="hidden" name="nya" value="employee" />
			<input type="hidden" name="act" value="update" />
			<input type="hidden" name="id" value=<?php echo $arr['idEmpleado']; ?> />
      <img class="img" onclick="window.open('<? echo WEB_PATH . "img/employee/".$arr['foto']; ?>','_blank')" id="filename" src="<? echo WEB_PATH . "img/employee/thumb/t_".$arr['foto']; ?>" />
			<input type="file" name="foto" id="foto" accept="image/gif,image/jpeg,image/png" class="hide" style="width:150px;"/><br>
			<a title="Nombre" id="name">
				<div class="flechita"></div> 
				<?php echo $arr['nombre']; ?>
			</a>
			<input type="text" name="name" value="<?echo htmlspecialchars($arr['nombre']);?>" class="hide" maxlength="40" id="name"/><br />
			<a title="Apellido Paterno" id="ap">
				<div class="flechita"></div> 
				<?php echo $arr['ap']; ?>
			</a>
			<input type="text" name="ap" value="<?echo htmlspecialchars($arr['ap']);?>" class="hide" maxlength="40" id="ap"/><br />
			<a title="Apellido Materno" id="am">
				<div class="flechita"></div> 
				<?php echo $arr['am']; ?>
			</a>
			<input type="text" name="am" value="<?echo htmlspecialchars($arr['am']);?>" class="hide" maxlength="40" id="am"/><br />
			<a title="Puesto" id="type">
				<div class="flechita"></div> 
				<?php if($arr['tipo'] == 'T') echo "Técnico"; else echo "Administrativo"; ?>
			</a>
      <select name="type" id="type" required class="hide" >
    				<option value='T' <? if($arr['tipo']=='T') echo ("selected"); ?> >Técnico</option>
            <option value='A' <? if($arr['tipo']=='A') echo ("selected"); ?> >Administrativo</option>
    	</select> <br />
			<input type="submit" class="hide boton" value="Actualizar" id="submit"/> 
			<button type="button" class="hide boton">Cancelar</button>
		</form>
	</div>
	<? } ?><br>
</div>
