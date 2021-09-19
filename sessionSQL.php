<?php
   include('configSQL.php');
   session_start();
   
   $user_check = $_SESSION['login_user'];
   
   $ses_sql = mysqli_query($db,"select * from userclient where nickname = '$user_check' ");
   
   $row_ses = mysqli_fetch_array($ses_sql,MYSQLI_ASSOC);
   
   $login_session = $row_ses['fullname'];
   $id = $row_ses['id'];

   $wallet_sql = mysqli_query($db,"select * from wallet where user_id = '$id' ");
   $row_wal = mysqli_fetch_array($wallet_sql,MYSQLI_ASSOC);
   $wallet_bal = $row_wal['current_balance'];
   
   if(!isset($_SESSION['login_user'])){
      header("location:login.php");
      die();
   }
?>