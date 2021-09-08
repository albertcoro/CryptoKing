<?php   
   $result = mysqli_query($db,"select crypto_id, difference from CryptoHistory where difference!=100 group by crypto_id order by difference DESC Limit 3;");
   $crypto_ids = array();
   $crypto_diffs = array();
   $crypto_abrev = array();
   $crypto_full = array();
   $crypto_price = array();
   $crypto_last = array();
   $i = 0;

    while ($row = mysqli_fetch_assoc($result)){
      $id = $row['crypto_id'];
      array_push($crypto_ids,$row['crypto_id']);
      array_push($crypto_diffs,$row['difference']);
      $i++;
      $res_q2 = mysqli_query($db,"select abreviated_name,fullname,current_price,last_update from crypto where id='$id';");
      $row_crypto = mysqli_fetch_array($res_q2,MYSQLI_ASSOC);
   
      array_push($crypto_abrev,$row_crypto['abreviated_name']);
      array_push($crypto_full,$row_crypto['fullname']);
      array_push($crypto_price,$row_crypto['current_price']);
      array_push($crypto_last,$row_crypto['last_update']);
    }
   
?>