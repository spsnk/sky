<?php
// if(isset($_GET['nya'])) 
	// $nya = $_GET['nya'];
// else
$nya='order';
if(isset($_GET['act'])) 
	$act=$_GET['act'];
else
	$act='new';
if(isset($_GET['id'])) 
	$id=$_GET['id'];
//echo "$nya $act<br><br>";
?>
<script type="text/javascript">
//rawr();
var currItem;
//var total=(0.00).toFixed(2);
$('#itemSearch').autocomplete({
	source: "../core/query.php?nya=stock&act=search",
	minLength: 2,
	focus: function( event, ui ) {
		$( "#itemSearch" ).val( ui.item.label );
		//$( "#result" ).val( ui.item.value );
		return false;
	},
	select: function( event, ui ) {
		$( "#itemSearch" ).val( ui.item.label );
		$( "#itemAdd" ).val( ui.item.value );
		currItem=ui.item;
		$('#additem').click();
		$(this).val("");
		return false;
	},
	change: function( event, ui ){
		if($("#itemAdd").val()==""){
			$(this).css('color','#aaa');
			$(this).val("Buscar Artículo");
		}
		return false;
	},
	search: function(event, ui) {}
}).data( "autocomplete" )._renderItem = function( ul, item ) {
	return $( "<li></li>" )
		.data( "item.autocomplete", item )
		.append( "<a><b>" + item.label + "</b> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Talla " 
		+ item.size +" &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $" +item.price
		+ "<br>"+item.schools+"</a>" )
		.appendTo( ul );
};
$('#clientSearch').autocomplete({
	source: "../core/query.php?nya=client&act=search",
	minLength: 2,
	focus: function( event, ui ) {
		$( "#clientSearch" ).val( ui.item.label );
		return false;
	},
	select: function( event, ui ) {
		$( "#clientSearch" ).val( ui.item.label );
		$( "#clientID" ).val( ui.item.value );
		$('#clientSearch').valid();
		return false;
	}
});
$('#itemSearch').focus(function(){
	if($("#itemAdd").val()==""||$("#itemSearch").val()=="Buscar Artículo"){
		$(this).css('color','#2d2d2d');
		$(this).val("");
	}
});
// .blur(function(){
	// if($("#itemAdd").val()==""){
		// $(this).css('color','#aaa');
		// $(this).val("Buscar Artículo");
	// }
