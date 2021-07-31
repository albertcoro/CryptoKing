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
    Primary Key(id)
);

Drop table if exists Configuration;
Create table Configuration(
	user_id integer not null,
    send_emails boolean not null,
    premium boolean not null,
    hide_others boolean not null,
    Primary Key (user_id),
    Foreign key (user_id) References UserClient(id)
);

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

Drop table if exists BankAccount;
Create table BankAccount(
	id integer unique not null auto_increment,
	user_id integer not null,
	ivan_en varchar(50) not null,
    bank_en varchar(50) not null,
    Primary Key (user_id,id),
    Foreign key (user_id) References UserClient(id)
);

Drop table if exists PayPalAccount;
Create table PayPalAccount(
	id integer unique not null auto_increment,
	user_id integer not null,
	nickname varchar(50) not null,
    link varchar(150) not null,
    Primary Key (user_id,id),
    Foreign key (user_id) References UserClient(id)
);

Drop table if exists PaySafeCardAccount;
Create table PaySafeCardAccount(
	id integer unique not null auto_increment,
	user_id integer not null,
	nickname varchar(50) not null,
    link varchar(150) not null,
    Primary Key (user_id,id),
    Foreign key (user_id) References UserClient(id)
);

Drop table if exists Wallet;
Create table Wallet(
	id integer unique not null auto_increment,
	user_id integer unique not null,
	current_balance double not null,
    Primary Key (id,user_id),
    Foreign key (user_id) References UserClient(id)
);

Drop table if exists WalletHistory;
Create table WalletHistory(
	wallet_id integer not null,
	amount_transfered double not null,
    credit_card_id integer,
    bnk_account_id integer,
    paypal_id integer,
    safecard_id integer,
    date_hour date not null,
    Primary Key (wallet_id),
    Foreign key (wallet_id) References Wallet(id),
    Foreign key (credit_card_id) References CreditCard(id),
    Foreign key (bnk_account_id) References BankAccount(id),
    Foreign key (paypal_id) References PayPalAccount(id),
    Foreign key (safecard_id) References PaySafeCardAccount(id)
);

Drop table if exists Crypto;
Create table Crypto(
	id integer unique not null auto_increment,
    abreviated_name varchar(5) not null,
    fullname varchar(50) not null,
    current_price double not null,
    last_update date not null,
    Primary Key (id)
);

Drop table if exists CryptoHistory;
Create table CryptoHistory(
	crypto_id integer not null,
    price double not null,
    difference double not null,
    update_date date not null,
    Primary Key (crypto_id),
    Foreign key (crypto_id) References Crypto(id)
);

Drop table if exists CryptoPartition;
Create table CryptoPartition(
	id integer unique not null auto_increment,
    crypto_id integer not null,
    current_price double not null,
    Primary Key (crypto_id),
    Foreign key (crypto_id) References Crypto(id)
);

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
