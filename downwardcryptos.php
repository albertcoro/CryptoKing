<?php   
   $result = mysqli_query($db,"select crypto_id, round(difference,2) as difference from CryptoHistory where difference!=100 group by crypto_id order by difference ASC Limit 3;");
   $down_crypto_ids = array();
   $down_crypto_diff = array();
   $down_crypto_abrev = array();
   $down_crypto_full = array();
   $down_crypto_price = array();
   $down_crypto_last = array();
   $i = 0;

    while ($row = mysqli_fetch_assoc($result)){
      $id = $row['crypto_id'];
      array_push($down_crypto_ids,$row['crypto_id']);
      array_push($down_crypto_diff,$row['difference']);
      $i++;
      $res_q2 = mysqli_query($db,"select abreviated_name,fullname,current_price,last_update from crypto where id='$id';");
      $row_crypto = mysqli_fetch_array($res_q2,MYSQLI_ASSOC);
   
      array_push($down_crypto_abrev,$row_crypto['abreviated_name']);
      array_push($down_crypto_full,$row_crypto['fullname']);
      array_push($down_crypto_price,$row_crypto['current_price']);
      array_push($down_crypto_last,$row_crypto['last_update']);
    }
   
?>