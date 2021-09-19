<?php   
  $result = mysqli_query($db,"select C.abreviated_name as 'Abreviated Name',C.fullname as 'Full Name',C.current_price as 'Current Evaluation'".
  ",C.last_update as 'Last Update',round(difference,2) as 'Price Variation' from CryptoHistory as CH left join Crypto as C on CH.crypto_id=C.id group by C.id order by CH.difference limit 15;");
  $table = '<table class="display_table"><tbody><tr>';
  while ($property = mysqli_fetch_field($result)) $table .= '<th style="font-weight: bold;">'.$property->name.'</th>';
  $table .= '</tr>';
  while($row = mysqli_fetch_array($result)){   
    $table .= "<tr class='table_line'>";
    $table .= "<td><img class='mini_trend_icons' src='./media/crypto/".$row['Abreviated Name'].".png'>" . $row['Abreviated Name'] . "</td>";
    $table .= "<td>" . $row['Full Name'] . "</td><td>" . $row['Current Evaluation'] . "</td><td>" . $row['Last Update'] . "</td>";
    if((int)$row["Price Variation"]>0){
      $table .= "<td style='color: greenyellow;'><img class='mini_trend_icons' src='./media/icons/trendup.png'>" . $row['Price Variation'] . "</td>";
    } else if((int)$row["Price Variation"]<0){
      $table .= "<td style='color: red;'><img class='mini_trend_icons' src='./media/icons/trenddown.png'>" . $row['Price Variation'] . "</td>";
    } else {
      $table .= "<td style='color: rgb(79, 210, 243);'><img class='mini_trend_icons' src='./media/icons/trendneutral.png'>" . $row['Price Variation'] . "</td>";
    }
    
    $table .= "</tr>";  
  }
  $table .= '</tbody></table>';
?>