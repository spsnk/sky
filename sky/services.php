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
                <h1 class="page-header">Servicios
                    <small>Paquetes</small>
                </h1>
                <ol class="breadcrumb">
                    <li><a href="index.php">Home</a>
                    </li>
                    <li class="active">Servicios</li>
                </ol>
            </div>
        </div>
        <!-- /.row -->

        <!-- Image Header -->
        <div class="row">
            <div class="col-lg-12">
                <img class="img-responsive" src="./sky/experiencia.png" style="height: 300px; width: 1200px;" alt="">
            </div>
        </div>
        <!-- /.row -->

        <!-- Service Panels -->
        <!-- The circle icons use Font Awesome's stacked icon classes. For more information, visit http://fontawesome.io/examples/ -->
        <div class="row">
            <div class="col-lg-12">
                <h2 class="page-header">Servicios</h2>
            </div>
           
        <?php
        $Insta=getquery("SELECT * from servicio  where idServicio=5;");

            foreach ($Insta as $value) {
               echo '
                <div class="col-md-3 col-sm-6">
                <div class="panel panel-default text-center">
                    <div class="panel-heading">
                        <span class="fa-stack fa-5x">
                              <i class="fa fa-circle fa-stack-2x text-primary"></i>
                              <i class="fa fa-tree fa-stack-1x fa-inverse"></i>
                        </span>
                    </div>
                    <div class="panel-body">
                        <h4>'.$value["Nombre"].'</h4>
                        <p>'.$value["Descripcion"].'</p>
                        <a href="#service-one" class="btn btn-primary">Saber mas</a>
                    
          
                    </div>
                    </div>
                    </div>
                    ';}
                    ?>
                    <!--Segundo-->
                    <?php
        $Insta=getquery("SELECT * from servicio  where idServicio=2;");

            foreach ($Insta as $value) {
               echo '
                <div class="col-md-3 col-sm-6">
                <div class="panel panel-default text-center">
                    <div class="panel-heading">
                        <span class="fa-stack fa-5x">
                              <i class="fa fa-circle fa-stack-2x text-primary"></i>
                              <i class="fa fa-tree fa-stack-1x fa-inverse"></i>
                        </span>
                    </div>
                    <div class="panel-body">
                        <h4>'.$value["Nombre"].'</h4>
                        <p>'.$value["Descripcion"].'</p>
                       
                    
          
                    </div>
                    </div>
                    </div>
                    ';}
                    ?>
                    <!--Tercero-->
                    <?php
        $Insta=getquery("SELECT * from servicio  where idServicio=3;");

            foreach ($Insta as $value) {
               echo '
                <div class="col-md-3 col-sm-6">
                <div class="panel panel-default text-center">
                    <div class="panel-heading">
                        <span class="fa-stack fa-5x">
                              <i class="fa fa-circle fa-stack-2x text-primary"></i>
                              <i class="fa fa-tree fa-stack-1x fa-inverse"></i>
                        </span>
                    </div>
                    <div class="panel-body">
                        <h4>'.$value["Nombre"].'</h4>
                        <p>'.$value["Descripcion"].'</p>
                       
          
                    </div>
                    </div>
                    </div>
                    ';}
                    ?>
                    <!--Cuarto-->
                    <?php
        $Insta=getquery("SELECT * from servicio  where idServicio=4;");

            foreach ($Insta as $value) {
               echo '
                <div class="col-md-3 col-sm-6">
                <div class="panel panel-default text-center">
                    <div class="panel-heading">
                        <span class="fa-stack fa-5x">
                              <i class="fa fa-circle fa-stack-2x text-primary"></i>
                              <i class="fa fa-tree fa-stack-1x fa-inverse"></i>
                        </span>
                    </div>
                    <div class="panel-body">
                        <h4>'.$value["Nombre"].'</h4>
                        <p>'.$value["Descripcion"].'</p>
                      
                    
          
                    </div>
                    </div>
                    </div>
                    ';}
                    ?>
        <!-- Service Tabs -->
        <div class="row">
            <div class="col-lg-12">
                <h2 class="page-header">Descripci&oacute;n del Servicio</h2>
            </div>
            <div class="col-lg-12">

                <ul id="myTab" class="nav nav-tabs nav-justified">
                    <li class="active"><a href="#service-one" data-toggle="tab"><i class="fa fa-tree"></i> Instalaci&oacute;n</a>
                    </li>
                    
                </ul>

                <div id="myTabContent" class="tab-content">
                     <div class="tab-pane fade active in" id="service-one">
                        <h4>Instalaci&oacute;n</h4>
                       <?php
                       $paque=getquery("SELECT * from paquete;");

            foreach ($paque as $value) {
               echo '
                        <p>*'.$value["Nombre"].'<br/>'.$value["Renta"].'</p>
                        <p style=height:30px;>'.$value["descripcion"].'</p>
                   ';
                }

                    ?>
 <a href="portfolio-3-col.php" class="btn btn-primary">Conocer canales</a> 
                    </div>
                    <div class="tab-pane fade" id="service-two">
                        <h4>Paquetes</h4>
                        <?php
                        $canal=getquery(";")
                        ?>

                                           <p></p>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quae repudiandae fugiat illo cupiditate excepturi esse officiis consectetur, laudantium qui voluptatem. Ad necessitatibus velit, accusantium expedita debitis impedit rerum totam id. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Natus quibusdam recusandae illum, nesciunt, architecto, saepe facere, voluptas eum incidunt dolores magni itaque autem neque velit in. At quia quaerat asperiores.</p>
                    </div>
                    <div class="tab-pane fade" id="service-three">
                        <h4>Service Three</h4>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quae repudiandae fugiat illo cupiditate excepturi esse officiis consectetur, laudantium qui voluptatem. Ad necessitatibus velit, accusantium expedita debitis impedit rerum totam id. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Natus quibusdam recusandae illum, nesciunt, architecto, saepe facere, voluptas eum incidunt dolores magni itaque autem neque velit in. At quia quaerat asperiores.</p>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quae repudiandae fugiat illo cupiditate excepturi esse officiis consectetur, laudantium qui voluptatem. Ad necessitatibus velit, accusantium expedita debitis impedit rerum totam id. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Natus quibusdam recusandae illum, nesciunt, architecto, saepe facere, voluptas eum incidunt dolores magni itaque autem neque velit in. At quia quaerat asperiores.</p>
                    </div>
                    <div class="tab-pane fade" id="service-four">
                        <h4>Service Four</h4>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quae repudiandae fugiat illo cupiditate excepturi esse officiis consectetur, laudantium qui voluptatem. Ad necessitatibus velit, accusantium expedita debitis impedit rerum totam id. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Natus quibusdam recusandae illum, nesciunt, architecto, saepe facere, voluptas eum incidunt dolores magni itaque autem neque velit in. At quia quaerat asperiores.</p>
                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quae repudiandae fugiat illo cupiditate excepturi esse officiis consectetur, laudantium qui voluptatem. Ad necessitatibus velit, accusantium expedita debitis impedit rerum totam id. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Natus quibusdam recusandae illum, nesciunt, architecto, saepe facere, voluptas eum incidunt dolores magni itaque autem neque velit in. At quia quaerat asperiores.</p>
                    </div>
                </div>

            </div>
        </div>

        <!-- Service List -->
        <!-- The circle icons use Font Awesome's stacked icon classes. For more information, visit http://fontawesome.io/examples/ -->
        <div class="row">
            <div class="col-lg-12">
                <h2 class="page-header">Servicios</h2>
            </div>
            <div class="col-md-4">
                <div class="media">
                    <div class="pull-left">
                        <span class="fa-stack fa-2x">
                              <i class="fa fa-circle fa-stack-2x text-primary"></i>
                              <i class="fa fa-tree fa-stack-1x fa-inverse"></i>
                        </span> 
                    </div>

                    <?php
        $Servi=getquery("SELECT * from servicio ;");

            foreach ($Servi as $value) {
               echo '<div class="media-body">
                        <h4 class="media-heading">'.$value["Nombre"].'</h4>
                        <p>'.$value["Descripcion"].'</p><p style="
    margin-left: 200px;
">'.$value["Costo"].'</p>
                    
                </div>
                <div class="media">
                    <div class="pull-left">
                        <span class="fa-stack fa-2x">
                              <i class="fa fa-circle fa-stack-2x text-primary"></i>
                              <i class="fa fa-car fa-stack-1x fa-inverse"></i>
                        </span> 
                    </div></div>   ';
            }
      
            ?> 
                  
             </div>  
             </div>  
             </div>
             

        <!-- /.row -->

        <hr>

        <!-- Footer -->
        <footer>
            <div class="row">
                <div class="col-lg-12">
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
