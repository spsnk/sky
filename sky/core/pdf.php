<?php
define("NYA_INIT", "WRITE");
require_once 'PDOconstruct.php';
require('fpdf/fpdf.php');

class PDF extends FPDF
{
// Cabecera de página
function Header()
{
    // Logo
    $this->Image('../sky/skylogo.jpg',11,7,30);
    // Arial bold 15
    $this->SetFont('Arial','B',15);
    // Movernos a la derecha
    $this->Cell(120);
    // Título
    $tipo=getGETPOST('type');
    switch($tipo){
      case 'p':
        $this->Cell(50,10,'Reporte Pagos',0,0,'C');
      break;
      case 's':
      default:
        $this->Cell(50,10,'Reporte Servicios',0,0,'C');
      break;
    }
    // Salto de línea
    $this->Ln(10);
    $this->Ln();
    
}

// Pie de página
function Footer()
{
    // Posición: a 1,5 cm del final
    $this->SetY(-15);
    // Arial italic 8
    $this->SetFont('Arial','I',8);
    // Número de página
    $this->Cell(0,10,'Page '.$this->PageNo().'/{nb}',0,0,'C');
}
function tabla($Cabecera){
	
	
	  
	  //$this->Ln();
	    // $this->Cell(27);

        //for ($i=0; $i <count($Cabecera) ; $i++) { 

		$this->SetFont('Courier','B',12);
		$this->SetFillColor(00,00,00);
		$this->SetTextColor(255,255,255);
    
		$this->Cell(50,10,'Fecha','LR',0,'C',true);
		$this->Cell(30,10,'Monto','LR',0,'C',true);
		$this->Cell(45,10,'Concepto','LR',0,'C',true);
    if(getGETPOST('type')=='s'){
      $this->Cell(80,10,'Tecnico','LR',0,'C',true);
      $this->Cell(80,10,'Cliente','LR',0,'C',true);
    }else{
      $this->Cell(80,10,'Nombre','LR',0,'C',true);
    }
    if(getGETPOST('type')!='s'){
      $this->Cell(30,10,'Tipo','LR',0,'C',true);
    }
    $this->Ln(10);

	//}
}

function Reporte($DBH)
{
  $fill=false;

  $this->SetFillColor(255,255,255);
  $this->SetTextColor(100,100,100);
  $this->SetFont('Arial','',11);
  
  $date=getGETPOST('date')."%";
  $tipo=getGETPOST('type');
  switch($tipo){
    case 'p':
      $sth = $DBH->prepare('
        SELECT pago.*,
        cliente.nombre as cna, cliente.ap as cap, cliente.am as cam,
        empleado.nombre as ena, empleado.ap as eap, empleado.am as eam,proveedor.nombre as pna
        from pago
        left join cliente on pago.nocuenta = cliente.nocuenta
        left join empleado on pago.idempleado = empleado.idempleado
        left join proveedor on pago.idproveedor = proveedor.idproveedor
        where pago.fecha like ?
        group by pago.idtransaccion
        order by pago.fecha desc;
      ');
     break;
    case 's':
    default:
      $sth = $DBH->prepare('
        SELECT doservicio.* ,doservicio.fechaservicio as fecha,
        cliente.nombre as cna, cliente.ap as cap, cliente.am as cam,
        empleado.nombre as ena, empleado.ap as eap, empleado.am as eam,
        servicio.nombre as concepto, servicio.costo as monto
        from doservicio
        left join cliente on doservicio.nocuenta = cliente.nocuenta
        left join empleado on doservicio.idempleado = empleado.idempleado
        left join servicio on doservicio.idservicio= servicio.idservicio
        where doservicio.fechaservicio like ?
        order by doservicio.fechaservicio desc, empleado.idempleado;
      ');
     break;
     
  }
  try {
    $data=array($date);
    $sth->execute($data);
  } catch(PDOException $e){
    echo $e->getMessage();
    die("<br /><b>Application Terminated. $nya->$act</b>");
  }
  $result = $sth->fetchAll();

      $this->SetFillColor(220,220,220);
  foreach($result as $key => $datos)
  {
      //$idtransaccion=$datos['idtransaccion'];
      $Monto=$datos['monto'];
      $Concepto=utf8_decode($datos['concepto']);
      $fecha=$datos['fecha'];
      //$idempleado=$datos['idempleado'];
      //$nocuenta=$datos['nocuenta'];
      //$idproveedor=$datos['idproveedor'];
      if($datos['idempleado']!=""){ $type = "e"; }
      else if($datos['nocuenta']!="") { $type = "c"; }
      else if($datos['idproveedor']!="") { $type = "p"; }
      $cna=utf8_decode($datos['cna']);
      $cap=utf8_decode($datos['cap']);
      $cam=utf8_decode($datos['cam']);
      $ena=utf8_decode($datos['ena']);
      $eap=utf8_decode($datos['eap']);
      $eam=utf8_decode($datos['eam']);
      if(array_key_exists('pna',$datos)){
        $pna=utf8_decode($datos['pna']);
      }
      //$this->Cell(27);
      $this->Cell(50,10,$fecha,'LRBT',0,'C',$fill);
      $this->Cell(30,10,"$".$Monto,'LRBT',0,'C',$fill);
      $this->Cell(45,10,$Concepto,'LRBT',0,'C',$fill);
      switch($type){
        case 'e':
          $this->Cell(80,10,$ena." ".$eap." ".$eam,'LRBT',0,'L',$fill);
          if(getGETPOST('type')!='s'){
            $this->Cell(30,10,'Empleado','LRBT',0,'',$fill);
          }
        break;
        case 'c':
          $this->Cell(80,10,$cna." ".$cap." ".$cam,'LRBT',0,'L',$fill);
          if(getGETPOST('type')!='s'){
            $this->Cell(30,10,'Cliente','LRBT',0,'',$fill);
          }
        break;
        case 'p':
          $this->Cell(80,10,$pna,'LRBT',0,'L',$fill);
          if(getGETPOST('type')!='s'){
            $this->Cell(30,10,'Proveedor','LRBT',0,'',$fill);
          }
        break;
      }
      if(getGETPOST('type')=='s'){
          $this->Cell(80,10,$cna." ".$cap." ".$cam,'LRBT',0,'L',$fill);
      }
      $this->Ln();
      $fill=!$fill;
  }//foreach
}
	
}
    $Cabecera= array(
        "Monto","Concepto",
        "fecha","Nombre","Tipo"
    );

$pdf = new PDF('L','mm');
$pdf->AliasNbPages();


$pdf->AddPage();//nueva pagina
$pdf->SetFont('Arial','',11);
$pdf->tabla($Cabecera);
$pdf->Reporte($DBH);
$pdf->Ln(10);
$pdf->Output();

function getGETPOST($var) { 
      return isset_or($_GET[$var],isset_or($_POST[$var],'')); 
} 


function isset_or(&$check, $alternate = NULL) { 
    return (isset($check)) ? (empty($check) ? $alternate : $check) : $alternate; 
} 
?>
