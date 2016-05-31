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
    	$('#provider').validate({
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
              //$('#query').load("ui/provider-add.php");
              $('#query').load("ui/provider-view.php","nya=provider&act=view&id="+lastClient);
            }
          });
        }
    	});
    	$('[type=text]').keydown(checkForEnter);
      $('#provider #phone').one("focus",function(){
        if($('#cel').is(":checked"))
          $(this).mask("(999)-99-9999-9999");
        else
          $(this).mask("9999-9999");
      });
      $('#provider #cel').change(function(){
        if($(this).is(":checked"))
          $('#provider #phone').mask("(999)-99-9999-9999");
        else
          $('#provider #phone').mask("9999-9999");
        $('#provider #phone').focus();
      });
    </script>
    <form id="provider" action="../core/query.php" method="post" enctype="multipart/form-data"> 
        <input type="hidden" name="nya" value="provider" />
        <input type="hidden" name="act" value="add" />
    	<div style="float:left; ">
    		<input type="text" name="name" id="name" placeholder="Nombre" required autocomplete="off" tabindex="1" /> <br />
    		<input type="text" name="address" id="address" placeholder="Dirección" required autocomplete="off" tabindex="2"/> <br />
    		<input type="text" name="phone" id="phone" placeholder="Teléfono" required autocomplete="off" tabindex="3"/>
	<input type="checkbox" id="cel" />
	<label for="cel">¿Celular?</label> <br />  <br />
        <input type="submit" name="provider" class="boton" value="Agregar Canal" id="submit" tabindex="11" />
    	</div>
    </form>