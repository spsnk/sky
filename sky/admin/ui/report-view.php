<?php
include '../../core/query.php';
?>
<script type="text/javascript">
  $('#buscador').autocomplete({
		source: "../core/query.php?nya=payment&act=search",
		minLength: 2,
		focus: function( event, ui ) {
			$( "#buscador" ).val( ui.item.label );
			$( "#result" ).val( ui.item.value );
			return false;
		},
		select: function( event, ui ) {
			$( "#buscador" ).val( ui.item.label );
			$( "#result" ).val( ui.item.value );
			lolisearch($('#result'),$(this),"payment");
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
	$('div.payment.display form').each(function(){
		//alert($(this).attr('id'));
		$(this).validate({
			submitHandler: function(form) {
				$(form).ajaxSubmit({
					beforeSubmit: function(arr, $form, options) { 
						$('#submit').attr('disabled','disabled');
					},
					target: '#debug',
					success:    function() { 
						$('#query').load("ui/payment-view.php","nya=payment&act=view&id="+$(form).parent().attr("id"));
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
      $('.payment .img').animate({opacity:1},900);
    },50);
  });
    </script>
<div id="payment-view-nav">
	<input type="text" style="width:500px;" value="<?php if(isset($_GET['loli'])) echo $_GET['loli']; else echo "";?>" id="buscador" placeholder="Buscar" />
	<input type="hidden" id="result" disabled="disabled"/>
	<!--Total de clientes: <?php echo $count; ?>-->&nbsp;&nbsp;&nbsp;
	<div id="pages" style="display:inline-block;">
		<?php 
		if(isset($_GET['page'])) $cosita=$_GET['page']; 
		else $cosita=1;
		if(isset($_GET['max_result'])) $limite=$_GET['max_result']; 
		else $limite=10;
		if($cosita>1){ ?>
			<a title='Página #<?php echo $cosita-1; ?>' href='ui/payment-view.php?nya=payment&amp;act=view&amp;start=<?php echo ($cosita-2)*$limite; ?>&amp;max_result=<?php echo $limite; ?>&amp;page=<?php echo $cosita-1; ?>' class='query'><</a>
		<?php } else { ?>
			<a>&lt;</a>
		<?php }
		for($cuenta=0,$thingie=0,$loli=1;$cuenta <= $count/$limite;$cuenta++,$loli++){
			$thingie = $cuenta==0 ? 0 : $cuenta*$limite;
			if($cosita!=$loli) {
				if($thingie<$count){ ?>
					<a title='Página #<?php echo $loli;?>' href='ui/payment-view.php?nya=payment&amp;act=view&amp;start=<?php echo $thingie/* > 1 ? $thingie-1 : 0*/; ?>&amp;max_result=<?php echo $limite; ?>&amp;page=<?php echo $loli; ?>' class='query'><? echo $loli; ?></a>
				<?php } ?>
			<?php } else { ?>
				<a title='Página #<?echo $loli;?>' class='active'><?echo $loli;?></a>
			<?php }
		} ?>
		<?php if($cosita*$limite<$count){ ?>
			<a title='Página #<?php echo $cosita+1; ?>' href='ui/payment-view.php?nya=payment&amp;act=view&amp;start=<? echo $cosita*$limite; ?>&amp;max_result=<?php echo $limite; ?>&amp;page=<?php echo $cosita+1; ?>' class='query'>></a>
		<?php } else { ?>
			<a>&gt;</a>
		<?php } ?>
	</div>
</div>
<div id="results">
	<?php 
	foreach($result as $key => $arr) { ?>
	<div class="payment display" id="<?php echo $arr['idtransaccion']; ?>">
		<p style="line-height:80%;">&nbsp;</p>
		<form id="update<?php echo $key;?>" action="../core/query.php" method="post">
			<input type="hidden" name="nya" value="payment" />
			<input type="hidden" name="act" value="update" />
			<input type="hidden" name="id" value=<?php echo $arr['idtransaccion']; ?> />
			<a title="Concepto" id="name">
				<div class="flechita"></div> 
				<?php echo $arr['concepto']; ?>
			</a>
			<input type="text" name="name" value="<?echo htmlspecialchars($arr['concepto']);?>" class="hide" maxlength="40" id="name"/><br />
			<a title="Monto" id="desc">
				<div class="flechita"></div> 
				$<?php echo $arr['monto']; ?>
			</a>
			<input type="text" name="desc" value="<?echo htmlspecialchars($arr['monto']);?>" class="hide" maxlength="40" id="desc"/><br />
			<a title="Fecha de transaccion" id="date">
				<div class="flechita"></div> 
				<?php echo $arr['fecha']; ?>
			</a>
      <input class="hide" type="datetime-local" name="date" id="date" tabindex="4" />
      <br />
      <script>
       $('#update<?php echo $key;?> input#date').val(new Date("<?echo $arr['fecha'];?>").toJSON().slice(0,19));
      </script>
			<a title="Origen" id="date">
				<div class="flechita"></div> 
				<?php if($arr['idempleado']!=""){ echo "Empleado"; $type = "e"; }
              else if($arr['nocuenta']!="") { echo "Cliente"; $type = "c"; }
              else if($arr['idproveedor']!="") { echo "Proveedor"; $type = "p"; } ?>
			</a><br/>
			<a title="Origen" id="date">
				<div class="flechita"></div> 
				<?php switch($type){
          case 'e':
            echo $arr['ena']." ".$arr['eap']." ".$arr['eam'];
          break;
          case 'c':
            echo $arr['cna']." ".$arr['cap']." ".$arr['cam'];
          break;
          case 'p':
            echo $arr['pna'];
          break;
        }?>
			</a>
      <select class="hide" name="origin" id="origin" required autocomplete="off" tabindex="5">
        <option value disabled>Origen/Destino</option>
        <option value="e" <? if($arr['idempleado']!="") echo "selected"; ?>>Empleado</option>
        <option value="c" <? if($arr['nocuenta']!="") echo "selected"; ?>>Cliente</option>
        <option value="p" <? if($arr['idproveedor']!="") echo "selected"; ?>>Proveedor</option>
      </select> <br />
      <input type="text" class="hide" id="busca" required placeholder="Buscar" tabindex="6" style="width:200px;" />
      <input type="hidden" id="id" required placeholder="Buscar" />
			<input type="submit" class="hide boton" value="Actualizar" id="submit"/> 
			<button type="button" class="hide boton">Cancelar</button>
		</form>
	</div>
	<? } ?><br>
</div>
