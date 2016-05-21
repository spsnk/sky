<?php
define("NYA_INIT", "WRITE");
require_once 'PDOconstruct.php';
$nya = getGETPOST('nya');
$act = getGETPOST('act');
//echo "<br /> $nya -> $act <br />";
//anti-regiter_globals
$result=NULL;
$count=NULL;
$types=NULL;
$schools=NULL;
$channels=NULL;
switch($nya){
	case 'employee':
    switch($act){
      case 'add':
				$name   = getGETPOST('name');
				$ap     = getGETPOST('ap');
				$am     = getGETPOST('am');
				$hiredt	= getGETPOST('hiredt');
				$type   = getGETPOST('type');
        if (!array_key_exists("img",$_FILES)||($_FILES["img"]["error"] > 0 && $_FILES["img"]["error"] != 4) ){
					//echo ("Error: " . $_FILES["img"]["error"] . "<br />");
          echo ("No file uploaded");
          $filename = "noimage.png";
				} else {
					if( $_FILES["img"]["error"] == 4 ){
						$filename = "noimage.png";
						echo("No file Uploaded, default image will be used");
					} else {
						if (($_FILES["img"]["type"] != "image/gif")
							&& ($_FILES["img"]["type"] != "image/jpeg")
							&& ($_FILES["img"]["type"] != "image/pjpeg")
							&& ($_FILES["img"]["type"] != "image/png")){
                echo("Invalid File");
                $filename = "noimage.png";
            } else {
              echo "Upload: " . $_FILES["img"]["name"] . "<br />";
              echo "Type: " . $_FILES["img"]["type"] . "<br />";
              echo "Size: " . ($_FILES["img"]["size"] / 1024) . " Kb<br />";
              echo "Temp file: " . $_FILES["img"]["tmp_name"]."<br />";
              $hash = md5_file($_FILES["img"]["tmp_name"]);
              //$file_basename = substr($filename, 0, strripos($filename, '.')); // strip extention
              $file_ext = substr($_FILES["img"]["name"], strripos($_FILES["img"]["name"], '.'));
              if (file_exists(APP_PATH."img/employee/" . $hash . $file_ext)){
                echo ($_FILES["img"]["name"] . " already exists, entry will be duplicated. ");
                $filename = $hash . $file_ext;
              } else {
                move_uploaded_file($_FILES["img"]["tmp_name"],
                APP_PATH."img/employee/" . $hash . $file_ext);
                $filename = $hash . $file_ext;
                include_once 'image.class.php';
                $thumb = new thumb_image;
                $thumb->GenerateThumbFile(APP_PATH . 'img/employee/'. $filename, APP_PATH . 'img/employee/thumb/t_' . $filename);
                echo "Stored in: " . APP_PATH . "img/employee/" . $filename;
                echo "<br /> Thumb stored in: " . APP_PATH . "img/employee/thumb/t_" . $filename;
                echo "<br /><img src='". WEB_PATH . "img/employee/thumb/t_" . $filename ."' /><br />";
                echo "<br /><img src='". WEB_PATH . "img/employee/" . $filename ."' />";
              }
            }
          }
				}
        $data = array($name,$ap,$am,$hiredt,$type,$filename);
        switch($type){
          case 'T':
          	$area   = getGETPOST('area');
            try {
              $DBH->beginTransaction();
              $sth = $DBH->prepare('INSERT INTO empleado (Nombre,ap,am,fechaContratacion,tipo,foto) VALUES(?,?,?,?,?,?)');
              // SELECT LAST_INSERT_ID() as last');
              $sth->execute($data);
              //$lastClientId = $sth->fetch();
              //$lastClientId = $lastClientId['last'];
              $lastClientId = $DBH->lastInsertId();
              $sth = $DBH->prepare('INSERT INTO tecnico (idEmpleado,Area) VALUES(?,?)');
              $sth->execute(array($lastClientId,$area));
              $DBH->commit();
            } catch(PDOException $e){
              echo $e->getMessage();
              $DBH->rollBack();
              print_r($data);
              echo("<br /><b>Application Terminated, transaction rolled back. $nya->$act</b><script type='text/javascript'>var lastClient=0;</script>");
            }
            echo "<br /><b>Sucessfully added Tecnician.</b> <script type='text/javascript'>var lastClient=$lastClientId;</script>";
          break;
          case 'A':
            $salary   = getGETPOST('salary');
            $hours    = getGETPOST('hours');
            $pass     = getGETPOST('pass');
            try {
              $DBH->beginTransaction();
              $sth = $DBH->prepare('INSERT INTO empleado (Nombre,ap,am,fechaContratacion,tipo,foto) VALUES(?,?,?,?,?,?)');
              $sth->execute($data);
              $lastClientId = $DBH->lastInsertId();
              $sth = $DBH->prepare('INSERT INTO administrativo (idEmpleado,Salario,Horas,password) VALUES(?,?,?,?)');
              $sth->execute(array($lastClientId,$salary,$hours,$pass));
              $DBH->commit();
            } catch(PDOException $e){
              $DBH->rollBack();
              echo $e->getMessage();
              print_r($data);
              die("<br /><b>Application Terminated. $nya->$act</b><script type='text/javascript'>var lastClient=0;</script>");
            }
            echo "<br /><b>Sucessfully added Administrative.</b> <script type='text/javascript'>var lastClient=$lastClientId;</script>";
          break;
        }
      break;
      ////////////////////
      case 'view':
				if(getGETPOST('id')!='') {
					try {
						$data=array(getGETPOST('id'));
						$sth = $DBH->prepare('
            SELECT e.*,t.area,a.salario,a.horas
            FROM empleado e
            LEFT JOIN tecnico t ON e.idEmpleado = t.idEmpleado
            LEFT JOIN administrativo a ON e.idEmpleado = a.idEmpleado
            WHERE (t.idEmpleado IS NULL OR a.idEmpleado IS NULL)
            and e.idEmpleado = ?
            ');
						$sth->execute($data);
					} catch(PDOException $e){
						echo $e->getMessage();
						die("<br /><b>Application Terminated. $nya->$act</b>");
					}
				} else {
					if(getGETPOST('max_result')!="")
						$limit = (int)getGETPOST('max_result');
					else
						$limit = 10;
					if(getGETPOST('start')!="")
						$start = (int)getGETPOST('start');
					else
						$start = 0;
					//$data= array($start,$limit);
					try {
						$sth = $DBH->prepare('
            SELECT e.*,t.area,a.salario,a.horas
            FROM empleado e
            LEFT JOIN tecnico t ON e.idEmpleado = t.idEmpleado
            LEFT JOIN administrativo a ON e.idEmpleado = a.idEmpleado
            WHERE t.idEmpleado IS NULL OR a.idEmpleado IS NULL
            LIMIT ?, ?
            ');
            /*SELECT e.*FROM empleado e, administrativo a, tecnico t 
            WHERE  (e.idEmpleado = a.idEmpleado AND NOT (t.idEmpleado = e.idEmpleado))
            LIMIT ?, ?');*/
						$sth->bindValue(1, $start, PDO::PARAM_INT);
						$sth->bindValue(2, $limit, PDO::PARAM_INT);
						$sth->execute();
            
						$countsth = $DBH->query('SELECT COUNT(*) AS total FROM empleado');
					} catch(PDOException $e){
						echo $e->getMessage();
						die("<br /><b>Application Terminated. $nya->$act</b>");
					}
					$count = $countsth->fetch();
					$count = $count['total'];
				}
				$result = stripslashes_deep($sth->fetchAll());
        //print_r($result);
			break;
      //////////////
			case 'search':
				if(getGETPOST('term')!="") 
					$autocomplete = getGETPOST('term');
				else
					die("No data received.");
				$data = array("%".$autocomplete."%","%".$autocomplete."%","%".$autocomplete."%");
				try {
					$sth = $DBH->prepare('SELECT idempleado AS value, CONCAT(nombre," ",ap," ",am) AS label FROM empleado WHERE nombre LIKE ? OR ap like ? or am like ? LIMIT 15');
					$sth->execute($data);
				} catch(PDOException $e){
					echo $e->getMessage();
					die("<br /><b>Application Terminated. $nya->$act</b>");
				}
				$result = stripslashes_deep($sth->fetchAll());
				die(json_encode($result));
			break;
			case 'update':
				if(getGETPOST('id')!="" ) 
					$id = getGETPOST('id'); 
				else 
					die("No valid ID specified.");
				$name   = getGETPOST('name');
				$ap     = getGETPOST('ap');
				$am     = getGETPOST('am');
				$hiredt	= getGETPOST('hiredt');
				$type   = getGETPOST('type');
				$data = array($name,$ap,$am,$hiredt,$type,$id);
				try {
					$sth = $DBH->prepare('UPDATE empleado SET Nombre=?,ap=?,am=?,fechacontratacion=?,tipo=? WHERE idempleado=?');
					$sth->execute($data);
				} catch(PDOException $e){
					echo $e->getMessage();
					die("<br /><b>Application Terminated. $nya->$act</b>");
				}
				echo "<br /><b>Sucessfully updated client.</b>";
			break;
			case 'count':
				try {
					$sth = $DBH->query('SELECT COUNT(*) AS total FROM client');
				} catch(PDOException $e){
					echo $e->getMessage();
					die("<br /><b>Application Terminated. $nya->$act</b>");
				}
				$result = $sth->fetch();
				die($result['total']);
			break;
			default:
				echo "No valid act received $nya-> \$act = '$act'"; break;
    }
  break;
  case 'channel':
    switch($act){
      case 'view':
				if(getGETPOST('id')!='') {
					try {
						$data=array(getGETPOST('id'));
						$sth = $DBH->prepare('
            SELECT * from canal where idcanal = ?
            ');
						$sth->execute($data);
					} catch(PDOException $e){
						echo $e->getMessage();
						die("<br /><b>Application Terminated. $nya->$act</b>");
					}
				} else {
					if(getGETPOST('max_result')!="")
						$limit = (int)getGETPOST('max_result');
					else
						$limit = 10;
					if(getGETPOST('start')!="")
						$start = (int)getGETPOST('start');
					else
						$start = 0;
					try {
						$sth = $DBH->prepare('
            SELECT *
            FROM canal
            LIMIT ?, ?
            ');
						$sth->bindValue(1, $start, PDO::PARAM_INT);
						$sth->bindValue(2, $limit, PDO::PARAM_INT);
						$sth->execute();
						$countsth = $DBH->query('SELECT COUNT(*) AS total FROM canal');
					} catch(PDOException $e){
						echo $e->getMessage();
						die("<br /><b>Application Terminated. $nya->$act</b>");
					}
					$count = $countsth->fetch();
					$count = $count['total'];
				}
				$result = stripslashes_deep($sth->fetchAll());
      break;
    }
  break;
  case 'service':
    switch($act){
      case 'view':
				if(getGETPOST('id')!='') {
					try {
						$data=array(getGETPOST('id'));
						$sth = $DBH->prepare('
            SELECT * from servicio where idservicio = ?
            ');
						$sth->execute($data);
					} catch(PDOException $e){
						echo $e->getMessage();
						die("<br /><b>Application Terminated. $nya->$act</b>");
					}
				} else {
					if(getGETPOST('max_result')!="")
						$limit = (int)getGETPOST('max_result');
					else
						$limit = 10;
					if(getGETPOST('start')!="")
						$start = (int)getGETPOST('start');
					else
						$start = 0;
					try {
						$sth = $DBH->prepare('
            SELECT *
            FROM servicio
            LIMIT ?, ?
            ');
						$sth->bindValue(1, $start, PDO::PARAM_INT);
						$sth->bindValue(2, $limit, PDO::PARAM_INT);
						$sth->execute();
						$countsth = $DBH->query('SELECT COUNT(*) AS total FROM servicio');
					} catch(PDOException $e){
						echo $e->getMessage();
						die("<br /><b>Application Terminated. $nya->$act</b>");
					}
					$count = $countsth->fetch();
					$count = $count['total'];
				}
				$result = stripslashes_deep($sth->fetchAll());
      break;
    }
  break;
  case 'package':
			try {
				$sth = $DBH->query('SELECT idcanal, nombre, logo FROM canal');
			} catch(PDOException $e){
				echo $e->getMessage();
				die("<br/><b>Application Terminated. $nya->$act</b>");
			}
			$channels = stripslashes_deep($sth->fetchAll());
      switch($act){
        case 'view':
          if(getGETPOST('id')!='') {
            try {
              $data=array(getGETPOST('id'));
              $sth = $DBH->prepare('
              SELECT * from paquete where idpaquete = ?
              ');
              $sth->execute($data);
            } catch(PDOException $e){
              echo $e->getMessage();
              die("<br /><b>Application Terminated. $nya->$act</b>");
            }
          } else {
            if(getGETPOST('max_result')!="")
              $limit = (int)getGETPOST('max_result');
            else
              $limit = 10;
            if(getGETPOST('start')!="")
              $start = (int)getGETPOST('start');
            else
              $start = 0;
            try {
              $sth = $DBH->prepare('
              SELECT *
              FROM paquete
              LIMIT ?, ?
              ');
              $sth->bindValue(1, $start, PDO::PARAM_INT);
              $sth->bindValue(2, $limit, PDO::PARAM_INT);
              $sth->execute();
              $countsth = $DBH->query('SELECT COUNT(*) AS total FROM paquete');
            } catch(PDOException $e){
              echo $e->getMessage();
              die("<br /><b>Application Terminated. $nya->$act</b>");
            }
            $count = $countsth->fetch();
            $count = $count['total'];
          }
          $result = stripslashes_deep($sth->fetchAll());
        break; 
      }
  break;
  case 'equipment':
			try {
				$sth = $DBH->query('SELECT idproveedor, nombre FROM proveedor');
			} catch(PDOException $e){
				echo $e->getMessage();
				die("<br/><b>Application Terminated. $nya->$act</b>");
			}
			$provider = stripslashes_deep($sth->fetchAll());
      foreach($provider as $key => $arr){
        $idprov[$arr['idproveedor']]=$arr['nombre'];
      }
      switch($act){
        case 'view':
          if(getGETPOST('id')!='') {
            try {
              $data=array(getGETPOST('id'));
              $sth = $DBH->prepare('
              SELECT * from equipo where idequipo = ?
              ');
              $sth->execute($data);
            } catch(PDOException $e){
              echo $e->getMessage();
              die("<br /><b>Application Terminated. $nya->$act</b>");
            }
          } else {
            if(getGETPOST('max_result')!="")
              $limit = (int)getGETPOST('max_result');
            else
              $limit = 10;
            if(getGETPOST('start')!="")
              $start = (int)getGETPOST('start');
            else
              $start = 0;
            try {
              $sth = $DBH->prepare('
              SELECT *
              FROM equipo
              LIMIT ?, ?
              ');
              $sth->bindValue(1, $start, PDO::PARAM_INT);
              $sth->bindValue(2, $limit, PDO::PARAM_INT);
              $sth->execute();
              $countsth = $DBH->query('SELECT COUNT(*) AS total FROM equipo');
            } catch(PDOException $e){
              echo $e->getMessage();
              die("<br /><b>Application Terminated. $nya->$act</b>");
            }
            $count = $countsth->fetch();
            $count = $count['total'];
          }
          $result = stripslashes_deep($sth->fetchAll());
        break; 
      }
  break;
	case 'client':
		switch($act){
			case 'add':	
				$name   = getGETPOST('name');
				$ap     = getGETPOST('ap');
				$am     = getGETPOST('am');
				$street = getGETPOST('street');
				$colony = getGETPOST('colony');
				$cp 	= getGETPOST('cp');
				$bhda	= getGETPOST('bhda');
				$phone  = getGETPOST('phone');
				$pass 	= getGETPOST('pass');
				
				echo"</br>Data Received for client: <br />Name: $name <br />Address: $address <br />Phone: $phone <br /> ";
				if($address == "" || $address == "Dirección")
					$address = NULL;
				if($phone == "" || strpos($phone,"_") !== false )
					$phone = NULL;
				$data = array($name,$ap,$am,$phone,$street,$colony,$cp,$bhda,$pass);
				try {
					$sth = $DBH->prepare('INSERT INTO cliente (Nombre,ap,am,Telefono,Calle,Colonia,CP,fechaNacimiento,password) VALUES(?,?,?,?,?,?,?,?,?); SELECT LAST_INSERT_ID() as last');
					$sth->execute($data);
					$lastClientId = $sth->fetch();
					$lastClientId = $lastClientId['last'];
				} catch(PDOException $e){
					echo $e->getMessage();
					die("<br /><b>Application Terminated. $nya->$act</b>");
				}
				echo "<br /><b>Sucessfully added client.</b> <script type='text/javascript'>var lastClient=$lastClientId;</script>";
			break;
			case 'view':
				if(getGETPOST('id')!="") {
					try {
						$data=array(getGETPOST('id'));
						$sth = $DBH->prepare('SELECT * FROM cliente WHERE nocuenta=?');
						$sth->execute($data);
					} catch(PDOException $e){
						echo $e->getMessage();
						die("<br /><b>Application Terminated. $nya->$act</b>");
					}
				} else {
					if(getGETPOST('max_result')!="")
						$limit = (int)getGETPOST('max_result');
					else
						$limit = 10;
					if(getGETPOST('start')!="")
						$start = (int)getGETPOST('start');
					else
						$start = 0;
					//$data= array($start,$limit);
					try {
						$sth = $DBH->prepare('SELECT * FROM cliente LIMIT ?, ?');
						$sth->bindValue(1, $start, PDO::PARAM_INT);
						$sth->bindValue(2, $limit, PDO::PARAM_INT);
						$sth->execute();
						$countsth = $DBH->query('SELECT COUNT(*) AS total FROM cliente');
					} catch(PDOException $e){
						echo $e->getMessage();
						die("<br /><b>Application Terminated. $nya->$act</b>");
					}
					$count = $countsth->fetch();
					$count = $count['total'];
				}
				$result = stripslashes_deep($sth->fetchAll());
				//$encoded_results=array();
				//for($i=0;$i < sizeof($result);$i++){
					//echo $i.":".$result[$i]['ID']."=>".$result[$i]['name']."=>".$result[$i]['address']."=>".$result[$i]['phone']."<br />";
					//$encoded_results = $encoded_results + array($result[$i]['ID']=>$result[$i]['name']);
				//}
			break;
			case 'search':
				if(getGETPOST('term')!="") 
					$autocomplete = getGETPOST('term');
				else
					die("No data received.");
				$data = array("%".$autocomplete."%");
				try {
					$sth = $DBH->prepare('SELECT ID AS value, name AS label FROM client WHERE name LIKE ? LIMIT 15');
					$sth->execute($data);
				} catch(PDOException $e){
					echo $e->getMessage();
					die("<br /><b>Application Terminated. $nya->$act</b>");
				}
				$result = stripslashes_deep($sth->fetchAll());
				// for($i=0;$i <= sizeof($result);$i++){
					// echo $i." :";
					// print_r($result[$i]);
					// echo "<br />";
				// }
				// $encoded_results=array();
				// for($i=0;$i < sizeof($result);$i++){
					//echo $i.":".$result[$i]['ID']."=>".$result[$i]['name']."<br />";
					// $encoded_results = $encoded_results + array($result[$i]['value']=>$result[$i]['label']);
				// }
				//print_r($encoded_results);
				//echo "<br />";
				die(json_encode($result));
			break;
			case 'update':
				if(getGETPOST('id')!="" ) 
					$id = getGETPOST('id'); 
				else 
					die("No valid ID specified.");
				if(getGETPOST('name')!="") 
					$name = getGETPOST('name'); 
				if(getGETPOST('phone')!="" || strpos(getGETPOST('phone'),"_") !== false) 
					$phone = getGETPOST('phone'); 
				else 
					$phone = NULL;
				echo"</br>Data Received for update: <br />ID: $id <br />Name: $name <br />Address: $address <br />Phone: $phone <br /> ";
				// if($address == "" || $address == "Dirección")
					// $address = NULL;
				// if($phone == "" || strpos($phone,"_") !== false )
					// $phone = NULL;
				$data = array($name,$address,$phone,$id);
				try {
					$sth = $DBH->prepare('UPDATE client SET Nombre=?,ap=?,am=?,Telefono=?,Calle=?,Colonia=?,CP=?,fechaNacimiento=?,password=? WHERE id=?');
					$sth->execute($data);
				} catch(PDOException $e){
					echo $e->getMessage();
					die("<br /><b>Application Terminated. $nya->$act</b>");
				}
				echo "<br /><b>Sucessfully updated client.</b>";
			break;
			case 'count':
				try {
					$sth = $DBH->query('SELECT COUNT(*) AS total FROM client');
				} catch(PDOException $e){
					echo $e->getMessage();
					die("<br /><b>Application Terminated. $nya->$act</b>");
				}
				$result = $sth->fetch();
				die($result['total']);
			break;
			default:
				echo "No valid act received $nya-> \$act = '$act'"; break;
		}
	break;
  
	case 'stock':
		// if(isset($_GET['data']))
			// $data = $_GET['data'];
		// if($data == 'meow'){
			try {
				$sth = $DBH->query('SELECT * FROM types');
			} catch(PDOException $e){
				echo $e->getMessage();
				die("<br/><b>Application Terminated. $nya->$act</b>");
			}
			$types = stripslashes_deep($sth->fetchAll());
			try {
				$sth = $DBH->query('SELECT ID, name FROM school');
			} catch(PDOException $e){
				echo $e->getMessage();
				die("<br/><b>Application Terminated. $nya->$act</b>");
			}
			$schools = stripslashes_deep($sth->fetchAll());
		//}
		switch($act){
			case 'view':
				if(getGETPOST('id')!="") {
					try {
						$sth = $DBH->prepare('SELECT *, schoolsID AS schools FROM item_search WHERE ID=?');
						//$sth = $DBH->prepare('SELECT item.*, GROUP_CONCAT(school_idx.schoolID ORDER BY school_idx.schoolID) AS schools FROM item LEFT JOIN school_idx ON item.ID = school_idx.itemID WHERE item.ID=? GROUP BY item.ID');
						//SELECT * FROM item WHERE ID=?');
						$sth->execute(array(getGETPOST('id')));
					} catch(PDOException $e){
						echo $e->getMessage();
						die("<br /><b>Application Terminated. $nya->$act</b>");
					}
				} else {
					if(getGETPOST('max_result')!="")
						$limit = (int)getGETPOST('max_result');
					else
						$limit = 10;
					if(getGETPOST('start')!="")
						$start = (int)getGETPOST('start');
					else
						$start = 0;
					try {
						$sth = $DBH->prepare('SELECT *, schoolsID AS schools FROM item_search LIMIT ?, ? ');
						//$sth = $DBH->prepare('SELECT item.*, GROUP_CONCAT(school_idx.schoolID ORDER BY school_idx.schoolID) AS schools FROM item LEFT JOIN school_idx ON item.ID = school_idx.itemID GROUP BY item.ID LIMIT ?, ? ');
						$sth->bindValue(1, $start, PDO::PARAM_INT);
						$sth->bindValue(2, $limit, PDO::PARAM_INT);
						$sth->execute();
						$countsth = $DBH->query('SELECT COUNT(*) AS total FROM item');
					} catch(PDOException $e){
						echo $e->getMessage();
						die("<br /><b>Application Terminated. $nya->$act</b>");
					}
					$count = $countsth->fetch();
					$count = $count['total'];
				}
				$result = stripslashes_deep($sth->fetchAll());
				//$encoded_results=array();
				//for($i=0;$i < sizeof($result);$i++){
					//echo $i.":".$result[$i]['ID']."=>".$result[$i]['name']."=>".$result[$i]['address']."=>".$result[$i]['phone']."<br />";
					//$encoded_results = $encoded_results + array($result[$i]['ID']=>$result[$i]['name']);
				//}
			break;
			case 'add':
				if(getGETPOST('typeID')=="")
					die("No data received.");
				$typeID = getGETPOST('typeID');
				$size   = getGETPOST('size');
				$price  = getGETPOST('price');
				$units  = getGETPOST('units');
				$desc   = getGETPOST('desc');
				$school = getGETPOST('school');
				if($desc == "" || $desc == "Descripción")
					$desc = NULL;
				echo "Data received for item: <br /> typeID: $typeID <br /> size: $size <br /> price: $price <br /> units: $units <br /> desc: $desc <br /> School: ";
				if(is_array($school)){
					foreach($school as $arr){
						echo "$arr,";
					}
				}
				echo "<br />";
				if ($_FILES["img"]["error"] > 0 && $_FILES["img"]["error"] != 4){
					die ("Error: " . $_FILES["img"]["error"] . "<br />");
				} else {
					if( $_FILES["img"]["error"] == 4 ){
						$filename = "noimage.png";
						echo("No file Uploaded, default image will be used");
					} else {
						if (($_FILES["img"]["type"] != "image/gif")
							&& ($_FILES["img"]["type"] != "image/jpeg")
							&& ($_FILES["img"]["type"] != "image/pjpeg")
							&& ($_FILES["img"]["type"] != "image/png"))
							die("Invalid File");
						echo "Upload: " . $_FILES["img"]["name"] . "<br />";
						echo "Type: " . $_FILES["img"]["type"] . "<br />";
						echo "Size: " . ($_FILES["img"]["size"] / 1024) . " Kb<br />";
						echo "Temp file: " . $_FILES["img"]["tmp_name"]."<br />";
						$hash = md5_file($_FILES["img"]["tmp_name"]);
						//$file_basename = substr($filename, 0, strripos($filename, '.')); // strip extention
						$file_ext = substr($_FILES["img"]["name"], strripos($_FILES["img"]["name"], '.'));
						if (file_exists(APP_PATH."img/catalog/" . $hash . $file_ext)){
							echo ($_FILES["img"]["name"] . " already exists, entry will be duplicated. ");
							$filename = $hash . $file_ext;
						} else {
							move_uploaded_file($_FILES["img"]["tmp_name"],
							APP_PATH."img/catalog/" . $hash . $file_ext);
							$filename = $hash . $file_ext;
							include_once 'image.class.php';
							$thumb = new thumb_image;
							$thumb->GenerateThumbFile(APP_PATH . 'img/catalog/'. $filename, APP_PATH . 'img/thumb/t_' . $filename);
							echo "Stored in: " . APP_PATH . "img/catalog/" . $filename;
							echo "<br /> Thumb stored in: " . APP_PATH . "img/thumb/t_" . $filename;
							echo "<br /><img src='". WEB_PATH . "img/thumb/t_" . $filename ."' /><br />";
							echo "<br /><img src='". WEB_PATH . "img/catalog/" . $filename ."' />";
						}
					}
				}
				$data = array($typeID,$size,$price,$units,$desc,$filename);
				try {
					$sth = $DBH->prepare('INSERT INTO item (typeID,size,price,units,`desc`,img) VALUES(?,?,?,?,?,?)');
					$sth->execute($data);
					$lastId = $DBH->query('SELECT LAST_INSERT_ID() as last');
					$lastId = $lastId->fetch();
					$lastId = $lastId['last'];
					//var_dump($lastId);
					if(is_array($school)){
						foreach($school as $arr){
							$data = array($lastId,$arr);
							$sth = $DBH->prepare('INSERT INTO school_idx (itemID,schoolID) VALUES(?,?)');
							$sth->execute($data);
						}
					}
				} catch(PDOException $e){
					echo $e->getMessage();
					die("<br /><b>Application Terminated. $nya->$act</b>");
				}
				echo "<br /><b>Sucessfully added item.</b>";
				//print_r($_POST);
				//var_dump($_POST);
			break;
			case 'update':
				if(getGETPOST('id')=="")
					die("No data received.");
				$id       = getGETPOST('id');
				$typeID   = getGETPOST('typeID'); 
				$size     = getGETPOST('size');
				$price    = getGETPOST('price');
				$units    = getGETPOST('units');
				$desc     = getGETPOST('desc');
				$filename = getGETPOST('filename');
				$school   = getGETPOST('school');
				if($desc == "" || $desc == "Descripción")
					$desc = NULL;
				echo "Data received for item: <br />ID: $id<br /> typeID: $typeID <br /> size: $size <br /> price: $price <br /> units: $units <br /> desc: $desc <br /> img: $filename <br /> School:";
				if(is_array($school)){
					foreach($school as $arr){
						echo "$arr,";
					}
				}
				echo "<br>";
				if($filename == "EMPTY") {
					if($_FILES["img"]["error"] > 0 && $_FILES["img"]["error"] != 4){
						die ("Error: " . $_FILES["img"]["error"] . "<br />");
					} else {
						if( $_FILES["img"]["error"] == 4 ) {
							$filename = "noimage.png";
							echo("No file Uploaded, default image will be used");
						} else {
							if (($_FILES["img"]["type"] != "image/gif")
								&& ($_FILES["img"]["type"] != "image/jpeg")
								&& ($_FILES["img"]["type"] != "image/pjpeg")
								&& ($_FILES["img"]["type"] != "image/png"))
								die("Invalid File");
							echo "Upload: " . $_FILES["img"]["name"] . "<br />";
							echo "Type: " . $_FILES["img"]["type"] . "<br />";
							echo "Size: " . ($_FILES["img"]["size"] / 1024) . " Kb<br />";
							echo "Temp file: " . $_FILES["img"]["tmp_name"]."<br />";
							$hash = md5_file($_FILES["img"]["tmp_name"]);
							//$file_basename = substr($filename, 0, strripos($filename, '.')); // strip extention
							$file_ext = substr($_FILES["img"]["name"], strripos($_FILES["img"]["name"], '.'));
							if (file_exists(APP_PATH."img/catalog/" . $hash . $file_ext)){
								echo ($_FILES["img"]["name"] . " already exists, entry will be duplicated. <br>");
								//$filename = "noimage.png";
								$filename = $hash . $file_ext;
							} else {
								move_uploaded_file($_FILES["img"]["tmp_name"],
								APP_PATH."img/catalog/" . $hash . $file_ext);
								$filename = $hash . $file_ext;
								include_once 'image.class.php';
								$thumb = new thumb_image;
								$thumb->GenerateThumbFile(APP_PATH . 'img/catalog/'. $filename, APP_PATH . 'img/thumb/t_' . $filename);
								try {
									$sth = $DBH->prepare('SELECT img FROM item WHERE ID=?');
									$sth->execute(array($id));
								} catch(PDOException $e){
									echo $e->getMessage();
									die("<br /><b>Application Terminated. $nya->$act</b>");
								}
								$file = $sth->fetch();
								$file = $file['img'];
								// if($file!="noimage.png") {
									// unlink(APP_PATH . "img/catalog/".$file);
									// unlink(APP_PATH . "img/thumb/t_".$file);
									// echo "Deleted: $file <br />";
								// }
								echo "Stored in: " . APP_PATH . "img/catalog/$filename";
								echo "<br /> Thumb stored in: " . APP_PATH . "img/thumb/t_$filename";
								echo "<br /><img src='". WEB_PATH . "img/thumb/t_$filename' /><br />";
								echo "<br /><img src='". WEB_PATH . "img/catalog/$filename' />";
							}
						}
					}
				}
				echo " filename: $filename";
				$data = array($typeID,$size,$price,$units,$desc,$filename,$id);
				try {
					$sth = $DBH->prepare('UPDATE item  SET typeID=?, size=?, price=?, units=?,`desc`=?,img=? WHERE ID=?');
					$sth->execute($data);
					if(is_array($school)){
						$sth = $DBH->prepare('DELETE FROM school_idx WHERE itemID=?');
						$sth->execute(array($id));
						foreach($school as $arr){
							$data = array($id,$arr);
							$sth = $DBH->prepare('INSERT INTO school_idx (itemID,schoolID) VALUES(?,?)');
							$sth->execute($data);
						}
					}
				} catch(PDOException $e){
					echo $e->getMessage();
					die("<br /><b>Application Terminated. $nya->$act</b>");
				}
				echo "<br /><b>Sucessfully updated item.</b>";
				//print_r($_POST);
			break;
			case 'search':
				$autocomplete = getGETPOST('term');
				if(!$autocomplete) die("No data received.");
				$data = array("%".$autocomplete."%","%".$autocomplete."%");
				try {
					//$sth = $DBH->prepare('SELECT item.ID AS value, CONCAT(types.type," ",item.desc) AS label FROM item LEFT JOIN types ON item.typeID = types.ID WHERE item.desc LIKE ? OR types.type LIKE ? LIMIT 15');
					$sth = $DBH->prepare('SELECT name AS label,ID AS value,size,schools,price FROM item_search WHERE name LIKE ?  OR schools LIKE ? ORDER BY name,price ');
					$sth->execute($data);
				} catch(PDOException $e){
					echo $e->getMessage();
					die("<br /><b>Application Terminated. $nya->$act</b>");
				}
				$result = stripslashes_deep($sth->fetchAll());
				die(json_encode($result));
			break;
			case 'add_stock':
				$id = getGETPOST('id');
				if(!$id) die("No data received.");
				//$units = getGETPOST('units');
				$suma = getGETPOST('suma');
				try {
					$sth = $DBH->prepare('SELECT units FROM item WHERE ID = ?;');
					$sth->execute(array($id));
					$units = $sth->fetch();
					$units = $units['units'];
					if(($units+$suma)<0)
						$suma = $units*-1;
					$sth = $DBH->prepare('UPDATE item SET units= units+? WHERE ID = ?;');
					$sth->execute(array($suma,$id));
					//$sth = $DBH->prepare('SELECT units FROM item WHERE ID=?');
					//$sth->execute(array($id,$suma,$id));
				} catch(PDOException $e){
					echo $e->getMessage();
					die("<br /><b>Application Terminated. $nya->$act</b>");
				}
				// $units = $sth->fetch();
				// $units = $units['units'];
				echo "<br>Se ". ($suma > 0 ? "agreg".( (abs($suma))>1 ? "aron":"ó" ) : "retir".( (abs($suma))>1 ? "aron":"ó" ))
				." <b>".abs($suma)." unidad".( (abs($suma))>1 ? "es":"" )."</b> para un total de <b>"
				.($units+$suma)." unidad".( (abs($units+$suma))>1 | ($units+$suma) == 0 ? "es":"" )."</b>.";
				
				echo "<script type='text/javascript'>$('div#$id input[name=units]').val($units+$suma); $('div#$id a[id=units]').html('<div class=\'flechita\'></div> '+parseInt($units+$suma)+' Unidad".( (abs($units+$suma))>1 | ($units+$suma) == 0 ? "es":"" )."');</script>";
			break;
			case 'info':
				try {
					$sth = $DBH->query('SELECT  ID, img, name, units, size FROM item_search WHERE units<'.MIN_STOCK_NOTIFY);
					//$sth = $DBH->query('SELECT  item.ID, item.img, CONCAT(types.type," ",item.desc) AS name, item.units, item.size FROM item LEFT JOIN types ON item.typeID=types.ID WHERE units<=1');
					//$sth->execute();
				} catch(PDOException $e){
					echo $e->getMessage();
					die("<br /><b>Application Terminated. $nya->$act</b>");
				}
				$result = stripslashes_deep($sth->fetchAll());
				die (json_encode($result));
			break;
			default:
				//echo "No valid act received $nya-> \$act = '$act'"; 
			break;
		}
	break;
	case 'order':
		switch($act){
			case 'add':
				//print_r($_POST);
				getGETPOST('clientID') == '' ? die("No data received <br> $nya-> \$act = $act") : $clientID = getGETPOST('clientID');
				//$clientID = 	getGETPOST('clientID');
				$items = 		getGETPOST('items');
				$extra = 		getGETPOST('extra');
				$extra_desc = 	getGETPOST('extra_desc');
				$paid = 		getGETPOST('paid');
				$coupon = 		getGETPOST('coupon');
				$notes = 		getGETPOST('notes');
				getGETPOST('delivered') == '' ? $delivered = 0 : $delivered = 1;
				echo " clientID: $clientID <br> paid: $paid <br> coupon: $coupon <br> notes: $notes <br> delivered: $delivered <br> items: ";
				print_r($items);
				echo '<br> extra: ';
				print_r($extra);
				echo '<br> extra_desc: <br>';
				//rawurldecode(print_r($extra_desc));
				if(is_array($extra_desc))
					foreach($extra_desc as $i => $desc)
						echo $i.': '.rawurldecode($desc).'<br>';
				
				$data = array($clientID,$paid,$coupon,$delivered,$notes);
				try {
					$sth = $DBH->prepare('INSERT INTO `order` (clientID,paid,coupon,delivered,notes) VALUES(?,?,?,?,?)');
					$sth->execute($data);
					$lastId = $DBH->query('SELECT LAST_INSERT_ID() as last');
					$lastId = $lastId->fetch();
					$lastId = $lastId['last'];
					//var_dump($lastId);
					if(is_array($items)){
						foreach($items as $itm){
							$data = array($lastId,$itm);
							$sth = $DBH->prepare('INSERT INTO order_content (orderID,itemID) VALUES(?,?)');
							$sth->execute($data);
							if($delivered){
								$sth = $DBH->prepare('UPDATE item SET units=units-1 WHERE ID = ?');
								$sth->execute(array($itm));
							}
						}
					}
					if(is_array($extra)){
						foreach($extra as $i => $extr){
							$data = array($lastId,$extr,rawurldecode($extra_desc[$i]));
							$sth = $DBH->prepare('INSERT INTO order_extra (orderID,price,`desc`) VALUES(?,?,?)');
							$sth->execute($data);
						}
					}
				} catch(PDOException $e){
					echo $e->getMessage();
					die("<br /><b>Application Terminated. $nya->$act</b>");
				}
				echo "<br /><b>Sucessfully added item.</b> <script type='text/javascript'>updateInfo(); 
	$('#reset').click();</script>";
			break;
			default:
				echo "No valid act received $nya-> \$act = '$act'"; 
			break;
		}
	break;
	default:
		echo "No valid nya received -> \$nya = '$nya'"; break;
}

function stripslashes_deep($value) {
    $value = is_array($value) ?
                array_map('stripslashes_deep', $value) :
                stripslashes($value);
    return $value;
}

function isset_or(&$check, $alternate = NULL) { 
    return (isset($check)) ? (empty($check) ? $alternate : $check) : $alternate; 
} 

function getGETPOST($var) { 
      return isset_or($_GET[$var],isset_or($_POST[$var],'')); 
} 
/*				NOTES
supa search query
 SELECT item.ID, CONCAT(types.type," ",item.desc) AS name, types.type,item.desc, item.units, item.size,
  item.price, item.img,  GROUP_CONCAT(school.name ORDER BY school.ID) AS schools,  GROUP_CONCAT(CAST(school_idx.schoolID AS CHAR) ORDER BY school.ID) AS schoolsID , item.typeID
  FROM item
  LEFT JOIN types ON item.typeID = types.ID
  LEFT JOIN school_idx ON school_idx.itemID = item.ID
  LEFT JOIN school ON school.ID = school_idx.schoolID
  GROUP BY item.ID;
  
  
  mysqldump -pmiau -uroot --skip-opt --add-drop-table --add-locks --disable-keys --extended-insert --lock-tables --quick --set-charset  --no-data seifuku > seifuku-05-11-11(nodata).sql
*/
?>