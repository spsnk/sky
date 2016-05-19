
//var preload = $('<img />').attr('src','img/ajaxloading.gif');
var ajax_load ="<img height=16 width=16 src='img/ajaxloading.gif' /> Cargando...";
//var ajax_ready = "Listo.";
function toggleFx() {
  $.fx.off = !$.fx.off;
  alert('Animations '+($.fx.off ? 'OFF.':'ON.'));
}
function numbersonly(e, decimal) {
	var key;
	var keychar;

	if (window.event) {
	   key = window.event.keyCode;
	}
	else if (e) {
	   key = e.which;
	}
	else {
	   return true;
	}
	keychar = String.fromCharCode(key);

	if ((key==null) || (key==0) || (key==8) ||  (key==9) || (key==13) || (key==27) ) {
	   return true;
	}
	else if ((("0123456789").indexOf(keychar) > -1)) {
	   return true;
	}
	else if (decimal && (keychar == ".")) { 
	  return true;
	}
	else if (keychar == "-") { 
	  return true;
	}
	else
	   return false;
}

function rezisenya(){
	var h = $(window).height();
	if (h>300){
		$("#nav").css('min-height',h-20);
		$("#toggle").css('min-height',h-20);
		$("#content").css('min-height',h-20);
	}
	$('#spacing').height(h-250);
}

function rawr(){
	$(".ajax,.query").each( function(i,e){ 
		var href=$(this).attr("href");
		var get=$(this).attr("id");
		var wut=$(this).attr("class");
		//alert(href+":"+get+":"+wut);
		$(this).removeAttr("href").click( function(){ 
			//$("#status").html(ajax_load);
			//if(wut=="ajax") {$('#'+wut).css("display","none");}
			$("#"+wut).load(href,get,function(response, status, xhr){
				//bindAjax($(this));
				if (status == "error")
					$("#status").html(href+" "+xhr.statusText+" "+xhr.status);
				//else
					//$("#status")//.html(ajax_ready)
					//.fadeOut(500,function(){$(this).html("").show();});
				if(wut=="ajax") {$(this).fadeIn(500);}
			});
		}).removeAttr("id").removeAttr("class");
	});
}

function bindAjax(coxa){
	coxa.ajaxStart(function(){ 
		$('#status').html(ajax_load);
		$('#status').fadeIn();
	}).ajaxStop(function(){ 
		$('#status').delay(500).fadeOut(500);//,function(){
			//$(this).html("").show();
		//}); 
	});
}

function lolisearch(result,text,act) {
	if(!isNaN(result.val())) {
		var href="ui/"+act+"-view.php";
		var get="nya="+act+"&act=view&id="+result.val()+"&loli="+text.val();
		//$("#status").html(ajax_load);
		$("#query").load(href,get,function(response, status, xhr){
			if (status == "error")
				$("#status").html(href+" "+xhr.statusText+" "+xhr.status);
			// else
				// $("#status")//.html(ajax_ready)
				// .fadeOut(500,function(){$(this).html("").show();});
		});
	}
}

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

