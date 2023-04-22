CREATE TABLE users (
  user_id INTEGER PRIMARY KEY,
  first_name VARCHAR(200) NOT NULL,
  last_name VARCHAR(200) NOT NULL,
  email VARCHAR(200) UNIQUE NOT NULL,
  password VARCHAR(60) NOT NULL,
  organization VARCHAR(200) NOT NULL,
  user_role VARCHAR(50) NOT NULL
);

CREATE TABLE team (
  team_id INTEGER PRIMARY KEY,
  name VARCHAR(200) NOT NULL,
  description VARCHAR(200)
);

CREATE TABLE team_member (
  team_member_id INTEGER PRIMARY KEY, 
  user_id INTEGER,
  team_id INTEGER
);

CREATE TABLE address (
  address_id INTEGER PRIMARY KEY,
  uf VARCHAR(2) NOT NULL,
  city VARCHAR(200) NOT NULL,
  cep VARCHAR(8) NOT NULL,
  street VARCHAR(200) NOT NULL,
  district VARCHAR(200) NOT NULL,
  number INTEGER NOT NULL,
  reference VARCHAR(200)
);

CREATE TABLE client (
  client_id INTEGER PRIMARY KEY,
  first_name VARCHAR(200) NOT NULL,
  last_name VARCHAR(200) NOT NULL,
  cpf VARCHAR(11) UNIQUE NOT NULL,
  phone_number VARCHAR(11) UNIQUE NOT NULL,
  address_id INTEGER NOT NULL
);

CREATE TABLE product (
  product_id INTEGER PRIMARY KEY,
  client_id INTEGER NOT NULL,
  product_type_id INTEGER
);

CREATE TABLE product_type (
  product_type_id INTEGER PRIMARY KEY,
  description VARCHAR(200) NOT NULL
);

CREATE TABLE task (
  task_id INTEGER PRIMARY KEY,
  client_id INTEGER NOT NULL,
  deadline DATE,
  team_member_id INTEGER,
  task_status INTEGER NOT NULL,
  total_price DECIMAL(8, 2)
);

CREATE TABLE task_type (
  task_type_id INTEGER PRIMARY KEY,
  description VARCHAR(200) NOT NULL
);

CREATE TABLE task_item (
  task_item_id INTEGER PRIMARY KEY,
  task_id INTEGER NOT NULL,
  product_id INTEGER NOT NULL,
  task_type_id INTEGER,
  description TEXT,
  task_status_id INTEGER NOT NULL,
  price DECIMAL(8, 2)
);

ALTER TABLE team_member ADD FOREIGN KEY (user_id) REFERENCES user(user_id);
ALTER TABLE team_member ADD FOREIGN KEY (team_id) REFERENCES team(team_id);

ALTER TABLE client ADD FOREIGN KEY (address_id) REFERENCES address(address_id);

ALTER TABLE product ADD FOREIGN KEY (client_id) REFERENCES client(client_id);
ALTER TABLE product ADD FOREIGN KEY (product_type_id) REFERENCES product_type(product_type_id);

ALTER TABLE task ADD FOREIGN KEY (client_id) REFERENCES client(client_id);
ALTER TABLE task ADD FOREIGN KEY (team_member_id) REFERENCES team_member(user_id);

ALTER TABLE task_item ADD FOREIGN KEY (task_id) REFERENCES task(task_id);
ALTER TABLE task_item ADD FOREIGN KEY (product_id) REFERENCES product(product_id);
ALTER TABLE task_item ADD FOREIGN KEY (task_type_id) REFERENCES task_type(task_type_id);

CREATE SEQUENCE user_sequence INCREMENT 1;
CREATE SEQUENCE address_sequence INCREMENT 1;
CREATE SEQUENCE team_sequence INCREMENT 1;
CREATE SEQUENCE client_sequence INCREMENT 1;
CREATE SEQUENCE product_sequence INCREMENT 1;
CREATE SEQUENCE product_type_sequence INCREMENT 1;
CREATE SEQUENCE task_sequence INCREMENT 1;
CREATE SEQUENCE task_type_sequence INCREMENT 1;
CREATE SEQUENCE task_product_sequence INCREMENT 1;
CREATE SEQUENCE team_member_sequence INCREMENT 1;
