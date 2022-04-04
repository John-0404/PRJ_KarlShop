
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html class="no-js" lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>About us page</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Favicon -->
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">
        <link rel = "icon" href = "assets\img\logo\minilogo.png"  type = "image/x-icon">

        <!-- CSS 
        ========================= -->

        <!-- Plugins CSS -->
        <link rel="stylesheet" href="assets/css/plugins.css">

        <!-- Main Style CSS -->
        <link rel="stylesheet" href="assets/css/style.css">
    </head>

    <body>

        <!-- Main Wrapper Start -->
        <!--Offcanvas menu area start-->
        <div class="off_canvars_overlay"></div>
        <jsp:include page="layout/menu.jsp"/>
        <!--breadcrumbs area start-->
        <div class="breadcrumbs_area other_bread">
            <div class="container">   
                <div class="row">
                    <div class="col-12">
                        <div class="breadcrumb_content">
                            <ul>
                                <li><a href="index.html">Home</a></li>
                                <li>/</li>
                                <li>About us</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>         
        </div>
        <!--breadcrumbs area end-->

        <!--about section area -->
        <div class="about_section">
            <div class="container">  
                <div class="row">
                    <div class="col-lg-6 col-md-12">
                        <div class="about_content">
                            <h1>Welcome to The Karl Fashion!</h1>
                            <p> Born in 2014, The Karl Fashion brand defines the mission of helping boys become more beautiful with their own version. Today young men are standing the great opportunities of modern society, development of information technology, revolution of social networking sites to assert themselves.</p>
                            <p> In addition, The Karl Fashion understands that young people are also facing pressures and challenges to urge themselves to show themselves compared to others. </p>
                            <p> <b>You only live once - Be your self</b></p>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-12">
                        <div class="about_thumb">
                            <img src="assets/img/about/about5.jpg" alt="">
                        </div>
                    </div>
                </div>
            </div>     
        </div>
        <!--about section end-->

        <jsp:include page="layout/footer.jsp"/>

        <!-- JS
        ============================================ -->

        <!-- Plugins JS -->
        <script src="assets/js/plugins.js"></script>

        <!-- Main JS -->
        <script src="assets/js/main.js"></script>



    </body>

</html>