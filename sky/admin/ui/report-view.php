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
	});
    </script>
<div id="payment-view-nav">
	<input type="text" style="width:200px;" value="<?php if(isset($_GET['loli'])) echo $_GET['loli']; else echo "";?>" id="buscador" placeholder="Buscar" />
	<input type="hidden" id="result" disabled="disabled"/>
</div>

<div id="results">
  <?foreach ($result as $key => $a){?>
  <div class="display" style="width:200px;">
    <a title="Fecha de transaccion" id="date">
      <div class="flechita"></div> 
      <?php echo $a['fecha']; ?>
    </a>
    <br />
    <a title="Concepto" id="name">
      <div class="flechita"></div> 
      <?php echo $a['concepto']; ?>
    </a><br />
    <a title="Origen" id="date">
      <div class="flechita"></div> 
      <?php if($a['idempleado']!=""){ echo "Empleado"; $type = "e"; }
            else if($a['nocuenta']!="") { echo "Cliente"; $type = "c"; }
            else if($a['idproveedor']!="") { echo "Proveedor"; $type = "p"; } ?>
    </a><br/>
    <a title="Monto" id="desc">
      <div class="flechita"></div> 
      $<?php echo $a['monto']; ?>
    </a>
    <input type="text" name="desc" value="<?echo htmlspecialchars($a['monto']);?>" class="hide" maxlength="40" id="desc"/><br />
    <a title="Origen" id="date">
      <div class="flechita"></div> 
      <?php switch($type){
        case 'e':
          echo $a['ena']." ".$a['eap']." ".$a['eam'];
        break;
        case 'c':
          echo $a['cna']." ".$a['cap']." ".$a['cam'];
        break;
        case 'p':
          echo $a['pna'];
        break;
      }?>
    </a>
    <?if($tipo == 's'){ ?>
      <br>
      <a title="Destino" id="date">
      <div class="flechita"></div> 
      Cliente: <?php echo $a['cna']." ".$a['cap']." ".$a['cam'];?>
    </a>
    <?}?>
    </div>
  <? } ?>
</div>
