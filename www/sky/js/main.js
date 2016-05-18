
var preload = $('<img />').attr('src','img/ajaxloading.gif');
var ajax_load ="<img src='img/ajaxloading.gif' /> Cargando...";
//var ajax_ready = "Listo.";

function rezisenya(){
	var h = $(window).height();
	if (h>550){
		$("#rightcolumn").css('min-height',h-170);
		$("#leftcolumn").css('min-height',h-170);
	}
};
function rawr(){
	$(".replace-link").each( function(i,e){ 
		var href=$(this).attr("href");
		var get=$(this).attr("id");
		$(this).removeAttr("href").click( function(){ 
			$("#status").html(ajax_load);
			$("#rightcolumn").load(href,get,function(response, status, xhr){
				if (status == "error")
					$("#status").html(href+" "+xhr.statusText+" "+xhr.status);
				else
					$("#status")//.html(ajax_ready)
					.fadeOut(800,function(){$(this).html("").show();});
			});
		}).removeAttr("id").removeAttr("class");
	});
};
$(window).resize(function(){
	rezisenya();
});
$(document).ready(function(){
	rezisenya();
	rawr();
	$('.menu').initMenu();
	//$("#rightcolumn").load("core/core.php","nya=home");
});