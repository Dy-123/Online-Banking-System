<?php
session_start();
error_reporting(0);
date_default_timezone_set('Asia/Kolkata');
$dt= date("Y-m-d");
$dttim= date("Y-m-d h:i:s");
include("dbconnection.php");
if(isset($_SESSION['customer_id']))
{
	$sqlcustomer = "SELECT * FROM customer where customer_id='$_SESSION[customer_id]'";
	$qsqlcustomer = mysqli_query($con,$sqlcustomer);
	$rscustomer = mysqli_fetch_array($qsqlcustomer);
}
if(isset($_SESSION['emp_id']))
{
	$sqlemployee = "SELECT * FROM employee where emp_id='$_SESSION[emp_id]'";
	$qsqlemployee = mysqli_query($con,$sqlemployee);
	$rsemployee = mysqli_fetch_array($qsqlemployee);
}
?>
<!DOCTYPE html>
<head>
  <meta charset="utf-8">
  <!--[if IE]><meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"><![endif]-->
  <title> Online Banking - Online Money Bank</title>
  <meta name="keywords" content="" />
  <meta name="description" content="" />
  <meta name="viewport" content="width=device-width">
  <link rel="stylesheet" href="css/templatemo_main.css">
  </head>
<body>
<div  class="navbar navbar-inverse" role="navigation" style="background-color:inherit">
<div class="navbar-header">
    <div class="logo" >
	<img src="images/logo.png" height="75px;">
	</div> 
         
    
    
<?php
 if(isset($_SESSION['customer_id']))
{
?>   
    <div style="position: absolute;right: 0px; bottom:0px; width: 450px;border: 1px;color: #FF0; padding: 14px;" >
    <b style="text-align:right">  &nbsp; &nbsp;<font color="#FFFF00"> Welcome <?php echo $rscustomer['first_name'] . " " . $rscustomer['last_name']; ?></font></b>
         &nbsp; &nbsp;  <a href="customerprofile.php"><strong><font color="#FFFF00">Profile</strong></font></a>        
         &nbsp; &nbsp;  <a href="logout.php"><strong><font color="#FFFF00">Logout</font></strong></a>        
    </div>
<?php
}
?>
<?php
 if(isset($_SESSION['emp_id']))
{
?>   
    <div style="position: absolute;right: 0px; bottom:0px; width: 450px;border: 1px ;color: #FF2F00; padding: 14px; " >
    <b style="text-align:right">  &nbsp; &nbsp; Welcome <?php echo $rsemployee['emp_name']; ?></b>
         &nbsp; &nbsp;  <a href="empprofile.php" style="color: #FF2F00; padding: 14px; "><strong>Profile</strong></a>        
         &nbsp; &nbsp;  <a href="logout.php" style="color: #FF2F00; padding: 14px;" ><strong>Logout</strong></a>        
    </div>
<?php
}
?>
    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse"> <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
  </div>

<div style="text-align:left"></div>
</div>