function clientAdd(){
	//$("#query").load("../core/query.php","nya=client&act=view");
	 var resetme = $('#client').validate({
		rules: {
			name: {
				notEqual: "Nombre"
			}
		},
		messages: {
			name: {
				notEqual: "Por favor escriba un nombre.",
				required: "Por favor escriba un nombre.",
				minlength: "Debe escribir al menos 3 letras."
			},
			phone: {
				minlength: "Debe escribir al menos 8 digitos."
			}
		},
		submitHandler: function(form) {
			$(form).ajaxSubmit({
				beforeSubmit: function(arr, $form, options) { 
					//$("#status").html(ajax_load);
					$('#client #submit').attr('disabled','disabled');
					if($("#client #addr").val()=='Dirección')
						$("#client #addr").val('');
					if($("#client #phone").val()=='Teléfono')
						$("#client #phone").val('');
				},
				target: '#debug',
				success: function(response,status,xhr) { 
					//$("#status").fadeOut(500,function(){$(this).html("").show();});
					//$('#query').load("ui/client-add.php");
					resetme.resetForm();
					$('#client #submit').removeAttr('disabled');
					$('#client [type=text]').css('color','#aaa');
				}
			});
		}
	});
	$('#client [type=text]').one("focus",function(){
		$(this).css('color','#2d2d2d');
		$(this).val("");
	}).keydown(checkForEnter);
	$('#client #phone').one("focus",function(){
		if($('#cel').is(":checked"))
			$(this).mask("(999)-99-9999-9999");
		else
			$(this).mask("9999-9999");
	});
	$('#client #cel').change(function(){
		if($(this).is(":checked"))
			$('#client #phone').mask("(999)-99-9999-9999");
		else
			$('#client #phone').mask("9999-9999");
		$('#client #phone').focus();
	});
}