// });
$('#clientSearch').focus(function(){
	if($("#clientSearch").val()==""||$("#clientSearch").val()=="Buscar Cliente"){
		$(this).css('color','#2d2d2d');
		$(this).val("");
	}
}).blur(function(){
	if(!$("#clientID").val()){
		$(this).css('color','#aaa');
		$(this).val("Buscar Cliente");
	}
});
$('#additem').click(function(){
	if($('#itemAdd').val()){
		var rawr = $('<div></div>')
		//.attr('class','angie')
		.attr('class','orderItem')
		.html(  '<table class="angie"><td>'
				+currItem.label+'</td><td> Talla '
				+currItem.size+'</td><td class="right">$'+currItem.price
				+'<input type="hidden" name="items[]" value="'
				+currItem.value+'" readonly="readonly"/></td></table>');
		var mhm = currItem.price;
		rawr.appendTo('#items').toggle(500,function(){$('#itemSearch').valid();}).click(function(){
			$(this).toggle(500,function(){
				$(this).remove();
			});
			updateTotal("remove",mhm);
		}).hover(function(){
			//$(this).effect( "pulsate");
			//$('#total').text((parseFloat($('#total').text())+1).toFixed(2));
		});
		updateTotal("add",mhm,function(){currItem=null;});
	}
	$('#itemAdd').val('');
});
$('#addExtra').click(function(){
	var desc = $('#extra_desc').val();
	var price = $('#extra').val();
	var rawr = $('<div></div>')
	.attr('class','orderItem')
	.html(  "<table class='angie'><td>"
			+desc+"</td><td class='right'>$"
			+parseFloat(price).toFixed(2)+"</td></table> <input type='hidden' name='extra_desc[]' value='"
			+escape(desc)+"' readonly='readonly'/> <input type='hidden' name='extra[]' value='"
			+price+"' readonly='readonly'/>");
	rawr.appendTo('#items').toggle(500).click(function(){
		$(this).toggle(500,function(){
			$(this).remove();
		});
		updateTotal("remove",price);
	}).hover(function(){
		//$('#total').text((parseFloat($('#total').text())+1).toFixed(2));
	});
	updateTotal("add",price);
	$('#extra_desc').val('');
	$('#extra_desc').css('color','#ccc');
	$('#extra').css('color','#ccc');
	$('#extra').val('0.00');
	$('#addExtra').attr("disabled","disabled");
});
$('#extra').keyup(function(){
	var esta = $(this);
	if(!isNaN(parseFloat(esta.val())) && parseFloat(esta.val()) && $('#extra_desc').val()) {
		$('#addExtra').removeAttr("disabled");
	} else {
		$('#addExtra').attr("disabled","disabled");
	}
}).keydown(function(){
	if (event.keyCode == 13) {
		if(!$('#addExtra:disabled').length)
			$('#addExtra').click();
		return false;
	}
});
function updateToPay(){
	$("#topay").fadeOut("fast",function(){
		acuenta = ( parseFloat($("#total").text()) - ( parseFloat($("#paid").val())+parseFloat($("#coupon").val() ) ) ).toFixed(2);
		$(this).text(acuenta).fadeIn("fast");
	});
}
function updateTotal(type,price,callback){
	if(type=="remove")
		total = (parseFloat($('#total').text())-parseFloat(price)).toFixed(2);
	else if(type=="add")
		total = (parseFloat($('#total').text())+parseFloat(price)).toFixed(2);
	else
		total = "0.00";
	$('#total').fadeOut("fast",function(){
		$(this).text(total).fadeIn("fast");
	});
	updateToPay();
	if(callback)
		callback();
}
$('#reset').click(function(){
	$('#clientID,#itemAdd').val('');
	$(".search").css('color','#aaa');
	$('#items').toggle(500,function(){
		$(this).html('').show();
	});
	updateTotal("clear");
	resetdesu.resetForm();
});
$('.numberos').keyup(function(){
	if(this.value=="")
		this.value="0.00";
}).click(function(){
	$(this).select();
}).focus(function(){
	$(this).css('color','#2d2d2d');
}).blur(function(){
	if(parseFloat(this.value)==0){
		$(this).css('color','#aaa');
		this.value="0.00";
	}
});
$('#paid,#coupon').keyup(updateToPay);
$('textarea').focus(function(){
	$(this).css('color','#2d2d2d');
}).blur(function(){
	if(!$(this).val())
		$(this).css('color','#ccc');
});
jQuery.validator.addMethod("completed", function(value, element,param) { 
	if( param == "client" && $('#clientID').val() )
		return true;
	else if( param == "item" && parseFloat($('#total').text()) )
		return true;
	else
		return false;
}, "Rawr");
var resetdesu = $('#newOrder').validate({
	rules: {
		clientSearch: {
			completed: "client"
		},
		itemSearch: {
			completed: "item"
		}
	},
	messages: {
		clientSearch: "Por favor elija un cliente o cree uno nuevo.",
		itemSearch: "Por favor agregue al menos un artículo al pedido.",
	},
	submitHandler: function(form) { 
		$(form).ajaxSubmit({
			beforeSubmit: function() { 
			},
			target: '#debug',
			success: function() { 
				return false;
			}
		});
	},
	onfocusout: false
});
$('#addclient').click(function(){
	$('#overlay').show().animate({
		opacity: 0.5,
	},200,function(){
		$(this).click(function(){ 
			$(this).unbind('click'); 
			hideoverlay2();
		});
		$(document).keyup(function(e) {
			$(this).unbind('keyup'); 
			if (e.keyCode == 27) { //on ESC
				$(document).unbind('keyup');
				hideoverlay2();
			}
		});
	});
	$('#newClientOrder').load("ui/client-add.php",function(){
		var lolioffset= $('#addclient').offset();
		$(this).css({ 
			top: $(window).height()-20,
		}).show().animate({
			left: lolioffset.left-4,
			top: lolioffset.top-4,
			width: 260,
			height: 100,
			opacity: 1,
		});
	});
});
function hideoverlay2(){			
	$('#newClientOrder').animate({
		left: 0,
		top: $(window).height()-20,
		width: 0,
		height: 0,
		opacity: 0,
	},200,function(){
		$(this).hide();
		$('#overlay').hide().css({opacity:0,});
		//$('#overlay').animate({opacity:0,},200,function(){$(this).hide();});
	});
}
</script>
<h1>Pedido</h1>
<br>
<div id="orderNew">
	<form name="order" id="newOrder" action="../core/query.php" method="post">
		<input type="hidden" name="nya" value="order"/>
		<input type="hidden" name="act" value="add"/>
		<input type="text" value="Buscar Cliente" id="clientSearch" name="clientSearch" class="search"/> 
		<input type="hidden" name="clientID" id="clientID"/>
		<button type="button" class="boton" id="addclient">Nuevo Cliente</button> 
		<br>
		<input type="text" value="Buscar Artículo" id="itemSearch" name="itemSearch" class="search"/>
		<input type="hidden" id="itemAdd"/>
		<button type="button" class="boton" id="additem" style="display:none;">Agregar a Pedido</button> 
		<div id="items"></div>
		<div id="separator"></div>
		<label for="paid">Efectivo</label>
		<input id="paid" name="paid" type="text" style="width:40px;text-align:right;" value="0.00" onKeyPress="return numbersonly(event, true)" class="numberos"/>
		<label for="coupon">Vales</label>
		<input id="coupon" name="coupon" type="text" style="width:40px;text-align:right;" value="0.00" onKeyPress="return numbersonly(event, true)" class="numberos"/>
		<input type="checkbox" name="delivered" id="delivered"/> <label for="delivered">Entregado</label>
		<br>
		<p class="totals">Total: $<span id="total">0.00</span>&nbsp;&nbsp; A cuenta: $<span id="topay">0.00</span></p>
		<button type="button" class="boton" onclick="$('#extraDiv').toggle(500);">Cargos Extra</button>
		<button type="button" class="boton" onclick="$('#note').toggle(500);">Notas</button>
		<div id="extraDiv" style="display:none;">
			<textarea id="extra_desc" cols="25" rows="3" style="float:left;" placeholder="Descripción del cargo extra, bordados etc."></textarea>
			<input id="extra" type="text" style="width:50px;text-align:right;" onKeyPress="return numbersonly(event, true)" value="0.00" class="numberos"/>
			<br>
			<button id="addExtra" type="button" class="boton" disabled="disabled">Agregar</button>
		</div>
		<div id="note" style="display:none; clear:both;">
			<textarea name="notes" cols="25" rows="3" placeholder="Notas adicionales."></textarea>
		</div>
		<div style="clear:both;">
			<button type="submit" class="boton" > Procesar Orden</button>
			<button id="reset" type="reset" class="boton" style="float:right;"> Cancelar Orden</button>
		</div>
	</form>
</div>
<div id="newClientOrder"></div>
<div id="ticket"></div>
<div id="query"></div>