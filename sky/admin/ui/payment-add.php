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
    	$('#payment').validate({
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
              //$('#query').load("ui/payment-add.php");
              $('#query').load("ui/payment-view.php","nya=payment&act=view&id="+lastClient);
            }
          });
        }
    	});
    	$('[type=text]').keydown(checkForEnter);
    </script>
    <form id="payment" action="../core/query.php" method="post" enctype="multipart/form-data"> 
        <input type="hidden" name="nya" value="payment" />
        <input type="hidden" name="act" value="add" />
    	<div style="float:left; ">
    		<input type="text" name="name" id="name" placeholder="Nombre" required autocomplete="off" tabindex="1" /> <br />
    		<input type="text" name="desc" id="desc" placeholder="Descripcion" required autocomplete="off" tabindex="2"/> <br />  <br />
        <input type="submit" name="payment" class="boton" value="Agregar Pago" id="submit" tabindex="11" /> 
    	</div>
      <div style="float:left;">
        <label for="img" >Logotipo</label> <br />
        <input type="file" name="img" id="img" accept="image/*" tabindex="10" onchange="javascript: readURL(this);" /> <br />
      </div>
      <img title="Previsualizacion" style="float:left;" id="preview" class="hide" height=100 /><br/>
    </form>