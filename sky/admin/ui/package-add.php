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
  $('#package').validate({
    debug: true,
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
          //console.log("GREAT SUCESS! \n id="+lastid);
          $('#query').load("ui/package-add.php","nya=package");
          //$('#query').load("ui/package-view.php","nya=package&act=view&id="+lastid);
        }
      });
    }
  });
  $('[type=text]').keydown(checkForEnter);
  $('[type=checkbox]').change(function(){
		$('[for='+$(this).attr("id")+']').toggleClass('active');
	});
</script>
<form id="package" action="../core/query.php" method="post" enctype="multipart/form-data"> 
    <input type="hidden" name="nya" value="package" />
    <input type="hidden" name="act" value="add" />
	<div style="float:left;">
		<input type="text" name="name" id="name" placeholder="Nombre" class="required" /> <br />
		<input type="text" name="cost" id="cost" placeholder="Costo mensual" class="required number" /> <br />
		<input type="text" name="desc" placeholder="Descripción" class="required" /> <br />
    <br />
    <br />
    <input type="submit" name="package" class="boton" value="Agregar Paquete" id="submit" /> 
	</div>
	<div class="multiple_select" style="height:400px;">
		<p>Canales</p>
		<? foreach($channels as $key => $arr){?>
			<input type="checkbox" value="<?echo $arr['idcanal'];?>" name="chans[]" id="chn<?echo $key;?>" class="hide"/>
			<label for="chn<?echo $key;?>"><?echo $arr['nombre'];?></label>
		<?}?>
	</div>
</form>