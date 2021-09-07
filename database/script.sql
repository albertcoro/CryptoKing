Drop database if exists CryptoKing;
Create database CryptoKing;
Use CryptoKing;

Drop table if exists UserClient;
Create table UserClient (
	id integer unique auto_increment not null,
    fullname varchar(50) not null,
    nickname varchar(50) not null,
    psswd_en varchar(90) not null,
    email_adress varchar(50) not null,
    creation_date date not null,
    crypt_key varchar(20),
    Primary Key(id)
);

Insert into UserClient(fullname, nickname,psswd_en,email_adress,creation_date) Values ("James Kyan","Kyan King","KingKing123","kking@gmail.com",current_date());
Insert into UserClient(fullname, nickname,psswd_en,email_adress,creation_date) Values ("Ace Gold","AceG","GoldGold222","agold@gmail.com",current_date());
Insert into UserClient(fullname, nickname,psswd_en,email_adress,creation_date) Values ("Richard New","Rnew","RichRich244","richrich@gmail.com",current_date());
Insert into UserClient(fullname, nickname,psswd_en,email_adress,creation_date) Values ("Drake Fly","DFly","DrakeDrake123","dfly@gmail.com",current_date());
Insert into UserClient(fullname, nickname,psswd_en,email_adress,creation_date) Values ("Byron Great","Bgreat","ByronGreat123","bgreat@gmail.com",current_date());
Insert into UserClient(fullname, nickname,psswd_en,email_adress,creation_date) Values ("Kumo Nikitai","KuKi","Kukilord123","kukilord@gmail.com",current_date());
update userclient set psswd_en="$2y$10$IePSPdwvOKy1yeVqL0EWmuWpiVtzn/AQF8nTBZgJZm4Ra1X82ds92" where id=1;
update userclient set psswd_en="$2y$10$7BLjs64nYS8Xt9uImfypZOkZtSoBO5EOZXYDONR9QXimpt7whokVG" where id=2;
update userclient set psswd_en="$2y$10$4Z7pGclJJ2ZvWRw9L2Y2renR94ASqWDRXjwP3qUBXwwaNoZWQDn3a" where id=3;
update userclient set psswd_en="$2y$10$WAlims2CwhzbrbIM7WfvYueOeQeT0GDnANsPRqNv9jQs9B6Ep4Cgq" where id=4;
update userclient set psswd_en="$2y$10$LCDq/awc8kZeHG/5y9SdKunTZ.fMLw/Uvd1tjMu.FkYzaAfqRkfPq" where id=5;
update userclient set psswd_en="$2y$10$KG9IomYn/aFarINN2Ym3CuuG5it15sW.LmClx8isQYdAofA8RtZ7y" where id=6;
update userclient set crypt_key="IAiEgIjeEJfCDtnqVgFP" where id=1;
update userclient set crypt_key="dWnzUdlFqtuQZisIILAs" where id=2;
update userclient set crypt_key="BSXLQMaRAXoQcaTFCWOi" where id=3;
update userclient set crypt_key="JYnxezFBydgLyUFYInbv" where id=4;
update userclient set crypt_key="wuDRaGAMbwPYfamYGtVH" where id=5;
update userclient set crypt_key="MhKOFDgQXJZlxxrUpzse" where id=6;
Select * from UserClient;

Drop table if exists Configuration;
Create table Configuration(
	user_id integer not null,
    send_emails boolean not null,
    premium boolean not null,
    hide_others boolean not null,
    Primary Key (user_id),
    Foreign key (user_id) References UserClient(id)
);

Insert into Configuration(user_id,send_emails,premium,hide_others) Values (1,false,false,false);
Insert into Configuration(user_id,send_emails,premium,hide_others) Values (2,false,false,false);
Insert into Configuration(user_id,send_emails,premium,hide_others) Values (3,false,false,false);
Insert into Configuration(user_id,send_emails,premium,hide_others) Values (4,false,false,false);
Insert into Configuration(user_id,send_emails,premium,hide_others) Values (5,false,false,false);
Insert into Configuration(user_id,send_emails,premium,hide_others) Values (6,false,false,false);

Drop table if exists CreditCard;
Create table CreditCard(
	id integer unique not null auto_increment,
	user_id integer not null,
    num_en bigint not null,
    owner_en varchar(90) not null,
    expiry_date date not null,
    security_num_en bigint not null,
    Primary Key (user_id,id),
    Foreign key (user_id) References UserClient(id)
);

