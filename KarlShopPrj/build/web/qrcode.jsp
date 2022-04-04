
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html class="no-js" lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Thanh toán</title>
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
        <div class="off_canvars_overlay"></div>
        <jsp:include page="layout/menu.jsp"/>

        <!--error section area start-->
        <div class="error_section">
            <div class="container">   
                <div class="row">
                    <div class="col-12">
                        <div class="error_form">
                            <h2 class="text-center text-dark">Pay the bill: #${bill.bill_id}!</h2>
                            <h4 class="text-center">Total bill: ${total} VND</h4>
                            <h4 class="text-center">Please send with note: </h4>
                            <h5 class="text-center" style="color: red">" Reid shop bill #${bill.bill_id} "</h5>
                            <h6 class="text-center">We will check and notify you when the payment is complete!</h6>
                            <div class="text-center">
                                <iframe style="align-content: center;"height="650px" width="450px" src="https://nhantien.momo.vn/0378387188/${total}"></iframe>
                            </div>
                            <a href="home">Continue to purchase</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--error section area end--> 
        <!--footer area start-->
        <jsp:include page="layout/footer.jsp"/>
        <!--footer area end-->

        <!--map js code here-->
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAdWLY_Y6FL7QGW5vcO3zajUEsrKfQPNzI"></script>
        <script  src="https://www.google.com/jsapi"></script>
        <script src="assets/js/map.js"></script>

        <!-- Plugins JS -->
        <script src="assets/js/plugins.js"></script>

        <!-- Main JS -->
        <script src="assets/js/main.js"></script>



    </body>

</html>