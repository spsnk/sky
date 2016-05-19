<?php
class MySQLServer{
	private $hostname;
	private $usuario;
	private $password;
	private $base;
	private $conexion;
	public $error;

	public function	__construct($hostname,$usuario,$password,$base){
		$this->hostname=$hostname;
		$this->usuario=$usuario;
		$this->password=$password;
		$this->base=$base;

		if(!$this->connect()){
			$this->error= mysqli_error($this->conexion);
			echo $this->error;
		}
		else{
			echo "Ready";
			mysqli_query("SET NAMES 'utf8'",$this.conexion);

		}
		
	}

	private function connect(){
		$this->conexion=mysqli_connect($this->hostname,$this->usuario,$this->password);
		if($this->conexion){
			mysqli_select_db($this->conexion,$this->base);
		}
		else{
			$this->error=mysqli_error();
			return false;
		}
	}
	public function filtrar($valor){
		$valor=stripcslashes($valor);
		$valor=ltrim($valor);
		$valor=rtrim($valor);
		return mysqli_real_escape_string($valor);
	}
	public function enviarQuery($query){
		$tipo=strtoupper(substr($query,0,6));
		switch ($tipo) {
			case 'SELECT':
				$resultado=mysqli_query($this->conexion,$query);
				if(!$resultado){
					$this->error=mysqli_error($this->conexion);
				}
				else{
					if(mysqli_num_rows($resultado)==0){
						return false;
					}
					else{
						while($f=mysqli_fetch_assoc($resultado)){
							$r[]=$f;
						}
						mysqli_free_result($resultado);
						return $r;
					}
				}
				break;
			case 'INSERT':
				$resultado=mysqli_query($this->conexion,$query);
				if(!$resultado){
					$this->error=mysqli_error();
				}
				else{
					return mysqli_insert_id();
				}
				break;
			case 'DELETE':
				case 'UPDATE':
					$resultado=mysqli_query($this->conexion,$query);
					if(!$resultado){
						$this->error=mysqli_error();
					}
					else{
						$resultado=mysqli_affected_rows();
					}
					break;
			default:
				$this->error="Tipo de consulta no permitida";
				break;
		}
	}
	public function _destruct(){
		@mysqli_close($this->conexion);
	}

}
?>