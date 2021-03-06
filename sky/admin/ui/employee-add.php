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
    	$('#employee').validate({
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
              //$('#query').load("ui/employee-add.php");
              $('#query').load("ui/employee-view.php","nya=employee&act=view&id="+lastClient);
            }
          });
        }
    	});
    	$('[type=text]').keydown(checkForEnter);
      $('#buscanav').filter(':visible').toggle();
      $('#type').change(function(){
        switch($('#type').val()){
          case 'T':
            $("#admon").hide();
            $("#tech").show();
          break;
          case 'A':
            $("#tech").hide();
            $("#admon").show();
          break;
        }
      });
    </script>
    <form id="employee" action="../core/query.php" method="post" enctype="multipart/form-data"> 
        <input type="hidden" name="nya" value="employee" />
        <input type="hidden" name="act" value="add" />
    	<div style="float:left; ">
    		<input type="text" name="name" id="name" placeholder="Nombre" required autocomplete="off" tabindex="1" /> <br />
    		<input type="text" name="ap" id="ap" placeholder="Apellido Paterno" required autocomplete="off" tabindex="2"/> <br />
    		<input type="text" name="am" id="am" placeholder="Apellido Materno" autocomplete="off" tabindex="3"/> <br />
    		<select name="type" id="type" required tabindex="4" >
    			  <option value="" disabled selected hidden>Tipo</option>
    				<option value='T'>Técnico</option>
            <option value='A'>Administrativo</option>
    		</select> <br />      
        <input type="submit" name="employee" class="boton" value="Agregar Empleado" id="submite" tabindex="11" /> 
    	</div>
      <div style="float:left;" >
        <div id="tech" style="display:none;">
          <input type="text" name="area" id="area" placeholder="Area" tabindex="5" /> <br />
        </div>
        <div id="admon" style="display:none;">
          <input type="text" name="salary" id="salary" placeholder="Salario" tabindex="6" /> <br />
          <input type="text" name="hours" id="hours" placeholder="Horas" tabindex="7" /> <br />
          <input type="password" name="pass" id="pass" placeholder="Password" autocomplete="off" tabindex="8" /> <br />
        </div>
      </div>
      <div style="float:left;">
    		<label for="hiredt">Fecha de contratación</label><br />
        <input type="date" name="hiredt" id="hiredt" tabindex="9" /> <br />
        <label for="img" >Fotografia</label> <br />
    	<input type="file" name="img" id="img" accept="image/*" tabindex="10" onchange="javascript: readURL(this);" /> <br />
      </div>
      <img title="Previsualizacion" style="float:left;" id="preview" class="hide" height=100 /><br/>
    </form>
    <script>
      document.getElementById('hiredt').value = new Date().toISOString().slice(0,10);
    </script>