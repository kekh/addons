CREATE TABLE IF NOT EXISTS oc_address (
  address_id int(11) NOT NULL AUTO_INCREMENT,
  customer_id int(11) NOT NULL,
  firstname varchar(32) NOT NULL,
  lastname varchar(32) NOT NULL,
  company varchar(40) NOT NULL,
  address_1 varchar(128) NOT NULL,
  address_2 varchar(128) NOT NULL,
  city varchar(128) NOT NULL,
  postcode varchar(10) NOT NULL,
  country_id int(11) NOT NULL DEFAULT 0,
  zone_id int(11) NOT NULL DEFAULT 0,
  custom_field text NOT NULL,
  PRIMARY KEY (address_id),
  KEY customer_id (customer_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS oc_affiliate (
  affiliate_id int(11) NOT NULL AUTO_INCREMENT,
  firstname varchar(32) NOT NULL,
  lastname varchar(32) NOT NULL,
  email varchar(96) NOT NULL,
  telephone varchar(32) NOT NULL,
  fax varchar(32) NOT NULL,
  password varchar(40) NOT NULL,
  salt varchar(9) NOT NULL,
  company varchar(40) NOT NULL,
  website varchar(255) NOT NULL,
  address_1 varchar(128) NOT NULL,
  address_2 varchar(128) NOT NULL,
  city varchar(128) NOT NULL,
  postcode varchar(10) NOT NULL,
  country_id int(11) NOT NULL,
  zone_id int(11) NOT NULL,
  code varchar(64) NOT NULL,
  commission decimal(4,2) NOT NULL DEFAULT 0.00,
  tax varchar(64) NOT NULL,
  payment varchar(6) NOT NULL,
  cheque varchar(100) NOT NULL,
  paypal varchar(64) NOT NULL,
  bank_name varchar(64) NOT NULL,
  bank_branch_number varchar(64) NOT NULL,
  bank_swift_code varchar(64) NOT NULL,
  bank_account_name varchar(64) NOT NULL,
  bank_account_number varchar(64) NOT NULL,
  ip varchar(40) NOT NULL,
  status tinyint(1) NOT NULL,
  approved tinyint(1) NOT NULL,
  date_added datetime NOT NULL,
  PRIMARY KEY (affiliate_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS oc_affiliate_activity (
  activity_id int(11) NOT NULL AUTO_INCREMENT,
  affiliate_id int(11) NOT NULL,
  `key` varchar(64) NOT NULL,
  data text NOT NULL,
  ip varchar(40) NOT NULL,
  date_added datetime NOT NULL,
  PRIMARY KEY (activity_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS oc_affiliate_login (
  affiliate_login_id int(11) NOT NULL AUTO_INCREMENT,
  email varchar(96) NOT NULL,
  ip varchar(40) NOT NULL,
  total int(4) NOT NULL,
  date_added datetime NOT NULL,
  date_modified datetime NOT NULL,
  PRIMARY KEY (affiliate_login_id),
  KEY email (email),
  KEY ip (ip)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS oc_affiliate_transaction (
  affiliate_transaction_id int(11) NOT NULL AUTO_INCREMENT,
  affiliate_id int(11) NOT NULL,
  order_id int(11) NOT NULL,
  description text NOT NULL,
  amount decimal(15,4) NOT NULL,
  date_added datetime NOT NULL,
  PRIMARY KEY (affiliate_transaction_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS oc_api (
  api_id int(11) NOT NULL AUTO_INCREMENT,
  username varchar(64) NOT NULL,
  firstname varchar(64) NOT NULL,
  lastname varchar(64) NOT NULL,
  password text NOT NULL,
  status tinyint(1) NOT NULL,
  date_added datetime NOT NULL,
  date_modified datetime NOT NULL,
  PRIMARY KEY (api_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS oc_attribute (
  attribute_id int(11) NOT NULL AUTO_INCREMENT,
  attribute_group_id int(11) NOT NULL,
  sort_order int(3) NOT NULL,
  PRIMARY KEY (attribute_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS oc_attribute_description (
  attribute_id int(11) NOT NULL,
  language_id int(11) NOT NULL,
  name varchar(64) NOT NULL,
  PRIMARY KEY (attribute_id,language_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS oc_attribute_group (
  attribute_group_id int(11) NOT NULL AUTO_INCREMENT,
  sort_order int(3) NOT NULL,
  PRIMARY KEY (attribute_group_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS oc_attribute_group_description (
  attribute_group_id int(11) NOT NULL,
  language_id int(11) NOT NULL,
  name varchar(64) NOT NULL,
  PRIMARY KEY (attribute_group_id,language_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS oc_banner (
  banner_id int(11) NOT NULL AUTO_INCREMENT,
  name varchar(64) NOT NULL,
  status tinyint(1) NOT NULL,
  PRIMARY KEY (banner_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS oc_banner_image (
  banner_image_id int(11) NOT NULL AUTO_INCREMENT,
  banner_id int(11) NOT NULL,
  link varchar(255) NOT NULL,
  image varchar(255) NOT NULL,
  sort_order int(3) NOT NULL DEFAULT 0,
  PRIMARY KEY (banner_image_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS oc_banner_image_description (
  banner_image_id int(11) NOT NULL,
  language_id int(11) NOT NULL,
  banner_id int(11) NOT NULL,
  title varchar(64) NOT NULL,
  PRIMARY KEY (banner_image_id,language_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS oc_category (
  category_id int(11) NOT NULL AUTO_INCREMENT,
  image varchar(255) DEFAULT NULL,
  parent_id int(11) NOT NULL DEFAULT 0,
  top tinyint(1) NOT NULL,
  `column` int(3) NOT NULL,
  sort_order int(3) NOT NULL DEFAULT 0,
  status tinyint(1) NOT NULL,
  date_added datetime NOT NULL,
  date_modified datetime NOT NULL,
  PRIMARY KEY (category_id),
  KEY parent_id (parent_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS oc_category_description (
  category_id int(11) NOT NULL,
  language_id int(11) NOT NULL,
  name varchar(255) NOT NULL,
  description text NOT NULL,
  meta_title varchar(255) NOT NULL,
  meta_description varchar(255) NOT NULL,
  meta_keyword varchar(255) NOT NULL,
  PRIMARY KEY (category_id,language_id),
  KEY name (name)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS oc_category_filter (
  category_id int(11) NOT NULL,
  filter_id int(11) NOT NULL,
  PRIMARY KEY (category_id,filter_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS oc_category_path (
  category_id int(11) NOT NULL,
  path_id int(11) NOT NULL,
  level int(11) NOT NULL,
  PRIMARY KEY (category_id,path_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS oc_category_to_layout (
  category_id int(11) NOT NULL,
  store_id int(11) NOT NULL,
  layout_id int(11) NOT NULL,
  PRIMARY KEY (category_id,store_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS oc_category_to_store (
  category_id int(11) NOT NULL,
  store_id int(11) NOT NULL,
  PRIMARY KEY (category_id,store_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS oc_country (
  country_id int(11) NOT NULL AUTO_INCREMENT,
  name varchar(128) NOT NULL,
  iso_code_2 varchar(2) NOT NULL,
  iso_code_3 varchar(3) NOT NULL,
  address_format text NOT NULL,
  postcode_required tinyint(1) NOT NULL,
  status tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (country_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS oc_coupon (
  coupon_id int(11) NOT NULL AUTO_INCREMENT,
  name varchar(128) NOT NULL,
  code varchar(10) NOT NULL,
  type char(1) NOT NULL,
  discount decimal(15,4) NOT NULL,
  logged tinyint(1) NOT NULL,
  shipping tinyint(1) NOT NULL,
  total decimal(15,4) NOT NULL,
  date_start date NOT NULL DEFAULT '0000-00-00',
  date_end date NOT NULL DEFAULT '0000-00-00',
  uses_total int(11) NOT NULL,
  uses_customer varchar(11) NOT NULL,
  status tinyint(1) NOT NULL,
  date_added datetime NOT NULL,
  PRIMARY KEY (coupon_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS oc_coupon_category (
  coupon_id int(11) NOT NULL,
  category_id int(11) NOT NULL,
  PRIMARY KEY (coupon_id,category_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS oc_coupon_history (
  coupon_history_id int(11) NOT NULL AUTO_INCREMENT,
  coupon_id int(11) NOT NULL,
  order_id int(11) NOT NULL,
  customer_id int(11) NOT NULL,
  amount decimal(15,4) NOT NULL,
  date_added datetime NOT NULL,
  PRIMARY KEY (coupon_history_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS oc_coupon_product (
  coupon_product_id int(11) NOT NULL AUTO_INCREMENT,
  coupon_id int(11) NOT NULL,
  product_id int(11) NOT NULL,
  PRIMARY KEY (coupon_product_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS oc_currency (
  currency_id int(11) NOT NULL AUTO_INCREMENT,
  title varchar(32) NOT NULL,
  code varchar(3) NOT NULL,
  symbol_left varchar(12) NOT NULL,
  symbol_right varchar(12) NOT NULL,
  decimal_place char(1) NOT NULL,
  value float(15,8) NOT NULL,
  status tinyint(1) NOT NULL,
  date_modified datetime NOT NULL,
  PRIMARY KEY (currency_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS oc_customer (
  customer_id int(11) NOT NULL AUTO_INCREMENT,
  customer_group_id int(11) NOT NULL,
  store_id int(11) NOT NULL DEFAULT 0,
  firstname varchar(32) NOT NULL,
  lastname varchar(32) NOT NULL,
  email varchar(96) NOT NULL,
  telephone varchar(32) NOT NULL,
  fax varchar(32) NOT NULL,
  password varchar(40) NOT NULL,
  salt varchar(9) NOT NULL,
  cart text,
  wishlist text,
  newsletter tinyint(1) NOT NULL DEFAULT 0,
  address_id int(11) NOT NULL DEFAULT 0,
  custom_field text NOT NULL,
  ip varchar(40) NOT NULL,
  status tinyint(1) NOT NULL,
  approved tinyint(1) NOT NULL,
  safe tinyint(1) NOT NULL,
  token varchar(255) NOT NULL,
  date_added datetime NOT NULL,
  PRIMARY KEY (customer_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS oc_customer_activity (
  activity_id int(11) NOT NULL AUTO_INCREMENT,
  customer_id int(11) NOT NULL,
  `key` varchar(64) NOT NULL,
  data text NOT NULL,
  ip varchar(40) NOT NULL,
  date_added datetime NOT NULL,
  PRIMARY KEY (activity_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS oc_customer_ban_ip (
  customer_ban_ip_id int(11) NOT NULL AUTO_INCREMENT,
  ip varchar(40) NOT NULL,
  PRIMARY KEY (customer_ban_ip_id),
  KEY ip (ip)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS oc_customer_group (
  customer_group_id int(11) NOT NULL AUTO_INCREMENT,
  approval int(1) NOT NULL,
  sort_order int(3) NOT NULL,
  PRIMARY KEY (customer_group_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS oc_customer_group_description (
  customer_group_id int(11) NOT NULL,
  language_id int(11) NOT NULL,
  name varchar(32) NOT NULL,
  description text NOT NULL,
  PRIMARY KEY (customer_group_id,language_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS oc_customer_history (
  customer_history_id int(11) NOT NULL AUTO_INCREMENT,
  customer_id int(11) NOT NULL,
  comment text NOT NULL,
  date_added datetime NOT NULL,
  PRIMARY KEY (customer_history_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS oc_customer_ip (
  customer_ip_id int(11) NOT NULL AUTO_INCREMENT,
  customer_id int(11) NOT NULL,
  ip varchar(40) NOT NULL,
  date_added datetime NOT NULL,
  PRIMARY KEY (customer_ip_id),
  KEY ip (ip)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS oc_customer_login (
  customer_login_id int(11) NOT NULL AUTO_INCREMENT,
  email varchar(96) NOT NULL,
  ip varchar(40) NOT NULL,
  total int(4) NOT NULL,
  date_added datetime NOT NULL,
  date_modified datetime NOT NULL,
  PRIMARY KEY (customer_login_id),
  KEY email (email),
  KEY ip (ip)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS oc_customer_online (
  ip varchar(40) NOT NULL,
  customer_id int(11) NOT NULL,
  url text NOT NULL,
  referer text NOT NULL,
  date_added datetime NOT NULL,
  PRIMARY KEY (ip)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS oc_customer_reward (
  customer_reward_id int(11) NOT NULL AUTO_INCREMENT,
  customer_id int(11) NOT NULL DEFAULT 0,
  order_id int(11) NOT NULL DEFAULT 0,
  description text NOT NULL,
  points int(8) NOT NULL DEFAULT 0,
  date_added datetime NOT NULL,
  PRIMARY KEY (customer_reward_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS oc_customer_transaction (
  customer_transaction_id int(11) NOT NULL AUTO_INCREMENT,
  customer_id int(11) NOT NULL,
  order_id int(11) NOT NULL,
  description text NOT NULL,
  amount decimal(15,4) NOT NULL,
  date_added datetime NOT NULL,
  PRIMARY KEY (customer_transaction_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS oc_custom_field (
  custom_field_id int(11) NOT NULL AUTO_INCREMENT,
  type varchar(32) NOT NULL,
  value text NOT NULL,
  location varchar(7) NOT NULL,
  status tinyint(1) NOT NULL,
  sort_order int(3) NOT NULL,
  PRIMARY KEY (custom_field_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS oc_custom_field_customer_group (
  custom_field_id int(11) NOT NULL,
  customer_group_id int(11) NOT NULL,
  required tinyint(1) NOT NULL,
  PRIMARY KEY (custom_field_id,customer_group_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS oc_custom_field_description (
  custom_field_id int(11) NOT NULL,
  language_id int(11) NOT NULL,
  name varchar(128) NOT NULL,
  PRIMARY KEY (custom_field_id,language_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS oc_custom_field_value (
  custom_field_value_id int(11) NOT NULL AUTO_INCREMENT,
  custom_field_id int(11) NOT NULL,
  sort_order int(3) NOT NULL,
  PRIMARY KEY (custom_field_value_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS oc_custom_field_value_description (
  custom_field_value_id int(11) NOT NULL,
  language_id int(11) NOT NULL,
  custom_field_id int(11) NOT NULL,
  name varchar(128) NOT NULL,
  PRIMARY KEY (custom_field_value_id,language_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS oc_download (
  download_id int(11) NOT NULL AUTO_INCREMENT,
  filename varchar(128) NOT NULL,
  mask varchar(128) NOT NULL,
  date_added datetime NOT NULL,
  PRIMARY KEY (download_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS oc_download_description (
  download_id int(11) NOT NULL,
  language_id int(11) NOT NULL,
  name varchar(64) NOT NULL,
  PRIMARY KEY (download_id,language_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS oc_event (
  event_id int(11) NOT NULL AUTO_INCREMENT,
  code varchar(32) NOT NULL,
  `trigger` text NOT NULL,
  action text NOT NULL,
  PRIMARY KEY (event_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS oc_extension (
  extension_id int(11) NOT NULL AUTO_INCREMENT,
  type varchar(32) NOT NULL,
  code varchar(32) NOT NULL,
  PRIMARY KEY (extension_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS oc_filter (
  filter_id int(11) NOT NULL AUTO_INCREMENT,
  filter_group_id int(11) NOT NULL,
  sort_order int(3) NOT NULL,
  PRIMARY KEY (filter_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS oc_filter_description (
  filter_id int(11) NOT NULL,
  language_id int(11) NOT NULL,
  filter_group_id int(11) NOT NULL,
  name varchar(64) NOT NULL,
  PRIMARY KEY (filter_id,language_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS oc_filter_group (
  filter_group_id int(11) NOT NULL AUTO_INCREMENT,
  sort_order int(3) NOT NULL,
  PRIMARY KEY (filter_group_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS oc_filter_group_description (
  filter_group_id int(11) NOT NULL,
  language_id int(11) NOT NULL,
  name varchar(64) NOT NULL,
  PRIMARY KEY (filter_group_id,language_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS oc_geo_zone (
  geo_zone_id int(11) NOT NULL AUTO_INCREMENT,
  name varchar(32) NOT NULL,
  description varchar(255) NOT NULL,
  date_modified datetime NOT NULL,
  date_added datetime NOT NULL,
  PRIMARY KEY (geo_zone_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS oc_information (
  information_id int(11) NOT NULL AUTO_INCREMENT,
  bottom int(1) NOT NULL DEFAULT 0,
  sort_order int(3) NOT NULL DEFAULT 0,
  status tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (information_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS oc_information_description (
  information_id int(11) NOT NULL,
  language_id int(11) NOT NULL,
  title varchar(64) NOT NULL,
  description text NOT NULL,
  meta_title varchar(255) NOT NULL,
  meta_description varchar(255) NOT NULL,
  meta_keyword varchar(255) NOT NULL,
  PRIMARY KEY (information_id,language_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS oc_information_to_layout (
  information_id int(11) NOT NULL,
  store_id int(11) NOT NULL,
  layout_id int(11) NOT NULL,
  PRIMARY KEY (information_id,store_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS oc_information_to_store (
  information_id int(11) NOT NULL,
  store_id int(11) NOT NULL,
  PRIMARY KEY (information_id,store_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS oc_language (
  language_id int(11) NOT NULL AUTO_INCREMENT,
  name varchar(32) NOT NULL,
  code varchar(5) NOT NULL,
  locale varchar(255) NOT NULL,
  image varchar(64) NOT NULL,
  directory varchar(32) NOT NULL,
  sort_order int(3) NOT NULL DEFAULT 0,
  status tinyint(1) NOT NULL,
  PRIMARY KEY (language_id),
  KEY name (name)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS oc_layout (
  layout_id int(11) NOT NULL AUTO_INCREMENT,
  name varchar(64) NOT NULL,
  PRIMARY KEY (layout_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS oc_layout_module (
  layout_module_id int(11) NOT NULL AUTO_INCREMENT,
  layout_id int(11) NOT NULL,
  code varchar(64) NOT NULL,
  position varchar(14) NOT NULL,
  sort_order int(3) NOT NULL,
  PRIMARY KEY (layout_module_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS oc_layout_route (
  layout_route_id int(11) NOT NULL AUTO_INCREMENT,
  layout_id int(11) NOT NULL,
  store_id int(11) NOT NULL,
  route varchar(255) NOT NULL,
  PRIMARY KEY (layout_route_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS oc_length_class (
  length_class_id int(11) NOT NULL AUTO_INCREMENT,
  value decimal(15,8) NOT NULL,
  PRIMARY KEY (length_class_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS oc_length_class_description (
  length_class_id int(11) NOT NULL AUTO_INCREMENT,
  language_id int(11) NOT NULL,
  title varchar(32) NOT NULL,
  unit varchar(4) NOT NULL,
  PRIMARY KEY (length_class_id,language_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS oc_location (
  location_id int(11) NOT NULL AUTO_INCREMENT,
  name varchar(32) NOT NULL,
  address text NOT NULL,
  telephone varchar(32) NOT NULL,
  fax varchar(32) NOT NULL,
  geocode varchar(32) NOT NULL,
  image varchar(255) DEFAULT NULL,
  open text NOT NULL,
  comment text NOT NULL,
  PRIMARY KEY (location_id),
  KEY name (name)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;


CREATE TABLE IF NOT EXISTS oc_manufacturer (
  manufacturer_id int(11) NOT NULL AUTO_INCREMENT,
  name varchar(64) NOT NULL,
  image varchar(255) DEFAULT NULL,
  sort_order int(3) NOT NULL,
  PRIMARY KEY (manufacturer_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS oc_manufacturer_to_store (
  manufacturer_id int(11) NOT NULL,
  store_id int(11) NOT NULL,
  PRIMARY KEY (manufacturer_id,store_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS oc_marketing (
  marketing_id int(11) NOT NULL AUTO_INCREMENT,
  name varchar(32) NOT NULL,
  description text NOT NULL,
  code varchar(64) NOT NULL,
  clicks int(5) NOT NULL DEFAULT 0,
  date_added datetime NOT NULL,
  PRIMARY KEY (marketing_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS oc_modification (
  modification_id int(11) NOT NULL AUTO_INCREMENT,
  name varchar(64) NOT NULL,
  code varchar(64) NOT NULL,
  author varchar(64) NOT NULL,
  version varchar(32) NOT NULL,
  link varchar(255) NOT NULL,
  xml text NOT NULL,
  status tinyint(1) NOT NULL,
  date_added datetime NOT NULL,
  PRIMARY KEY (modification_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS oc_module (
  module_id int(11) NOT NULL AUTO_INCREMENT,
  name varchar(64) NOT NULL,
  code varchar(32) NOT NULL,
  setting text NOT NULL,
  PRIMARY KEY (module_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS oc_option (
  option_id int(11) NOT NULL AUTO_INCREMENT,
  type varchar(32) NOT NULL,
  sort_order int(3) NOT NULL,
  PRIMARY KEY (option_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS oc_option_description (
  option_id int(11) NOT NULL,
  language_id int(11) NOT NULL,
  name varchar(128) NOT NULL,
  PRIMARY KEY (option_id,language_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS oc_option_value (
  option_value_id int(11) NOT NULL AUTO_INCREMENT,
  option_id int(11) NOT NULL,
  image varchar(255) NOT NULL,
  sort_order int(3) NOT NULL,
  PRIMARY KEY (option_value_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS oc_option_value_description (
  option_value_id int(11) NOT NULL,
  language_id int(11) NOT NULL,
  option_id int(11) NOT NULL,
  name varchar(128) NOT NULL,
  PRIMARY KEY (option_value_id,language_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS oc_order (
  order_id int(11) NOT NULL AUTO_INCREMENT,
  invoice_no int(11) NOT NULL DEFAULT 0,
  invoice_prefix varchar(26) NOT NULL,
  store_id int(11) NOT NULL DEFAULT 0,
  store_name varchar(64) NOT NULL,
  store_url varchar(255) NOT NULL,
  customer_id int(11) NOT NULL DEFAULT 0,
  customer_group_id int(11) NOT NULL DEFAULT 0,
  firstname varchar(32) NOT NULL,
  lastname varchar(32) NOT NULL,
  email varchar(96) NOT NULL,
  telephone varchar(32) NOT NULL,
  fax varchar(32) NOT NULL,
  custom_field text NOT NULL,
  payment_firstname varchar(32) NOT NULL,
  payment_lastname varchar(32) NOT NULL,
  payment_company varchar(40) NOT NULL,
  payment_address_1 varchar(128) NOT NULL,
  payment_address_2 varchar(128) NOT NULL,
  payment_city varchar(128) NOT NULL,
  payment_postcode varchar(10) NOT NULL,
  payment_country varchar(128) NOT NULL,
  payment_country_id int(11) NOT NULL,
  payment_zone varchar(128) NOT NULL,
  payment_zone_id int(11) NOT NULL,
  payment_address_format text NOT NULL,
  payment_custom_field text NOT NULL,
  payment_method varchar(128) NOT NULL,
  payment_code varchar(128) NOT NULL,
  shipping_firstname varchar(32) NOT NULL,
  shipping_lastname varchar(32) NOT NULL,
  shipping_company varchar(40) NOT NULL,
  shipping_address_1 varchar(128) NOT NULL,
  shipping_address_2 varchar(128) NOT NULL,
  shipping_city varchar(128) NOT NULL,
  shipping_postcode varchar(10) NOT NULL,
  shipping_country varchar(128) NOT NULL,
  shipping_country_id int(11) NOT NULL,
  shipping_zone varchar(128) NOT NULL,
  shipping_zone_id int(11) NOT NULL,
  shipping_address_format text NOT NULL,
  shipping_custom_field text NOT NULL,
  shipping_method varchar(128) NOT NULL,
  shipping_code varchar(128) NOT NULL,
  comment text NOT NULL,
  total decimal(15,4) NOT NULL DEFAULT 0.0000,
  order_status_id int(11) NOT NULL DEFAULT 0,
  affiliate_id int(11) NOT NULL,
  commission decimal(15,4) NOT NULL,
  marketing_id int(11) NOT NULL,
  tracking varchar(64) NOT NULL,
  language_id int(11) NOT NULL,
  currency_id int(11) NOT NULL,
  currency_code varchar(3) NOT NULL,
  currency_value decimal(15,8) NOT NULL DEFAULT 1.00000000,
  ip varchar(40) NOT NULL,
  forwarded_ip varchar(40) NOT NULL,
  user_agent varchar(255) NOT NULL,
  accept_language varchar(255) NOT NULL,
  date_added datetime NOT NULL,
  date_modified datetime NOT NULL,
  PRIMARY KEY (order_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS oc_order_custom_field (
  order_custom_field_id int(11) NOT NULL AUTO_INCREMENT,
  order_id int(11) NOT NULL,
  custom_field_id int(11) NOT NULL,
  custom_field_value_id int(11) NOT NULL,
  name varchar(255) NOT NULL,
  value text NOT NULL,
  type varchar(32) NOT NULL,
  location varchar(16) NOT NULL,
  PRIMARY KEY (order_custom_field_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS oc_order_fraud (
  order_id int(11) NOT NULL,
  customer_id int(11) NOT NULL,
  country_match varchar(3) NOT NULL,
  country_code varchar(2) NOT NULL,
  high_risk_country varchar(3) NOT NULL,
  distance int(11) NOT NULL,
  ip_region varchar(255) NOT NULL,
  ip_city varchar(255) NOT NULL,
  ip_latitude decimal(10,6) NOT NULL,
  ip_longitude decimal(10,6) NOT NULL,
  ip_isp varchar(255) NOT NULL,
  ip_org varchar(255) NOT NULL,
  ip_asnum int(11) NOT NULL,
  ip_user_type varchar(255) NOT NULL,
  ip_country_confidence varchar(3) NOT NULL,
  ip_region_confidence varchar(3) NOT NULL,
  ip_city_confidence varchar(3) NOT NULL,
  ip_postal_confidence varchar(3) NOT NULL,
  ip_postal_code varchar(10) NOT NULL,
  ip_accuracy_radius int(11) NOT NULL,
  ip_net_speed_cell varchar(255) NOT NULL,
  ip_metro_code int(3) NOT NULL,
  ip_area_code int(3) NOT NULL,
  ip_time_zone varchar(255) NOT NULL,
  ip_region_name varchar(255) NOT NULL,
  ip_domain varchar(255) NOT NULL,
  ip_country_name varchar(255) NOT NULL,
  ip_continent_code varchar(2) NOT NULL,
  ip_corporate_proxy varchar(3) NOT NULL,
  anonymous_proxy varchar(3) NOT NULL,
  proxy_score int(3) NOT NULL,
  is_trans_proxy varchar(3) NOT NULL,
  free_mail varchar(3) NOT NULL,
  carder_email varchar(3) NOT NULL,
  high_risk_username varchar(3) NOT NULL,
  high_risk_password varchar(3) NOT NULL,
  bin_match varchar(10) NOT NULL,
  bin_country varchar(2) NOT NULL,
  bin_name_match varchar(3) NOT NULL,
  bin_name varchar(255) NOT NULL,
  bin_phone_match varchar(3) NOT NULL,
  bin_phone varchar(32) NOT NULL,
  customer_phone_in_billing_location varchar(8) NOT NULL,
  ship_forward varchar(3) NOT NULL,
  city_postal_match varchar(3) NOT NULL,
  ship_city_postal_match varchar(3) NOT NULL,
  score decimal(10,5) NOT NULL,
  explanation text NOT NULL,
  risk_score decimal(10,5) NOT NULL,
  queries_remaining int(11) NOT NULL,
  maxmind_id varchar(8) NOT NULL,
  error text NOT NULL,
  date_added datetime NOT NULL,
  PRIMARY KEY (order_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS oc_order_history (
  order_history_id int(11) NOT NULL AUTO_INCREMENT,
  order_id int(11) NOT NULL,
  order_status_id int(5) NOT NULL,
  notify tinyint(1) NOT NULL DEFAULT 0,
  comment text NOT NULL,
  date_added datetime NOT NULL,
  PRIMARY KEY (order_history_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS oc_order_option (
  order_option_id int(11) NOT NULL AUTO_INCREMENT,
  order_id int(11) NOT NULL,
  order_product_id int(11) NOT NULL,
  product_option_id int(11) NOT NULL,
  product_option_value_id int(11) NOT NULL DEFAULT 0,
  name varchar(255) NOT NULL,
  value text NOT NULL,
  type varchar(32) NOT NULL,
  PRIMARY KEY (order_option_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS oc_order_product (
  order_product_id int(11) NOT NULL AUTO_INCREMENT,
  order_id int(11) NOT NULL,
  product_id int(11) NOT NULL,
  name varchar(255) NOT NULL,
  model varchar(64) NOT NULL,
  quantity int(4) NOT NULL,
  price decimal(15,4) NOT NULL DEFAULT 0.0000,
  total decimal(15,4) NOT NULL DEFAULT 0.0000,
  tax decimal(15,4) NOT NULL DEFAULT 0.0000,
  reward int(8) NOT NULL,
  PRIMARY KEY (order_product_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS oc_order_recurring (
  order_recurring_id int(11) NOT NULL AUTO_INCREMENT,
  order_id int(11) NOT NULL,
  reference varchar(255) NOT NULL,
  product_id int(11) NOT NULL,
  product_name varchar(255) NOT NULL,
  product_quantity int(11) NOT NULL,
  recurring_id int(11) NOT NULL,
  recurring_name varchar(255) NOT NULL,
  recurring_description varchar(255) NOT NULL,
  recurring_frequency varchar(25) NOT NULL,
  recurring_cycle smallint(6) NOT NULL,
  recurring_duration smallint(6) NOT NULL,
  recurring_price decimal(10,4) NOT NULL,
  trial tinyint(1) NOT NULL,
  trial_frequency varchar(25) NOT NULL,
  trial_cycle smallint(6) NOT NULL,
  trial_duration smallint(6) NOT NULL,
  trial_price decimal(10,4) NOT NULL,
  status tinyint(4) NOT NULL,
  date_added datetime NOT NULL,
  PRIMARY KEY (order_recurring_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS oc_order_recurring_transaction (
  order_recurring_transaction_id int(11) NOT NULL AUTO_INCREMENT,
  order_recurring_id int(11) NOT NULL,
  reference varchar(255) NOT NULL,
  type varchar(255) NOT NULL,
  amount decimal(10,4) NOT NULL,
  date_added datetime NOT NULL,
  PRIMARY KEY (order_recurring_transaction_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS oc_order_status (
  order_status_id int(11) NOT NULL AUTO_INCREMENT,
  language_id int(11) NOT NULL,
  name varchar(32) NOT NULL,
  PRIMARY KEY (order_status_id,language_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS oc_order_total (
  order_total_id int(10) NOT NULL AUTO_INCREMENT,
  order_id int(11) NOT NULL,
  code varchar(32) NOT NULL,
  title varchar(255) NOT NULL,
  value decimal(15,4) NOT NULL DEFAULT 0.0000,
  sort_order int(3) NOT NULL,
  PRIMARY KEY (order_total_id),
  KEY order_id (order_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS oc_order_voucher (
  order_voucher_id int(11) NOT NULL AUTO_INCREMENT,
  order_id int(11) NOT NULL,
  voucher_id int(11) NOT NULL,
  description varchar(255) NOT NULL,
  code varchar(10) NOT NULL,
  from_name varchar(64) NOT NULL,
  from_email varchar(96) NOT NULL,
  to_name varchar(64) NOT NULL,
  to_email varchar(96) NOT NULL,
  voucher_theme_id int(11) NOT NULL,
  message text NOT NULL,
  amount decimal(15,4) NOT NULL,
  PRIMARY KEY (order_voucher_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS oc_product (
  product_id int(11) NOT NULL AUTO_INCREMENT,
  model varchar(64) NOT NULL,
  sku varchar(64) NOT NULL,
  upc varchar(12) NOT NULL,
  ean varchar(14) NOT NULL,
  jan varchar(13) NOT NULL,
  isbn varchar(17) NOT NULL,
  mpn varchar(64) NOT NULL,
  location varchar(128) NOT NULL,
  quantity int(4) NOT NULL DEFAULT 0,
  stock_status_id int(11) NOT NULL,
  image varchar(255) DEFAULT NULL,
  manufacturer_id int(11) NOT NULL,
  shipping tinyint(1) NOT NULL DEFAULT 1,
  price decimal(15,4) NOT NULL DEFAULT 0.0000,
  points int(8) NOT NULL DEFAULT 0,
  tax_class_id int(11) NOT NULL,
  date_available date NOT NULL DEFAULT '0000-00-00',
  weight decimal(15,8) NOT NULL DEFAULT 0.00000000,
  weight_class_id int(11) NOT NULL DEFAULT 0,
  length decimal(15,8) NOT NULL DEFAULT 0.00000000,
  width decimal(15,8) NOT NULL DEFAULT 0.00000000,
  height decimal(15,8) NOT NULL DEFAULT 0.00000000,
  length_class_id int(11) NOT NULL DEFAULT 0,
  subtract tinyint(1) NOT NULL DEFAULT 1,
  minimum int(11) NOT NULL DEFAULT 1,
  sort_order int(11) NOT NULL DEFAULT 0,
  status tinyint(1) NOT NULL DEFAULT 0,
  viewed int(5) NOT NULL DEFAULT 0,
  date_added datetime NOT NULL,
  date_modified datetime NOT NULL,
  PRIMARY KEY (product_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS oc_product_attribute (
  product_id int(11) NOT NULL,
  attribute_id int(11) NOT NULL,
  language_id int(11) NOT NULL,
  text text NOT NULL,
  PRIMARY KEY (product_id,attribute_id,language_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS oc_product_description (
  product_id int(11) NOT NULL,
  language_id int(11) NOT NULL,
  name varchar(255) NOT NULL,
  description text NOT NULL,
  tag text NOT NULL,
  meta_title varchar(255) NOT NULL,
  meta_description varchar(255) NOT NULL,
  meta_keyword varchar(255) NOT NULL,
  PRIMARY KEY (product_id,language_id),
  KEY name (name)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS oc_product_discount (
  product_discount_id int(11) NOT NULL AUTO_INCREMENT,
  product_id int(11) NOT NULL,
  customer_group_id int(11) NOT NULL,
  quantity int(4) NOT NULL DEFAULT 0,
  priority int(5) NOT NULL DEFAULT 1,
  price decimal(15,4) NOT NULL DEFAULT 0.0000,
  date_start date NOT NULL DEFAULT '0000-00-00',
  date_end date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (product_discount_id),
  KEY product_id (product_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS oc_product_filter (
  product_id int(11) NOT NULL,
  filter_id int(11) NOT NULL,
  PRIMARY KEY (product_id,filter_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS oc_product_image (
  product_image_id int(11) NOT NULL AUTO_INCREMENT,
  product_id int(11) NOT NULL,
  image varchar(255) DEFAULT NULL,
  sort_order int(3) NOT NULL DEFAULT 0,
  PRIMARY KEY (product_image_id),
  KEY product_id (product_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS oc_product_option (
  product_option_id int(11) NOT NULL AUTO_INCREMENT,
  product_id int(11) NOT NULL,
  option_id int(11) NOT NULL,
  value text NOT NULL,
  required tinyint(1) NOT NULL,
  PRIMARY KEY (product_option_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS oc_product_option_value (
  product_option_value_id int(11) NOT NULL AUTO_INCREMENT,
  product_option_id int(11) NOT NULL,
  product_id int(11) NOT NULL,
  option_id int(11) NOT NULL,
  option_value_id int(11) NOT NULL,
  quantity int(3) NOT NULL,
  subtract tinyint(1) NOT NULL,
  price decimal(15,4) NOT NULL,
  price_prefix varchar(1) NOT NULL,
  points int(8) NOT NULL,
  points_prefix varchar(1) NOT NULL,
  weight decimal(15,8) NOT NULL,
  weight_prefix varchar(1) NOT NULL,
  PRIMARY KEY (product_option_value_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS oc_product_recurring (
  product_id int(11) NOT NULL,
  recurring_id int(11) NOT NULL,
  customer_group_id int(11) NOT NULL,
  PRIMARY KEY (product_id,recurring_id,customer_group_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS oc_product_related (
  product_id int(11) NOT NULL,
  related_id int(11) NOT NULL,
  PRIMARY KEY (product_id,related_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS oc_product_reward (
  product_reward_id int(11) NOT NULL AUTO_INCREMENT,
  product_id int(11) NOT NULL DEFAULT 0,
  customer_group_id int(11) NOT NULL DEFAULT 0,
  points int(8) NOT NULL DEFAULT 0,
  PRIMARY KEY (product_reward_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS oc_product_special (
  product_special_id int(11) NOT NULL AUTO_INCREMENT,
  product_id int(11) NOT NULL,
  customer_group_id int(11) NOT NULL,
  priority int(5) NOT NULL DEFAULT 1,
  price decimal(15,4) NOT NULL DEFAULT 0.0000,
  date_start date NOT NULL DEFAULT '0000-00-00',
  date_end date NOT NULL DEFAULT '0000-00-00',
  PRIMARY KEY (product_special_id),
  KEY product_id (product_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS oc_product_to_category (
  product_id int(11) NOT NULL,
  category_id int(11) NOT NULL,
  PRIMARY KEY (product_id,category_id),
  KEY category_id (category_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS oc_product_to_download (
  product_id int(11) NOT NULL,
  download_id int(11) NOT NULL,
  PRIMARY KEY (product_id,download_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS oc_product_to_layout (
  product_id int(11) NOT NULL,
  store_id int(11) NOT NULL,
  layout_id int(11) NOT NULL,
  PRIMARY KEY (product_id,store_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS oc_product_to_store (
  product_id int(11) NOT NULL,
  store_id int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (product_id,store_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS oc_recurring (
  recurring_id int(11) NOT NULL AUTO_INCREMENT,
  price decimal(10,4) NOT NULL,
  frequency enum('day','week','semi_month','month','year') NOT NULL,
  duration int(10) unsigned NOT NULL,
  cycle int(10) unsigned NOT NULL,
  trial_status tinyint(4) NOT NULL,
  trial_price decimal(10,4) NOT NULL,
  trial_frequency enum('day','week','semi_month','month','year') NOT NULL,
  trial_duration int(10) unsigned NOT NULL,
  trial_cycle int(10) unsigned NOT NULL,
  status tinyint(4) NOT NULL,
  sort_order int(11) NOT NULL,
  PRIMARY KEY (recurring_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS oc_recurring_description (
  recurring_id int(11) NOT NULL,
  language_id int(11) NOT NULL,
  name varchar(255) NOT NULL,
  PRIMARY KEY (recurring_id,language_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS oc_return (
  return_id int(11) NOT NULL AUTO_INCREMENT,
  order_id int(11) NOT NULL,
  product_id int(11) NOT NULL,
  customer_id int(11) NOT NULL,
  firstname varchar(32) NOT NULL,
  lastname varchar(32) NOT NULL,
  email varchar(96) NOT NULL,
  telephone varchar(32) NOT NULL,
  product varchar(255) NOT NULL,
  model varchar(64) NOT NULL,
  quantity int(4) NOT NULL,
  opened tinyint(1) NOT NULL,
  return_reason_id int(11) NOT NULL,
  return_action_id int(11) NOT NULL,
  return_status_id int(11) NOT NULL,
  comment text,
  date_ordered date NOT NULL DEFAULT '0000-00-00',
  date_added datetime NOT NULL,
  date_modified datetime NOT NULL,
  PRIMARY KEY (return_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS oc_return_action (
  return_action_id int(11) NOT NULL AUTO_INCREMENT,
  language_id int(11) NOT NULL DEFAULT 0,
  name varchar(64) NOT NULL,
  PRIMARY KEY (return_action_id,language_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS oc_return_history (
  return_history_id int(11) NOT NULL AUTO_INCREMENT,
  return_id int(11) NOT NULL,
  return_status_id int(11) NOT NULL,
  notify tinyint(1) NOT NULL,
  comment text NOT NULL,
  date_added datetime NOT NULL,
  PRIMARY KEY (return_history_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS oc_return_reason (
  return_reason_id int(11) NOT NULL AUTO_INCREMENT,
  language_id int(11) NOT NULL DEFAULT 0,
  name varchar(128) NOT NULL,
  PRIMARY KEY (return_reason_id,language_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS oc_return_status (
  return_status_id int(11) NOT NULL AUTO_INCREMENT,
  language_id int(11) NOT NULL DEFAULT 0,
  name varchar(32) NOT NULL,
  PRIMARY KEY (return_status_id,language_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS oc_review (
  review_id int(11) NOT NULL AUTO_INCREMENT,
  product_id int(11) NOT NULL,
  customer_id int(11) NOT NULL,
  author varchar(64) NOT NULL,
  text text NOT NULL,
  rating int(1) NOT NULL,
  status tinyint(1) NOT NULL DEFAULT 0,
  date_added datetime NOT NULL,
  date_modified datetime NOT NULL,
  PRIMARY KEY (review_id),
  KEY product_id (product_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS oc_setting (
  setting_id int(11) NOT NULL AUTO_INCREMENT,
  store_id int(11) NOT NULL DEFAULT 0,
  code varchar(32) NOT NULL,
  `key` varchar(64) NOT NULL,
  value text NOT NULL,
  serialized tinyint(1) NOT NULL,
  PRIMARY KEY (setting_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS oc_stock_status (
  stock_status_id int(11) NOT NULL AUTO_INCREMENT,
  language_id int(11) NOT NULL,
  name varchar(32) NOT NULL,
  PRIMARY KEY (stock_status_id,language_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS oc_store (
  store_id int(11) NOT NULL AUTO_INCREMENT,
  name varchar(64) NOT NULL,
  url varchar(255) NOT NULL,
  `ssl` varchar(255) NOT NULL,
  PRIMARY KEY (store_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS oc_tax_class (
  tax_class_id int(11) NOT NULL AUTO_INCREMENT,
  title varchar(32) NOT NULL,
  description varchar(255) NOT NULL,
  date_added datetime NOT NULL,
  date_modified datetime NOT NULL,
  PRIMARY KEY (tax_class_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS oc_tax_rate (
  tax_rate_id int(11) NOT NULL AUTO_INCREMENT,
  geo_zone_id int(11) NOT NULL DEFAULT 0,
  name varchar(32) NOT NULL,
  rate decimal(15,4) NOT NULL DEFAULT 0.0000,
  type char(1) NOT NULL,
  date_added datetime NOT NULL,
  date_modified datetime NOT NULL,
  PRIMARY KEY (tax_rate_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS oc_tax_rate_to_customer_group (
  tax_rate_id int(11) NOT NULL,
  customer_group_id int(11) NOT NULL,
  PRIMARY KEY (tax_rate_id,customer_group_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS oc_tax_rule (
  tax_rule_id int(11) NOT NULL AUTO_INCREMENT,
  tax_class_id int(11) NOT NULL,
  tax_rate_id int(11) NOT NULL,
  based varchar(10) NOT NULL,
  priority int(5) NOT NULL DEFAULT 1,
  PRIMARY KEY (tax_rule_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS oc_upload (
  upload_id int(11) NOT NULL AUTO_INCREMENT,
  name varchar(255) NOT NULL,
  filename varchar(255) NOT NULL,
  code varchar(255) NOT NULL,
  date_added datetime NOT NULL,
  PRIMARY KEY (upload_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS oc_url_alias (
  url_alias_id int(11) NOT NULL AUTO_INCREMENT,
  query varchar(255) NOT NULL,
  keyword varchar(255) NOT NULL,
  PRIMARY KEY (url_alias_id),
  KEY query (query),
  KEY keyword (keyword)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS oc_user (
  user_id int(11) NOT NULL AUTO_INCREMENT,
  user_group_id int(11) NOT NULL,
  username varchar(20) NOT NULL,
  password varchar(40) NOT NULL,
  salt varchar(9) NOT NULL,
  firstname varchar(32) NOT NULL,
  lastname varchar(32) NOT NULL,
  email varchar(96) NOT NULL,
  image varchar(255) NOT NULL,
  code varchar(40) NOT NULL,
  ip varchar(40) NOT NULL,
  status tinyint(1) NOT NULL,
  date_added datetime NOT NULL,
  PRIMARY KEY (user_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS oc_user_group (
  user_group_id int(11) NOT NULL AUTO_INCREMENT,
  name varchar(64) NOT NULL,
  permission text NOT NULL,
  PRIMARY KEY (user_group_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS oc_voucher (
  voucher_id int(11) NOT NULL AUTO_INCREMENT,
  order_id int(11) NOT NULL,
  code varchar(10) NOT NULL,
  from_name varchar(64) NOT NULL,
  from_email varchar(96) NOT NULL,
  to_name varchar(64) NOT NULL,
  to_email varchar(96) NOT NULL,
  voucher_theme_id int(11) NOT NULL,
  message text NOT NULL,
  amount decimal(15,4) NOT NULL,
  status tinyint(1) NOT NULL,
  date_added datetime NOT NULL,
  PRIMARY KEY (voucher_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS oc_voucher_history (
  voucher_history_id int(11) NOT NULL AUTO_INCREMENT,
  voucher_id int(11) NOT NULL,
  order_id int(11) NOT NULL,
  amount decimal(15,4) NOT NULL,
  date_added datetime NOT NULL,
  PRIMARY KEY (voucher_history_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS oc_voucher_theme (
  voucher_theme_id int(11) NOT NULL AUTO_INCREMENT,
  image varchar(255) NOT NULL,
  PRIMARY KEY (voucher_theme_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS oc_voucher_theme_description (
  voucher_theme_id int(11) NOT NULL,
  language_id int(11) NOT NULL,
  name varchar(32) NOT NULL,
  PRIMARY KEY (voucher_theme_id,language_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS oc_weight_class (
  weight_class_id int(11) NOT NULL AUTO_INCREMENT,
  value decimal(15,8) NOT NULL DEFAULT 0.00000000,
  PRIMARY KEY (weight_class_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS oc_weight_class_description (
  weight_class_id int(11) NOT NULL AUTO_INCREMENT,
  language_id int(11) NOT NULL,
  title varchar(32) NOT NULL,
  unit varchar(4) NOT NULL,
  PRIMARY KEY (weight_class_id,language_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS oc_zone (
  zone_id int(11) NOT NULL AUTO_INCREMENT,
  country_id int(11) NOT NULL,
  name varchar(128) NOT NULL,
  code varchar(32) NOT NULL,
  status tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (zone_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS oc_zone_to_geo_zone (
  zone_to_geo_zone_id int(11) NOT NULL AUTO_INCREMENT,
  country_id int(11) NOT NULL,
  zone_id int(11) NOT NULL DEFAULT 0,
  geo_zone_id int(11) NOT NULL,
  date_added datetime NOT NULL,
  date_modified datetime NOT NULL,
  PRIMARY KEY (zone_to_geo_zone_id)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;