function clientView() {
	$('#buscador').autocomplete({
		source: "../core/query.php?nya=client&act=search",
		minLength: 2,
		focus: function( event, ui ) {
			$( "#buscador" ).val( ui.item.label );
			$( "#result" ).val( ui.item.value );
			return false;
		},
		select: function( event, ui ) {
			$( "#buscador" ).val( ui.item.label );
			$( "#result" ).val( ui.item.value );
			lolisearch($('#result'),$(this),"client");
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
	$('div.client-display form').each(function(){
		//alert($(this).attr('id'));
		$(this).validate({
			submitHandler: function(form) {
				$(form).ajaxSubmit({
					beforeSubmit: function(arr, $form, options) { 
						$('#submit').attr('disabled','disabled');
						if($('#addr').val()=='Dirección')
							$('#addr').val('');
						if($('#phone').val()=='Teléfono')
							$('#phone').val('');
					},
					target: '#debug',
					success:    function() { 
						$('#query').load("ui/client-view.php","nya=client&act=view&id="+$(form).parent().attr("id"));
					}
				});
			}
		});
	});
	$('input#name').each(function(){
		$(this).rules('add',{
			required: true,
			notEqual: "Nombre",
			minlength: 3,
			messages: {
				notEqual: "Por favor escriba un nombre.",
				required: "Por favor escriba un nombre.",
				minlength: "Debe escribir al menos 3 letras."
			}
		});
	});
	$('input#phone').each(function(){
		$(this).one("focus",function(){
			if($(this).val().length > 9) {
				$(this).mask("(999)-99-9999-9999");
				$('div#'+$(this).parent().parent().attr('id')+' input[type="checkbox"]').prop("checked",true);
			} else
				$(this).mask("9999-9999");
		});
		$(this).rules('add',{
			minlength: 9,
			messages: {
				minlength: "Debe escribir al menos 8 digitos."
			}
		});
	});
	$('.cel').each(function(){
		$(this).change(function(){
			if($(this).is(":checked"))
				$('div#'+$(this).parent().parent().attr('id')+' input[name="phone"]').mask("(999)-99-9999-9999");
			else
				$('div#'+$(this).parent().parent().attr('id')+' input[name="phone"]').mask("9999-9999");
			$('div#'+$(this).parent().parent().attr('id')+' input[name="phone"]').focus();
		});
	});
	$('[type=text]').one("focus",function(){
		$(this).css('color','#2d2d2d');
	});
}

function stockAdd(){
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
	//$("#query").load("../core/query.php","nya=client&act=view");
	$('#stock').validate({
		rules: {
			typeID: {
				notEqual: "-1"
			},
			size: {
				notEqual: "-1"
			},
			price: {
				notEqual: "Precio",
				min: 1
			},
			units: {
				notEqual: "Existencia"
			},
			img: {
				accept: "jpg|jpeg|gif|png"
			}
		},
		messages: {
			typeID: {
				notEqual: "Seleccione un tipo de ropa.",
			},
			size: {
				notEqual: "Seleccione una talla."
			},
			price: {
				required: "Escriba un precio.",
				notEqual: "Escriba un precio.",
				number: "Escriba un precio <i><b>unicamente</b></i> en numeros y punto decimal.",
				min: "El precio debe ser mayor a $1.00."
			},
			units: {
				required: "Escriba el numero de existencias para inventario.",
				notEqual: "Escriba el numero de existencias para inventario.",
				number: "Escriba el numero de existencias para inventario."
			},
			img: {
				accept: "Por favor seleccione una imagen de tipo jpg,jpeg,gif,png."
			}
		},
		submitHandler: function(form) {
			$(form).ajaxSubmit({
				beforeSubmit: function(arr, $form, options) { 
					$('#submits').attr('disabled','disabled');
					if($("#desc").val()=='Descripción')
						$("#desc").val('');
				},
				target: '#debug',
				success: function(){
					$('#query').load("ui/stock-add.php","nya=stock&");
				}
			});
		}
	});
	$('[type=text]').one("focus",function(){
		$(this).css('color','#2d2d2d');
		$(this).val("");
	});
	$('select').one("focus",function(){
		$(this).css('color','#2d2d2d');
		$('[name="'+$(this).attr('name')+'"] > option[value="-1"]').remove();
	});
	$('[type=text]').keydown(checkForEnter);
	$('[type=checkbox]').change(function(){
		$('[for='+$(this).attr("id")+']').toggleClass('active');
	});
	$('#buscanav').filter(':visible').toggle();
}

function stockView() {
	$('div.display .editar, div.display .cancelar').click(function(){
		var parentdiv = 'div#'+$(this).parent().parent().attr('id');
		$(parentdiv+' input[type=text],'+
		parentdiv+' select,'+
		parentdiv+' input[type=submit],'+
		parentdiv+' a,'+
		parentdiv+' .editar,'+
		parentdiv+' .cancelar,'+
		parentdiv+' .add,'+
		parentdiv+' input[type=file]').toggleClass('hide');
	});
	$('div.display form').each(function(){
		$(this).validate({
			rules: {
				typeID: {
					notEqual: "-1"
				},
				size: {
					notEqual: "-1"
				},
				price: {
					notEqual: "Precio",
					min: 1
				},
				units: {
					notEqual: "Existencia"
				},
				img: {
					accept: "jpg|jpeg|gif|png"
				}
			},
			messages: {
				typeID: {
					notEqual: "Seleccione un tipo de ropa.",
				},
				size: {
					notEqual: "Seleccione una talla."
				},
				price: {
					required: "Escriba un precio.",
					notEqual: "Escriba un precio.",
					number: "Escriba un precio <i><b>unicamente</b></i> en numeros y punto decimal.",
					min: "El precio debe ser mayor a $1.00."
				},
				units: {
					required: "Escriba el numero de existencias para inventario.",
					notEqual: "Escriba el numero de existencias para inventario.",
					number: "Escriba el numero de existencias para inventario."
				},
				img: {
					accept: "Por favor seleccione una imagen de tipo jpg,jpeg,gif,png."
				}
			},
			submitHandler: function(form) {
				$(form).ajaxSubmit({
					beforeSubmit: function(arr, $form, options) { 
						//$("#status").html(ajax_load);
						$('#submits').attr('disabled','disabled');
						if($("#desc").val()=='Descripción')
							$("#desc").val('');
					},
					target: '#debug',
					success: function(response,status,xhr) { 
						updateInfo();
						// $("#status").fadeOut(500,function(){$(this).html("").show();});
						$('#query').load("ui/stock-view.php","nya=stock&act=view&id="+$(form).parent().attr("id"));
					}
				});
			}
		});
	});
	$('select,input[type=text]').one("focus",function(){
		$(this).css('color','#2d2d2d');
	});
	$('[type=checkbox]').each(function(){
		$(this).change(function(){
			var parentdiv2 = 'div#'+$(this).parent().parent().parent().attr('id');
			$(parentdiv2+' [for='+$(this).attr("id")+']').toggleClass('active');
		});
	});
	$('input[type=file]').change(function(){
		$('div#'+$(this).parent().parent().attr('id')+' input[name=filename]').val("EMPTY");
	});
	$('.add').each(function(){
		$(this).click(function(){
			var nyarr = 'div#'+$(this).parent().parent().attr('id');
			var lolioffset = $(nyarr).offset();
			if( (lolioffset.left + $(nyarr+' form img[id=filename]').width()+140) >= $(window).width()-50)
				lolioffset.left -= ( (lolioffset.left + $(nyarr+' form img[id=filename]').width()+140) - ($(window).width()-50) );
			$('#miau img#photo').attr('src',$(nyarr+' form img[id=filename]').attr('src'));
			$('#miau a').text($(nyarr+' form a[id=name]').text()//+$(nyarr+' form a[id=desc]').text()
			+' T'+$(nyarr+' form select[name=size]').val());
			$('#miau input[name=id]').val($(nyarr+' form input[name=id]').val());
			$('#miau input[name=units]').val($(nyarr+' form input[name=units]').val());
			$('#overlay').show().animate({
				opacity: 0.5,
			},200);
			$('#miau').css({ 
				top: $(window).height()-20,
			}).show().animate({
				left: lolioffset.left-4,
				top: lolioffset.top-4,
				width: $(nyarr+' form img[id=filename]').width()+145,
				height: 100,
				opacity: 1,
			},700,function(){
				$('#miau form').animate({opacity: 1},400);
				$('#overlay').click(function(){ 
					$('#overlay').unbind('click'); 
					hideoverlay(); 
				});
				$(document).keyup(function(e) {
					$(this).unbind('keyup'); 
					if (e.keyCode == 27) { //on ESC
						$(document).unbind('keyup');
						hideoverlay();
					}
				});
			});
		});
	});
	function hideoverlay(){
		$('#miau').animate({
			left: 0,
			top: $(window).height()-20,
			width: 0,
			height: 0,
			opacity: 0,
		},200,function(){
			$(this).hide();
			$('#miau form').css({opacity: 0});
			$('#overlay').hide().css({opacity:0,});
			$('#miau span').hide();
			pekevalidacion.resetForm();
			$('#submit').removeAttr('disabled');
			//$('#overlay').animate({opacity:0,},200,function(){$(this).hide();});
		});
	}
	var pekevalidacion = $('#pekenia').validate({
		rules: {
			suma: {
				notEqual: "0"
			},
		},
		messages: {
			suma: "Por favor introduzca un número mayor o menor a 0.",
		},
		submitHandler: function(form) {
			$(form).ajaxSubmit({
				beforeSubmit: function() { 
					$('#submit').attr('disabled','disabled');
					//$("#status").html(ajax_load);
					if($("#desc").val()=='Descripción')
						$("#desc").val('');
				},
				target: '#miau span',
				success: function() { 
					$('#miau span').fadeIn();
					updateInfo();
					//$('#miau a,#miau p,#miau button,#miau input').animate({opacity: 0},400);
					//$("#status").fadeOut(500,function(){$(this).html("").show();});
					// setTimeout(function() {
						// hideoverlay();
					// },3000);
				}
			});
		}
	});
	$('#miau .cancelar').click(function(){
		hideoverlay();
	});
	$('.minus').click(function(e){
		if (e.shiftKey)
		$('#miau input[type=text]').val(parseInt($('#miau input[type=text]').val())-5);
		else
		$('#miau input[type=text]').val(parseInt($('#miau input[type=text]').val())-1);
	});
	$('.plus').click(function(e){
		if (e.shiftKey)
		$('#miau input[type=text]').val(parseInt($('#miau input[type=text]').val())+5);
		else
		$('#miau input[type=text]').val(parseInt($('#miau input[type=text]').val())+1);
	});
	$('#buscador').autocomplete({
		source: "../core/query.php?nya=stock&act=search",
		minLength: 2,
		focus: function( event, ui ) {
			$( "#buscador" ).val( ui.item.label );
			$( "#result" ).val( ui.item.value );
			return false;
		},
		select: function( event, ui ) {
			$( "#buscador" ).val( ui.item.label );
			$( "#result" ).val( ui.item.value );
			lolisearch($('#result'),$(this),"stock");
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
	$('#buscador').focus(function(){
		$(this).css('color','#2d2d2d');
		$(this).val("");
	}).blur(function(){
		$(this).css('color','#aaa');
		$(this).val("Buscar");
	});
	$('#buscanav').filter(':not(:visible)').toggle();
}
function updateInfo(){
	$.ajax({
		url: "../core/query.php",
		data: "nya=stock&act=info",
		success: function(data,textStatus,jqXHR){
			//alert(data);
			//var buu = JSON.parse(data);
			var textito="";
			var total=0;
			//$('.infoboton,.infopopup').removeAttr('style');
			$('#infoboton').unbind('click');
			$('#infoboton:visible').animate({opacity:0},400);
			$('#infopopup:visible').toggle("fast");
			for(var i in data){
				if(!total){
					textito='<div class="updaterefresh"title="Actualizar"></div>';
					$('#infoboton').click(function(){
						// var autoh = $('#infopopup').css('height');
						// $('#infopopup').css('height',0).show().animate({
							// width: 150,
							// height: autoh,
							// opacity: 1,
						// },700);
						//var lolioffset = $(this).offset();
						var loliwidth = $(this).width();
						//var loliright = $(this).css('right');
						//var lolileft = $(this).css('left');
						$('#infopopup').css(
							//right:(lolioffset.left-$(window).height())-22
							"min-width", loliwidth
						).css("max-height",$(window).height()-31).toggle("slow");
					}).animate({opacity:1},400,function(){
						$(this).animate({opacity:0},400,function(){
							$(this).animate({opacity:1},400,function(){
								$(this).animate({opacity:0},400,function(){
									$(this).animate({opacity:1})
								});
							})
						});
					});
				}
				total++;
				textito += '<div class="item_container" onclick=\'$("#ajax").load("ui/stock.php","nya=stock&act=view&id='
						+data[i].ID+'")\'><div class="infoimg"><img height=50 src="/seifuku/img/thumb/t_'
						+data[i].img+'"/></div><span>'
						+data[i].name+'<br>Talla '
						+data[i].size+'<br>Quedan '
						+data[i].units+'</span></div>'
			}
			if(total)
				$('#infoboton').text(total+" Artículo(s) estan por terminarse!");
			//$('#info').html("");
			$('#infopopup').html(textito);
			$('.updaterefresh').click(function(){updateInfo();});
		},
		dataType: "json"
	});
}

function info(seconds){
	//bindAjax($('#info'));
	updateInfo();
	//$('#infopopup').draggable();
	setInterval(updateInfo,seconds*1000);
}

$(window).resize(function(){
	//rezisenya();
});

$(document).ready(function(){
	//rezisenya();
	rawr();
	//setTimeout(function(){info(60*5);},2000);
	bindAjax($(document));
	//$("#rightcolumn").load("core/core.php","nya=home");
	$('#toggle').click(function(){
		$('#nav').animate({width: 'toggle'},500, function(){
			$('#toggle-icon').toggleClass('nav-hidden');
		});
		if( $('#content').css('margin-left')!='0px')
			$('#content').animate({'margin-left': '0px'},500);
		else
			$('#content').animate({'margin-left': '150px'},500);
	});
	$('#menu a').click(function(){
		if(!$(this).hasClass('active')){
			$('.active').removeClass('active');
			$(this).addClass('active');
		}
	});
	$('#status').fadeOut(500); 
	//setTimeout(function(){$("#ajax").load("ui/stock.php")},10000);
	$('#debug').draggable();
});