Insert into CreditCard(user_id,num_en,owner_en,expiry_date,security_num_en) Values (1,10,"Jake Barder",current_date(),233);
Insert into CreditCard(user_id,num_en,owner_en,expiry_date,security_num_en) Values (2,12,"Jake Barder",current_date(),233);
Insert into CreditCard(user_id,num_en,owner_en,expiry_date,security_num_en) Values (3,14,"Jake Barder",current_date(),233);
Insert into CreditCard(user_id,num_en,owner_en,expiry_date,security_num_en) Values (4,15,"Jake Barder",current_date(),233);
Insert into CreditCard(user_id,num_en,owner_en,expiry_date,security_num_en) Values (5,16,"Jake Barder",current_date(),233);
Insert into CreditCard(user_id,num_en,owner_en,expiry_date,security_num_en) Values (6,17,"Jake Barder",current_date(),233);

Drop table if exists BankAccount;
Create table BankAccount(
	id integer unique not null auto_increment,
	user_id integer not null,
	ivan_en varchar(50) not null,
    Primary Key (user_id,id),
    Foreign key (user_id) References UserClient(id)
);

Insert into BankAccount(user_id,ivan_en) Values (1,"ES60 2234 0877 8893 2228 9988");
Insert into BankAccount(user_id,ivan_en) Values (2,"ES62 2444 0839 8339 2228 9988");
Insert into BankAccount(user_id,ivan_en) Values (3,"ES63 2222 1112 8894 2228 9988");
Insert into BankAccount(user_id,ivan_en) Values (4,"ES60 2334 0111 8866 2228 9988");
Insert into BankAccount(user_id,ivan_en) Values (5,"ES62 2223 0833 8898 2228 9988");
Insert into BankAccount(user_id,ivan_en) Values (6,"ES63 2255 0223 8899 2228 9988");

Drop table if exists PayPalAccount;
Create table PayPalAccount(
	id integer unique not null auto_increment,
	user_id integer not null,
	nickname varchar(50) not null,
    api_id varchar(150) not null,
    Primary Key (user_id,id),
    Foreign key (user_id) References UserClient(id)
);

Insert into PayPalAccount(user_id,nickname,api_id) Values (1,"James Kyan","abcdefg1234");
Insert into PayPalAccount(user_id,nickname,api_id) Values (2,"James Kyan","abcdefg1233");
Insert into PayPalAccount(user_id,nickname,api_id) Values (3,"James Kyan","abcdefg1232");
Insert into PayPalAccount(user_id,nickname,api_id) Values (4,"James Kyan","abcdefg1231");
Insert into PayPalAccount(user_id,nickname,api_id) Values (5,"James Kyan","abcdefg1211");
Insert into PayPalAccount(user_id,nickname,api_id) Values (6,"James Kyan","abcdefg1222");

Drop table if exists PaySafeCardAccount;
Create table PaySafeCardAccount(
	id integer unique not null auto_increment,
	user_id integer not null,
	nickname varchar(50) not null,
    api_id varchar(150) not null,
    Primary Key (user_id,id),
    Foreign key (user_id) References UserClient(id)
);

Insert into PaySafeCardAccount(user_id,nickname,api_id) Values (1,"James Kyan","abcdefg1234");
Insert into PaySafeCardAccount(user_id,nickname,api_id) Values (2,"James Kyan","abcdefg1233");
Insert into PaySafeCardAccount(user_id,nickname,api_id) Values (3,"James Kyan","abcdefg1232");
Insert into PaySafeCardAccount(user_id,nickname,api_id) Values (4,"James Kyan","abcdefg1231");
Insert into PaySafeCardAccount(user_id,nickname,api_id) Values (5,"James Kyan","abcdefg1211");
Insert into PaySafeCardAccount(user_id,nickname,api_id) Values (6,"James Kyan","abcdefg1222");

Drop table if exists Wallet;
Create table Wallet(
	id integer unique not null auto_increment,
	user_id integer unique not null,
	current_balance double not null,
    Primary Key (id,user_id),
    Foreign key (user_id) References UserClient(id)
);

Insert into Wallet(user_id,current_balance) Values (1,0);
Insert into Wallet(user_id,current_balance) Values (2,0);
Insert into Wallet(user_id,current_balance) Values (3,0);
Insert into Wallet(user_id,current_balance) Values (4,0);
Insert into Wallet(user_id,current_balance) Values (5,0);
Insert into Wallet(user_id,current_balance) Values (6,0);

