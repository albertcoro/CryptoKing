<?php   
   $result = mysqli_query($db,"select crypto_id, round(difference,2) as difference from CryptoHistory where crypto_id=5 or crypto_id=6 or crypto_id=2 group by crypto_id;");
   $neu_crypto_ids = array();
   $neu_crypto_diff = array();
   $neu_crypto_abrev = array();
   $neu_crypto_full = array();
   $neu_crypto_price = array();
   $neu_crypto_last = array();
   $i = 0;

    while ($row = mysqli_fetch_assoc($result)){
      $id = $row['crypto_id'];
      array_push($neu_crypto_ids,$row['crypto_id']);
      array_push($neu_crypto_diff,$row['difference']);
      $i++;
      $res_q2 = mysqli_query($db,"select abreviated_name,fullname,current_price,last_update from crypto where id='$id';");
      $row_crypto = mysqli_fetch_array($res_q2,MYSQLI_ASSOC);
   
      array_push($neu_crypto_abrev,$row_crypto['abreviated_name']);
      array_push($neu_crypto_full,$row_crypto['fullname']);
      array_push($neu_crypto_price,$row_crypto['current_price']);
      array_push($neu_crypto_last,$row_crypto['last_update']);
    }
   
?>