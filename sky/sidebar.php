
<?php
        include("./barra.html");
    ?>
    <?php
  require_once("Funciones/init.php");
?>

<body>

    
 

    <!-- Page Content -->
    <div class="container">

        <!-- Page Heading/Breadcrumbs -->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Canales
                    <small></small>
                </h1>
                <ol class="breadcrumb">
                    <li><a href="index.php">Home</a>
                    </li>
                    <li class="active">Canales</li>
                </ol>
            </div>
        </div>
        <!-- /.row -->

        <!-- Content Row -->
        <div class="row">
            <!-- Sidebar Column -->
            <div class="col-md-3">
                <div class="list-group">
                 <a href="#cuenta" class="list-group-item">Numero de Cuenta</a>
                    <a href="#" class="list-group-item">Nombre</a>
                    <a href="about.html" class="list-group-item">CP</a>
                    <a href="services.html" class="list-group-item">Colonia</a>
                    
                </div>
            </div>
            <!-- Content Column -->
            <div class="col-md-9">
              <div id="myTabContent" class="tab-content">
                     <div class="tab-pane fade active in" id="service-one">
                         <h2>Todos los canales</h2>
                <table border="2">
               		<tr>
               			<td align="center">Nombre Canal</td>
               			<td align="center">Descripción</td>
               			<td align="center">Logo</td>
               			
               		</tr>
                           <?php
                       $cliente=getquery("SELECT * from canal;");
                       
            foreach ($cliente as $value) {
               echo '
              	<div id=cuenta>

               			<tr>
               			
               			<td align="center">'.$value["Nombre"].'</td>
               			<td align="center">'.$value["Descripcion"].'</td>
               			<td align="center"><img src="img/channel/'.$value["logo"].'"class="img-responsive" style="width:100px;" ></td>
               		
               		</tr>
                      </div>
                    ';
                }

                    ?>
                </table>
            </div>
        </div>
       </div>
       </div>
       

        <!-- /.row -->

        <hr>

        <!-- Footer -->
        <footer>
            <div class="row">
                <div class="col-lg-12">
                    <p>Copyright &copy; Your Website 2014</p>
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
