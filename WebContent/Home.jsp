<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLenY2dmCWGMq91rCGa5gtU4mk92HdvYeMSXH301p5ILydN9nJOZ" crossorigin="anonymous">
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css">
</head>
<body>
    <!-- Main Navigation -->
    <nav class="navbar bg-body-tertiary" style="padding-top: 0;">
        <div class="container-fluid" style="float: left;">
            <a class="navbar-brand" href="#">
                <img src="images/logo13.png" alt="Logo" width="250px" height="70px" class="d-inline-block align-text-top">
            </a>
            <h4 style="padding-top: .8;"><span style="color: darkblue;">Secure Your </span><span style="color: crimson; font-family: Lucida Handwriting, cursive;">Future</span></h4>
        </div>
    </nav>

    <!-- Navigation Menu -->
    <nav class="navbar navbar-expand-lg bg-body-tertiary bg-dark" style="margin-top: 0px;" data-bs-theme="dark">
        <div class="container-fluid">
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarText">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="main.jsp" style="text-decoration:none;" target="frmHome">Home</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">Login</a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <li><a class="dropdown-item" href="Admin.jsp" target="frmAdmin">Admin Login</a></li>
                            <li><a class="dropdown-item" href="UserLogin.jsp" target="frmUser">User Login</a></li>
                        </ul>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="ContactUs.jsp" style="text-decoration:none;" target="frmContact">Contact Us</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <center>
        <nav class="navbar navbar-expand-lg bg-body-tertiary bg-dark" style="margin-top: 0px;" data-bs-theme="dark">
            <div class="container-fluid">
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
            </div>
        </nav>
    </center>

    <iframe name="frm" width="100%" height="100%" style="border: none;" src="main.jsp"></iframe>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
</body>
</html>
