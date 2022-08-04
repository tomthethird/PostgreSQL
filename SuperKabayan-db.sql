CREATE DATABASE superkabayandb;

CREATE TABLE countries(
  country_code varchar(2) primary key,
  country_name varchar(255) not null
);

CREATE TABLE users (
  user_id int primary key,
  email varchar(80) not null,
  firstname varchar(80) not null,
  lastname varchar(80) not null,
  birthdate date not null,
  phone int,
  ofwcountry varchar references countries(country_code),
  created_at date not null
);

CREATE TABLE login_infos (
  user_id int references users(user_id),
  username varchar(20) not null,
  userpassword varchar(255) not null,
  created_at date not null
);

CREATE TABLE savings_categories (
  category_name varchar(80) primary key
);

CREATE TABLE savings (
  user_id int references users(user_id),
  savings_id int primary key,
  savings_name varchar(80) not null,
  savings_category varchar(80) references savings_categories(category_name),
  savings_amount int not null
);

CREATE TABLE savings_transactions (
  transaction_id int primary key,
  user_id int references users(user_id),
  savings_id int references savings(savings_id),
  trans_amount int not null,
  created_at date not null
);

CREATE TABLE budget (
  user_id int references users(user_id),
  wallet_id int primary key,
  wallet_amount int
);

CREATE TABLE budget_income_categories (
  category_name varchar(80) primary key
);

CREATE TABLE budget_expense_categories (
  category_name varchar(80) primary key
);

CREATE TABLE budget_incomes (
  transaction_id int primary key,
  user_id int references users(user_id),
  wallet_id int references budget(wallet_id),
  income_category varchar(80) references budget_income_categories(category_name),
  income_name varchar(80) not null,
  amount int not null,
  created_at date not null
);

CREATE TABLE budget_expenses (
  transaction_id int primary key,
  user_id int references users(user_id),
  wallet_id int references budget(wallet_id),
  expense_category varchar(80) references budget_expense_categories(category_name),
  expense_name varchar(80) not null,
  amount int not null,
  created_at date not null
);

CREATE TABLE organizations (
  org_id int primary key,
  org_name varchar(80) not null
);

CREATE TABLE payment_interval (
  interval_type varchar(20) primary key
);

CREATE TABLE contributions (
  id int primary key,
  user_id int references users(user_id),
  org_id int references organizations(org_id),
  amount int not null,
  due_date date not null,
  set_interval varchar(20) references payment_interval(interval_type)
);