<?php
        include("./barra.html");
    ?>
 
<?php
  require_once("Funciones/init.php");
?>
  <!-- Page Content -->
    <div class="container">

        <!-- Page Heading/Breadcrumbs -->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Nosotros
                    <small>SKY</small>
                </h1>
                <ol class="breadcrumb">
                    <li><a href="index.php">Home</a>
                    </li>
                    <li class="active">Nosotros</li>
                </ol>
            </div>
        </div>
        <!-- /.row -->

        <!-- Intro Content -->
        <div class="row">
            <div class="col-md-6">
                <img class="img-responsive" src="./sky/skylogo.jpg" style="height: 450px; width: 700px;" alt="">
            </div>
            <div class="col-md-6">
                <h2>¿Quienes somos?</h2>
                <p>Innova, S. de R.L. de C.V., una sociedad mexicana de responsabilidad limitada y de capital variable, fue constituida el 25 de Julio de 1996 e inició sus servicios de TV de paga bajo el nombre comercial de “Sky” el 15 de Diciembre de 1996; mediante la transmisión digital de señales televisivas bajo la modalidad DTH (direct-to-home) vía satélite.</p>
                <p>La industria de la televisión en México surge a principios de los años 50, cuando el Gobierno Mexicano otorgó licencias para la operación de tres canales de televisión en la Ciudad de México. Estos tres primeros canales: 2, 4 y 5, indirectamente propiedad de Televisa. Desde entonces, el Gobierno Mexicano ha otorgado licencias adicionales para seis canales más en la Ciudad de México y múltiples más para la operación de diversos canales de televisión a lo largo del país. Los servicios de TV de paga satelital por banda Ku estuvieron disponibles por primera vez en México a finales de 1996.</p>
             
            </div>
        </div>
        <!-- /.row -->

        <!-- Team Members -->
        <div class="row">
            <div class="col-lg-12">
                <h2 class="page-header">Nuestro Equipo</h2>
            </div>
                                   
                    </div>
                </div>
            </div>
           
                    <?php
                    $Tecnico=getquery("SELECT * from empleado where tipo like 'T';");

                        foreach ($Tecnico as $value) {
                           echo ' <div class="col-md-4 text-center">
                <div class="thumbnail">
                    <img src="BD Sky/fotos/'.$value["foto"].'"class="img-responsive" style="width:100px;" >
                    <div class="caption"><h3>'.$value["nombre"].' '.$value["ap"].' '.$value["am"].'<br>
                        </h3>       
                    </div>
                </div>
            </div>' ;

                        }
            ?>     
            
           
        <!-- /.row -->
         <!-- Our Customers -->

        <div class="row">
            <div class="col-lg-12">
                <h2 class="page-header">Asistentes</h2>
            </div>
        <?php
        $Secre=getquery("SELECT * from empleado where tipo like 'A';");

            foreach ($Secre as $value) {
               echo '<div class="col-md-2 col-sm-4 col-xs-6">
                <img src="BD Sky/fotos/'.$value["foto"].' "class="img-responsive customer-img" >
            </div>';
            }
      
            ?> 
            
        <!-- /.row -->

        <hr>

        <!-- Footer -->
        <footer>
            <div class="row">

                <div class="col-lg-12">
                <br/>
                    <p>Copyright &copy; Bases de Datos 2016</p>
                </div>
            </div>
        </footer>

    </div>
    <!-- /.container -->

    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

</body>

</html>
