CREATE TABLE `Customer` (
	`customer_id`	VARCHAR(20)	NOT NULL,
	`password`	VARCHAR(20)	NOT NULL,
	`customer_name`	VARCHAR(20)	NOT NULL,
	`create_date`	datetime	NOT NULL,
	`modified_date`	datetime	NULL,
	`last_login`	DATETIME	NOT NULL,
	`email`	VARCHAR(20)	NOT NULL,
	`address`	VARCHAR(100)	NOT NULL,
	`phone_num`	VARCHAR(20)	NULL,
	`birth_date`	DATE	NOT NULL,
	`grade`	VARCHAR(20)	NOT NULL	DEFAULT White
);

CREATE TABLE `Order` (
	`order_id`	VARCHAR(10)	NOT NULL,
	`customer_id`	VARCHAR(20)	NOT NULL,
	`product_id`	VARCHAR(20)	NOT NULL,
	`product_name`	VARCHAR(20)	NOT NULL,
	`product_num`	INT	NOT NULL,
	`paymentM`	VARCHAR(200)	NOT NULL,
	`create_date`	datetime	NOT NULL,
	`modified_date`	datetime	NULL,
	`address_order`	VARCHAR(100)	NOT NULL,
	`status`	VARCHAR(200)	NOT NULL,
	`requests`	VARCHAR(20)	NULL
);

CREATE TABLE `Cart` (
	`customer_id2`	VARCHAR(20)	NOT NULL,
	`product_id`	VARCHAR(20)	NOT NULL,
	`STATUS`	CHAR(1)	NOT NULL
);

CREATE TABLE `grade` (
	`customer_id`	VARCHAR(20)	NOT NULL,
	`grade`	VARCHAR(20)	NOT NULL,
	`percent`	FLOAT	NOT NULL
);

CREATE TABLE `Product` (
	`product_id`	VARCHAR(20)	NOT NULL,
	`company_id`	VARCHAR(20)	NOT NULL,
	`product_name`	VARCHAR(50)	NOT NULL,
	`product_type`	VARCHAR(20)	NOT NULL,
	`product_price`	INT	NOT NULL,
	`quantity`	INT	NOT NULL,
	`brand`	VARCHAR(20)	NOT NULL,
	`origin`	VARCHAR(20)	NOT NULL
);

CREATE TABLE `company` (
	`company_id`	VARCHAR(20)	NOT NULL,
	`company_name`	VARCHAR(20)	NOT NULL,
	`company_location`	VARCHAR(100)	NOT NULL,
	`company_tel`	VARCHAR(20)	NOT NULL,
	`company_num`	VARCHAR(20)	NOT NULL
);

CREATE TABLE `coupon` (
	`coupon_id`	INT	NOT NULL,
	`customer_id`	VARCHAR(20)	NOT NULL,
	`coupon_name`	VARCHAR(20)	NOT NULL,
	`content`	VARCHAR(100)	NULL,
	`discount`	INT	NOT NULL,
	`create_coupon`	DATETIME	NOT NULL,
	`delete_coupon`	DATETIME	NOT NULL,
	`least_price`	INT	NOT NULL
);

CREATE TABLE `delivery` (
	`address_id`	VARCHAR(20)	NOT NULL,
	`customer_id`	VARCHAR(20)	NOT NULL,
	`base_delivery`	VARCHAR(100)	NOT NULL,
	`address_name`	VARCHAR(100)	NOT NULL
);

CREATE TABLE `review` (
	`review_id`	VARCHAR(20)	NOT NULL,
	`customer_id`	VARCHAR(20)	NOT NULL,
	`product_id`	VARCHAR(20)	NOT NULL,
	`review_img`	text	NULL,
	`write_date`	DATETIME	NOT NULL,
	`rewrite_date`	DATETIME	NOT NULL,
	`star`	INT	NOT NULL,
	`review`	VARCHAR(100)	NULL
);

