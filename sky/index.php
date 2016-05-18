
<?php
        include("./barra.html");
    ?>
    
<header id="myCarousel" class="carousel slide">
        <!-- Indicators -->
        <ol class="carousel-indicators">
            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
            <li data-target="#myCarousel" data-slide-to="1"></li>
            <li data-target="#myCarousel" data-slide-to="2"></li>
        </ol>

        <!-- Wrapper for slides -->
        <div class="carousel-inner">
            <div class="item active">
                <div class="fill" style="background-image:url('./sky/mejor.png' );width:700px; margin:auto;"></div>
                <div class="carousel-caption" >
                   
                </div>
            </div>
            <div class="item">
                <div class="fill" style="background-image:url('./sky/nuevo.png' );width:900px; margin:auto;"></div>
                <div class="carousel-caption" >
                    
                </div>
            </div>
            <div class="item">
                <div class="fill" style="background-image:url('./sky/diver.png');width:11ss00px; margin:auto;"></div>
                <div class="carousel-caption" >
                   
                </div>
            </div>
        </div>

        <!-- Controls -->
        <a class="left carousel-control" href="#myCarousel" data-slide="prev">
            <span class="icon-prev"></span>
        </a>
        <a class="right carousel-control" href="#myCarousel" data-slide="next">
            <span class="icon-next"></span>
        </a>
    </header>

    <!-- Page Content -->
    <div class="container">

        <!-- Marketing Icons Section -->
        <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">
                    Experiencia SKY
                </h1>
            </div>
            <div class="col-md-4">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4><i class="fa fa-fw fa-check"></i> Cualidades y Beneficios</h4>
                    </div>
                    <div class="panel-body">
                        <p>Conoce lo que necesitas para disfrutar la más variada programación, con la mejor calidad en imagen y el mejor sonido.
                        <br/>
                        <img src="./sky/pantalla.jpg" style=" width: 300px;">
                        </p>
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4><i class="fa fa-fw fa-gift"></i> ¿Qué es Alta Definición?</h4>
                    </div>
                    <div class="panel-body">
                        <p>Si quieres disfrutar de la mayor cobertura de entretenimiento y deportes en Alta Definición Total, contrata cualquiera de nuestros paquetes: FUN, FOX+, HBO/MAX o UNIVERSE.
                        <br/>
                         <img src="./sky/alta.png">
                        </p>
                       
                    </div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4><i class="fa fa-fw fa-compass"></i> Equipos de Alta Definición</h4>
                    </div>
                    <div class="panel-body">
                        <p>Si deseas una verdadera experiencia en Alta Definición, tienes que contratar alguno de los dos equipos que tenemos disponibles para ti y que cuentan con la tecnología de Alta definición.
                        <br/>
                          <img src="./sky/equipos.png" style=" width: 300px;">

                        </p>
                        
                    </div>
                </div>
            </div>
        </div>
        <!-- /.row -->

        <!-- Portfolio Section -->
        <div class="row">
            <div class="col-lg-12">
                <!--h2 class="page-header">Portfolio Heading</h2-->
                <img src="./sky/paquete.jpg">
            </div>
            <div class="col-md-4 col-sm-6">
                <a href="portfolio-item.html">
                    <img class="img-responsive img-portfolio img-hover" src="./sky/residencias.png"  style="height: 450px; width: 700px;" alt="">
                </a>
            </div>
            <div class="col-md-4 col-sm-6">
                <a href="portfolio-item.html">
                    <img class="img-responsive img-portfolio img-hover" src="./sky/bares.png" style="height: 450px; width: 700px;"alt="">
                </a>
            </div>
            <div class="col-md-4 col-sm-6">
                <a href="portfolio-item.html">
                    <img class="img-responsive img-portfolio img-hover" src="./sky/hoteles.png" style="height: 450px; width: 700px;"alt="">
                </a>
            </div>
            <div class="col-md-4 col-sm-6">
                <a href="portfolio-item.html">
                    <img class="img-responsive img-portfolio img-hover" src="./sky/destacados.png" style="height: 450px; width: 700px;" alt="">
                </a>
            </div>
            <div class="col-md-4 col-sm-6">
                <a href="portfolio-item.html">
                    <img class="img-responsive img-portfolio img-hover" src="./sky/nba-embajada.jpg"  style="height: 450px; width: 700px;" alt="">
                </a>
            </div>
            <div class="col-md-4 col-sm-6">
                <a href="portfolio-item.html">
                    <img class="img-responsive img-portfolio img-hover" src="./sky/skyview.jpg"   style="height: 450px; width: 700px;" alt="">
                </a>
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

    <!-- Script to Activate the Carousel -->
    <script>
    $('.carousel').carousel({
        interval: 5000 //changes the speed
    })
    </script>

</body>

</html>
