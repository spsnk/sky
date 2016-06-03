<?php
require_once("Funciones/init.php");
require('fpdf/fpdf.php');

class PDF extends FPDF
{
// Cabecera de página
function Header()
{
    // Logo
    $this->Image('sky/skylogo.jpg',11,7,30);
    // Arial bold 15
    $this->SetFont('Arial','B',15);
    // Movernos a la derecha
    $this->Cell(120);
    // Título
    $this->Cell(50,10,'Reporte',0,0,'C');
    // Salto de línea
    $this->Ln(10);
       
    
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
	
	
	  
	  $this->Ln();
	     $this->Cell(27);

        for ($i=0; $i <count($Cabecera) ; $i++) { 

		$this->SetFont('Courier','B',12);
		$this->SetFillColor(00,00,00);
		$this->SetTextColor(255,255,255);
		$this->Cell(40,10,$Cabecera[$i],1,0,'C',true);

	}
}

function Reporte()
{
        $fill=false;
        
        $this->SetFillColor(255,255,255);
        $this->SetTextColor(100,100,100);

    $consulta=getquery("SELECT pago.*,
            cliente.nombre as cna, cliente.ap as cap, cliente.am as cam,
            empleado.nombre as ena, empleado.ap as eap, empleado.am as eam,proveedor.nombre as pna
            from pago
            left join cliente on pago.nocuenta = cliente.nocuenta
            left join empleado on pago.idempleado = empleado.idempleado
            left join proveedor on pago.idproveedor = proveedor.idproveedor
            where pago.fecha like '2016-05%'
            group by pago.idtransaccion
            order by pago.fecha desc;");
 
    foreach($consulta as $datos)
    {
       
        $idtransaccion=$datos['idTransaccion'];
        $Monto=$datos['Monto'];
        $Concepto=$datos['concepto'];
        $fecha=$datos['fecha'];
        $idempleado=$datos['idEmpleado'];
        $nocuenta=$datos['noCuenta'];
        $idproveedor=$datos['idProveedor'];
        $cna=$datos['cna'];
        $cap=$datos['cap'];
        $cam=$datos['cam'];

        
        $this->SetFillColor(255,255,255);
        $this->SetTextColor(100,100,100);
        
       
        $this->Cell(27);
        $this->Cell(30,10,$Monto,'LR',0,'C',$fill);
        $this->Cell(45,10,$Concepto,'LR',0,'C',$fill);
        $this->Cell(50,10,$fecha,'LR',0,'C',$fill);
        
         
        $this->Cell(35,10,$cna,'',0,'L',$fill);
        $this->Cell(40,10,$cap,'',0,'R',$fill);
        $this->Cell(35,10,$cam,'',0,'',$fill);
        
        
        $this->Ln();
        $fill=!$fill;
      
    }//foreach
}
	
}
    $Cabecera= array(
        "Monto","Concepto",
        "fecha","Nombre","Ap Paterno","Ap Materno"
    );

$pdf = new PDF('L','mm');
$pdf->AliasNbPages();


$pdf->AddPage();//nueva pagina
$pdf->SetFont('Times','',12);
$pdf->tabla($Cabecera);
$pdf->Reporte();
$pdf->Ln(10);
$pdf->Output();
?>

