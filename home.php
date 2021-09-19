<?php
   include('sessionSQL.php');
   include('trendingcryptosSQL.php');
?>
<html>
	<head>
		<title> Crypto King </title>
		<link rel="stylesheet" href="style.css">
		<link rel="icon" type="image/x-icon" href="./media/favicon/favicon-32.png"/>
	</head>
	<body>
		<div class="top_pane">
			<div class="top_left_pane">
				<a href="home.html">
					<img src="media/Name.PNG" class="main_title"/>
				</a>
			</div>
			<div class="top_right_pane">
				<text>
					Welcome, <?php echo $login_session; ?> <br>
					Your balance: <?php echo $wallet_bal; ?> $
				</text>
			</div>
		</div>
		<div class="left_pane">
			<a href="home.php">
				<div class="main_menu_item main_menu_item_selected">
					<img class="icon" src="media/icons/home.png"/>
					<text> Home </text>
				</div>
			</a>
			<a href="market.php">
				<div class="main_menu_item">
					<img class="icon" src="media/icons/market.png"/>
					<text> Market </text>
				</div>
			</a>
			<a href="traders.php">
				<div class="main_menu_item">
					<img class="icon" src="media/icons/trader.png"/>
					<text> Traders </text>
				</div>
			</a>
			<a href="mywallet.php">
				<div class="main_menu_item">
					<img class="icon" src="media/icons/wallet.png"/>
					<text> My Wallet </text>
				</div>
			</a>
			<a href="mytransactions.php">
				<div class="main_menu_item">
					<img class="icon" src="media/icons/money-transaction.png"/>
					<text> My Transactions </text>
				</div>
			</a>
			<a href="myinventory.php">
				<div class="main_menu_item">
					<img class="icon" src="media/icons/inventory.png"/>
					<text> My Inventory </text>
				</div>
			</a>
			<a href="configuration.php">
				<div class="main_menu_item">
					<img class="icon" src="media/icons/configuration.png"/>
					<text> Configuration </text>
				</div>
			</a>
			<a href="logout.php">
				<div class="main_menu_item">
					<img class="icon" src="media/icons/logout.png"/>
					<text> Log Out </text>
				</div>
			</a>
		</div>
		<div class="middle_pane">
			<div class="display_holder">
				<div class="station_title"> Upward Trending Cryptos </div>
			</div>
			<div class="display_holder">
				<div class="display_station">
					<div class="display_title">
						<?php 
							echo $up_crypto_full[0]." (".$up_crypto_abrev[0].")"; 
						?>
					</div>
					<div class="display_diff_up">
						<img class="trend_icons" src="./media/icons/trendup.png">
						<?php 
							echo $up_crypto_diff[0]."%";
						?>
					</div>
				</div>
				<div class="display_station">
					<div class="display_title">
						<?php 
							echo $up_crypto_full[1]." (".$up_crypto_abrev[1].")"; 
						?>
					</div>
					<div class="display_diff_up">
						<img class="trend_icons" src="./media/icons/trendup.png">
						<?php 
							echo $up_crypto_diff[1]."%";
						?>
					</div>
				</div>
				<div class="display_station">
					<div class="display_title">
						<?php 
							echo $up_crypto_full[2]." (".$up_crypto_abrev[2].")"; 
						?>
					</div>
					<div class="display_diff_up">
						<img class="trend_icons" src="./media/icons/trendup.png">
						<?php 
							echo $up_crypto_diff[2]."%";
						?>
					</div>
				</div>
			</div>
			<div class="display_holder">
				<div class="station_title"> Downward Trending Cryptos </div>
			</div>
			<div class="display_holder">
				<div class="display_station">
					<div class="display_title">
						<?php 
							echo $down_crypto_full[0]." (".$down_crypto_abrev[0].")"; 
						?>
					</div>
					<div class="display_diff_down">
						<img class="trend_icons" src="./media/icons/trenddown.png">
						<?php 
							echo $down_crypto_diff[0]."%";
						?>
					</div>
				</div>
				<div class="display_station">
					<div class="display_title">
						<?php 
							echo $down_crypto_full[1]." (".$down_crypto_abrev[1].")"; 
						?>
					</div>
					<div class="display_diff_down">
						<img class="trend_icons" src="./media/icons/trenddown.png">
						<?php 
							echo $down_crypto_diff[1]."%";
						?>
					</div>
				</div>
				<div class="display_station">
					<div class="display_title">
						<?php 
							echo $down_crypto_full[2]." (".$down_crypto_abrev[2].")"; 
						?>
					</div>
					<div class="display_diff_down">
						<img class="trend_icons" src="./media/icons/trenddown.png">
						<?php 
							echo $down_crypto_diff[2]."%";
						?>
					</div>
				</div>
			</div>
			<div class="display_holder">
				<div class="station_title"> Neutral Trending Cryptos </div>
			</div>
			<div class="display_holder">
				<div class="display_station">
					<div class="display_title">
						<?php 
							echo $neu_crypto_full[0]." (".$neu_crypto_abrev[0].")"; 
						?>
					</div>
					<div class="display_diff_neu">
						<img class="trend_icons" src="./media/icons/trendneutral.png">
						<?php 
							echo $neu_crypto_diff[0]."%";
						?>
					</div>
				</div>
				<div class="display_station">
					<div class="display_title">
						<?php 
							echo $neu_crypto_full[1]." (".$neu_crypto_abrev[1].")"; 
						?>
					</div>
					<div class="display_diff_neu">
						<img class="trend_icons" src="./media/icons/trendneutral.png">
						<?php 
							echo $neu_crypto_diff[1]."%";
						?>
					</div>
				</div>
				<div class="display_station">
					<div class="display_title">
						<?php 
							echo $neu_crypto_full[2]." (".$neu_crypto_abrev[2].")"; 
						?>
					</div>
					<div class="display_diff_neu">
						<img class="trend_icons" src="./media/icons/trendneutral.png">
						<?php 
							echo $neu_crypto_diff[2]."%";
						?>
					</div>
				</div>
			</div>
			<div class="display_holder">
				<div class="station_title"> What do i do? </div>
			</div>
			<div class="display_holder">
				<div class="display_zone">
					<div class="display_info">
						Keep track of famous cryptos in the <a href="./home.php">Home</a> Tab. <br>
						Find new Cryptos and new oportunities in the <a href="./market.php">Market</a> Tab. <br>
						The <a href="./traders.php">Traders</a> Tab will allow you to look at other traders in this platform. <br>
						Make sure to check the <a href="./traders.php">Wallet</a> tab, to look at your earnings, incomes and expenses. <br>
						To keep track of your past financial transactions, head over to the <a href="./traders.php">Transactions</a> tab. <br>
						Keep track of your positions and your investments in the <a href="./myinventory.php">Inventory</a> Tab. <br>
						Remember that you can customize your experience at the <a href="./configuration.php">Configuration</a> Tab. <br>
						If you have any doubts or any feedback about the platform contact us at <a href="mailto:info@cryptoking.com">info@cryptoking.com</a><br>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>