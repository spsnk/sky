<?php
  include '../../core/query.php';
?>
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
  $('#equipment').validate({
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
      area: {
        required: {
          depends: function(element){
            return $("#type").val()=="T";
          }
        }
      },
      salary: {
        number:true,
        required: {
          depends: function(element){
            return $("#type").val()=="A";
          }
        }
      },
      hours: {
        digits:true,
        required: {
          depends: function(element){
            return $("#type").val()=="A";
          }
        }
      },
      pass: {
        required: {
          depends: function(element){
            return $("#type").val()=="A";
          }
        }
      }
    },submitHandler: function(form) {
      $(form).ajaxSubmit({
        beforeSubmit: function(arr, $form, options) { 
          $('#submits').attr('disabled','disabled');
        },
        target: '#debug',
        success: function(){
          console.log("GREAT SUCESS! \n id="+lastClient);
          //$('#query').load("ui/equipment-add.php");
          $('#query').load("ui/equipment-view.php","nya=equipment&act=view&id="+lastClient);
        }
      });
    }
  });
  $('[type=text]').keydown(checkForEnter);
  $('[type=checkbox]').change(function(){
		$('[for='+$(this).attr("id")+']').toggleClass('active');
	});
</script>
<form id="equipment" action="../core/query.php" method="post" enctype="multipart/form-data"> 
    <input type="hidden" name="nya" value="equipment" />
    <input type="hidden" name="act" value="add" />
  <div style="float:left; ">
    <input type="text" name="name" id="name" placeholder="Nombre" required autocomplete="off" tabindex="1" /> <br />
    <input type="text" name="card" id="card" placeholder="Numero de tarjeta" required number autocomplete="off" tabindex="2"/> <br />   
    <input type="submit" name="equipment" class="boton" value="Agregar Servicio" id="submite" tabindex="11" /> 
  </div>
	<div class="multiple_select" style="height:400px;">
		<p>Proveedores</p>
		<? foreach($provider as $key => $arr){?>
			<input type="checkbox" value="<?echo $arr['idproveedor'];?>" name="channels[]" id="chn<?echo $key;?>" class="hide"/>
			<label for="chn<?echo $key;?>"><?echo $arr['nombre'];?></label>
		<?}?>
	</div>
</form>