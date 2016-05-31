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
      $('#buscador').autocomplete({
        source: "../core/query.php?nya=employee&act=search",
        minLength: 2,
        focus: function( event, ui ) {
          $( "#buscador" ).val( ui.item.label );
          $( "#id" ).val( ui.item.value );
          return false;
        },
        select: function( event, ui ) {
          $( "#buscador" ).val( ui.item.label );
          $( "#id" ).val( ui.item.value );
          return false;
        }
      });
      $('#origin').change(function(){
        $( "#buscador" ).removeAttr("disabled");
        switch(this.value){
          case 'e':
            $( "#buscador" ).autocomplete('option', 'source', "../core/query.php?nya=employee&act=search");
            $( "#buscador" ).attr("placeholder","Buscar empleado");
          break;
          case 'c':
            $( "#buscador" ).autocomplete('option', 'source', "../core/query.php?nya=client&act=search");
            $( "#buscador" ).attr("placeholder","Buscar cliente");
          break;
          case 'p':
            $( "#buscador" ).autocomplete('option', 'source', "../core/query.php?nya=provider&act=search");
            $( "#buscador" ).attr("placeholder","Buscar proveedor");
          break;
        }
      });
    </script>
    <form id="payment" action="../core/query.php" method="post" enctype="multipart/form-data"> 
        <input type="hidden" name="nya" value="payment" />
        <input type="hidden" name="act" value="add" />
    	<div style="float:left; ">
    		<select name="concept1" id="concept1" required autocomplete="off" tabindex="1">
          <option value disabled selected >Concepto</option>
          <option value="pago">Pago</option>
          <option value="cobro">Cobro</option>
        </select> <br />
    		<input type="text" name="concept2" id="concept2" placeholder="Descripción concepto" required autocomplete="off" tabindex="2" /> <br />
    		<input type="text" name="cost" id="cost" placeholder="Monto" required autocomplete="off" tabindex="3"/> <br />  <br />
        <input type="submit" name="payment" class="boton" value="Agregar Pago" id="submit" tabindex="11" /> 
    	</div>
      <div style="float:left;">
        <input type="datetime-local" name="date" id="date" tabindex="4" /> <br />
      <select name="origin" id="origin" required autocomplete="off" tabindex="5">
        <option value disabled selected >Origen/Destino</option>
        <option value="e">Empleado</option>
        <option value="c">Cliente</option>
        <option value="p">Proveedor</option>
      </select> <br />
      <input type="text" id="buscador" disabled required placeholder="Buscar" tabindex="6" style="width:200px;" />
      <input type="hidden" name="id" id="id" required placeholder="Buscar" />
      </div>
    </form>
    
    <script>
      document.getElementById('date').value = new Date().toJSON().slice(0,19);
    </script>