Drop table if exists WalletHistory;
Create table WalletHistory(
	wallet_id integer not null,
	amount_transfered double not null,
    credit_card_id integer,
    bnk_account_id integer,
    paypal_id integer,
    safecard_id integer,
    date_hour datetime not null,
    Primary Key (wallet_id),
    Foreign key (wallet_id) References Wallet(id),
    Foreign key (credit_card_id) References CreditCard(id),
    Foreign key (bnk_account_id) References BankAccount(id),
    Foreign key (paypal_id) References PayPalAccount(id),
    Foreign key (safecard_id) References PaySafeCardAccount(id)
);

Insert into WalletHistory(wallet_id,amount_transfered,credit_card_id,bnk_account_id,paypal_id,safecard_id,date_hour) Values (1,20,null,null,1,null,current_time());
Insert into WalletHistory(wallet_id,amount_transfered,credit_card_id,bnk_account_id,paypal_id,safecard_id,date_hour) Values (2,20,null,2,null,null,current_time());
Insert into WalletHistory(wallet_id,amount_transfered,credit_card_id,bnk_account_id,paypal_id,safecard_id,date_hour) Values (3,20,3,null,null,null,current_time());
Insert into WalletHistory(wallet_id,amount_transfered,credit_card_id,bnk_account_id,paypal_id,safecard_id,date_hour) Values (4,20,null,4,null,null,current_time());
Insert into WalletHistory(wallet_id,amount_transfered,credit_card_id,bnk_account_id,paypal_id,safecard_id,date_hour) Values (5,20,null,null,5,null,current_time());
Insert into WalletHistory(wallet_id,amount_transfered,credit_card_id,bnk_account_id,paypal_id,safecard_id,date_hour) Values (6,20,null,null,6,null,current_time());

Drop table if exists Crypto;
Create table Crypto(
	id integer unique not null auto_increment,
    abreviated_name varchar(5) not null,
    fullname varchar(50) not null,
    current_price double not null,
    last_update datetime not null,
    Primary Key (id)
);

Insert into Crypto(abreviated_name,fullname,current_price,last_update) Values ("BTC","Bitcoin",40350.90,'2021-08-21 21:00:00');
Insert into Crypto(abreviated_name,fullname,current_price,last_update) Values ("ETH","Ethereum",3270.29,'2021-08-21 21:00:00');
Insert into Crypto(abreviated_name,fullname,current_price,last_update) Values ("DOGE","Dogecoin",0.2784,'2021-08-21 21:00:00');
Insert into Crypto(abreviated_name,fullname,current_price,last_update) Values ("USDC","USD Coin",0.9996,'2021-08-21 21:00:00');
Insert into Crypto(abreviated_name,fullname,current_price,last_update) Values ("LTC","Litecoin",180.54,'2021-08-21 21:00:00');
Insert into Crypto(abreviated_name,fullname,current_price,last_update) Values ("BNB","Binance Coin",402.82,'2021-08-21 21:00:00');

Drop table if exists CryptoHistory;
Create table CryptoHistory(
	id integer unique not null auto_increment,
	crypto_id integer not null,
    price double not null,
    difference double not null,
    update_date datetime not null,
    Primary Key (id, crypto_id),
    Foreign key (crypto_id) References Crypto(id)
);

