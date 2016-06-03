<?php
  require_once("MySQLServer.php");
   $Connector=new MySQLServer("localhost","root","rawr","sky_final");
  $ruta="trabajotecnologias/images/producto/";
  $ruta2="trabajotecnologias/images/marcas/";
  $rutacat="trabajotecnologias/images/categorias/";
  $qry="select p.ID_producto ,p.nombre,p.precio,p.ruta from producto p";
  $array_estilos=array('overlay-fade-in','overlay-slide-in-left','overlay-fade-in-new-background');
	
  function getquery($query){
		global $Connector;
				return $Connector->enviarQuery($query);
	}
	function init($type=""){
		global $Connector,$qry;
		$cat=" ,categoria c where p.ID_cat=c.ID_cat and c.nombre like '".$type."'";
			if($type!=""){	
     		return getquery($qry.$cat);}
     		else{
     			return getquery($qry);
     		}
     }
    function bestSellers($type){
    	global$qry;
    	if($type!=""){
    	$cat=" ,categoria c where p.ID_cat=c.ID_cat and c.nombre like '".$type."'";
    		return getquery($qry.$cat." and p.valoracion >4 limit 0,8");
    	}
    	else {
    		return getquery($qry." limit 0,8");
    	}
    }
    function Search($search){
    	global $qry;	

    	 //return getquery($qry." , categoria c where p.id_cat=c.id_cat  or p.nombre like '% ".$search."%' or c.nombre like '%".$search"'");
    		return getquery($qry." where p.nombre like '% ".$search." %'");

    }
    function desc_Type($type){
    	return getquery("select nombre , ruta, descripcion from categoria where nombre='".$type."'");
    }
    function get_Product($id){
    	return new Producto(getquery("select p.id_producto as id , p.precio ,p.descripcion,p.nombre,p.id_cat as cate,p.id_marca as id_marca ,p.color ,p.ruta , m.nombre as marca , m.ruta as ruta_marc  
	from producto p , marca m  where id_producto='".$id."' and p.id_marca=m.id_marca"));
    }
    function get_match($match,$id){
    	global $qry;
    	return getquery($qry.", marca c  where p.id_marca=c.id_marca and c.id_marca=".$match." and p.id_producto!=".$id." limit 0,6");

    }
  
  ?>
