<?php
   include('sessionSQL.php');
   include('cryptoSQL.php');
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
				<div class="main_menu_item">
					<img class="icon" src="media/icons/home.png"/>
					<text> Home </text>
				</div>
			</a>
			<a href="market.php">
				<div class="main_menu_item main_menu_item_selected">
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
				<div class="station_title"> Market </div>
			</div>
			<div class="display_holder">
				
				<?php
					echo $table;
				?>
				<script type="text/javascript">
					
					const getCellValue = (tr, idx) => tr.children[idx].innerText || tr.children[idx].textContent;

					const comparer = (idx, asc) => (a, b) => ((v1, v2) => 
						v1 !== '' && v2 !== '' && !isNaN(v1) && !isNaN(v2) ? v1 - v2 : v1.toString().localeCompare(v2)
						)(getCellValue(asc ? a : b, idx), getCellValue(asc ? b : a, idx));

					// do the work...
					document.querySelectorAll('th').forEach(th => th.addEventListener('click', (() => {
						const table = th.closest('table');
						Array.from(table.querySelectorAll('tr:nth-child(n+2)'))
							.sort(comparer(Array.from(th.parentNode.children).indexOf(th), this.asc = !this.asc))
							.forEach(tr => table.appendChild(tr) );
					})));
    
				</script>
			</div>
		</div>
	</body>
</html>