Insert into CryptoHistory(crypto_id,price,difference,update_date) Values (1,40350.90,-11.2,'2021-08-21 21:00:00');
Insert into CryptoHistory(crypto_id,price,difference,update_date) Values (1,45440.22,7.0687,'2021-08-21 20:30:00');
Insert into CryptoHistory(crypto_id,price,difference,update_date) Values (1,42440.22,4.9455,'2021-08-21 20:00:00');
Insert into CryptoHistory(crypto_id,price,difference,update_date) Values (1,40440.22,100,'2021-08-21 19:30:00');
Insert into CryptoHistory(crypto_id,price,difference,update_date) Values (2,3270.29,-2.9671,'2021-08-21 21:00:00');
Insert into CryptoHistory(crypto_id,price,difference,update_date) Values (2,3370.29,6.3085,'2021-08-21 20:30:00');
Insert into CryptoHistory(crypto_id,price,difference,update_date) Values (2,3170.29,-8.6448,'2021-08-21 20:00:00');
Insert into CryptoHistory(crypto_id,price,difference,update_date) Values (2,3470.29,100,'2021-08-21 19:30:00');
Insert into CryptoHistory(crypto_id,price,difference,update_date) Values (3,0.2784,7.0706,'2021-08-21 21:00:00');
Insert into CryptoHistory(crypto_id,price,difference,update_date) Values (3,0.26,6.5573,'2021-08-21 20:30:00');
Insert into CryptoHistory(crypto_id,price,difference,update_date) Values (3,0.244,48.9966,'2021-08-21 20:00:00');
Insert into CryptoHistory(crypto_id,price,difference,update_date) Values (3,0.4784,100,'2021-08-21 19:30:00');
Insert into CryptoHistory(crypto_id,price,difference,update_date) Values (4,0.9996,11.0666,'2021-08-21 21:00:00');
Insert into CryptoHistory(crypto_id,price,difference,update_date) Values (4,0.9,5.8823,'2021-08-21 20:30:00');
Insert into CryptoHistory(crypto_id,price,difference,update_date) Values (4,0.85,-1.1627,'2021-08-21 20:00:00');
Insert into CryptoHistory(crypto_id,price,difference,update_date) Values (4,0.86,100,'2021-08-21 19:30:00');
Insert into CryptoHistory(crypto_id,price,difference,update_date) Values (5,180.54,0.3557,'2021-08-21 21:00:00');
Insert into CryptoHistory(crypto_id,price,difference,update_date) Values (5,179.9,0.2787,'2021-08-21 20:30:00');
Insert into CryptoHistory(crypto_id,price,difference,update_date) Values (5,179.4,0,'2021-08-21 20:00:00');
Insert into CryptoHistory(crypto_id,price,difference,update_date) Values (5,179.4,100,'2021-08-21 19:30:00');
Insert into CryptoHistory(crypto_id,price,difference,update_date) Values (6,402.82,0.0795,'2021-08-21 21:00:00');
Insert into CryptoHistory(crypto_id,price,difference,update_date) Values (6,402.5,0,'2021-08-21 20:30:00');
Insert into CryptoHistory(crypto_id,price,difference,update_date) Values (6,402.5,0.625,'2021-08-21 20:00:00');
Insert into CryptoHistory(crypto_id,price,difference,update_date) Values (6,400,100,'2021-08-21 19:30:00');

Drop table if exists CryptoPartition;
Create table CryptoPartition(
	id integer unique not null auto_increment,
    crypto_id integer not null,
    part_price double not null,
    percent double not null,
    Primary Key (id,crypto_id),
    Foreign key (crypto_id) References Crypto(id)
);

Insert into CryptoPartition(crypto_id,part_price,percent) Values (1,40350.90,1.00);
Insert into CryptoPartition(crypto_id,part_price,percent) Values (1,40350.90,1.00);
Insert into CryptoPartition(crypto_id,part_price,percent) Values (2,3270.29,1.00);
Insert into CryptoPartition(crypto_id,part_price,percent) Values (2,3270.29,1.00);
Insert into CryptoPartition(crypto_id,part_price,percent) Values (3,0.2784,1.00);
Insert into CryptoPartition(crypto_id,part_price,percent) Values (3,0.2784,1.00);
Insert into CryptoPartition(crypto_id,part_price,percent) Values (4,0.9996,1.00);
Insert into CryptoPartition(crypto_id,part_price,percent) Values (4,0.9996,1.00);
Insert into CryptoPartition(crypto_id,part_price,percent) Values (5,180.54,1.00);
Insert into CryptoPartition(crypto_id,part_price,percent) Values (5,180.54,1.00);
Insert into CryptoPartition(crypto_id,part_price,percent) Values (6,402.82,1.00);
Insert into CryptoPartition(crypto_id,part_price,percent) Values (6,402.82,1.00);

Drop table if exists TransactionHistory;
Create table TransactionHistory(
	partition_id integer unique not null,
    seller_id integer unique not null,
    buyer_id integer unique not null,
    price double not null,
    Primary key(partition_id, seller_id, buyer_id),
    Foreign key(partition_id) References CryptoPartition(id),
    Foreign key(seller_id) References UserClient(id),
    Foreign key(buyer_id) References UserClient(id)
);

Drop table if exists CurrentlyAdquired;
Create table CurrentlyAdquired(
	partition_id integer unique not null,
    owner_id integer unique not null,
    purchused_price double not null,
    current_price double not null,
    Primary key(partition_id, owner_id),
    Foreign key(partition_id) References CryptoPartition(id),
    Foreign key(owner_id) References UserClient(id)
);

