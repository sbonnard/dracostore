CREATE DATABASE dracostore;

CREATE TABLE category(
   id_category INT UNSIGNED NOT NULL AUTO_INCREMENT,
   category_name VARCHAR(150) NOT NULL,
   PRIMARY KEY(id_category)
);

CREATE TABLE client(
   id_client INT UNSIGNED NOT NULL AUTO_INCREMENT,
   lastname VARCHAR(50) NOT NULL,
   firstname VARCHAR(50) NOT NULL,
   email VARCHAR(150) NOT NULL,
   PRIMARY KEY(id_client),
   UNIQUE(email)
);

CREATE TABLE reward(
   id_reward INT UNSIGNED NOT NULL AUTO_INCREMENT,
   reward_name VARCHAR(150) NOT NULL,
   PRIMARY KEY(id_reward)
);

CREATE TABLE seller(
   id_users INT UNSIGNED NOT NULL AUTO_INCREMENT,
   seller_name VARCHAR(50) NOT NULL,
   password VARCHAR(255) NOT NULL,
   PRIMARY KEY(id_users),
   UNIQUE(seller_name)
);

CREATE TABLE tax(
   id_tax INT UNSIGNED NOT NULL AUTO_INCREMENT,
   percentage TINYINT NOT NULL,
   PRIMARY KEY(id_tax)
);

CREATE TABLE product(
   id_product INT UNSIGNED NOT NULL AUTO_INCREMENT,
   stock INT NOT NULL,
   product_name VARCHAR(150),
   price DECIMAL(15,1) NOT NULL,
   id_tax INT UNSIGNED NOT NULL,
   id_category INT UNSIGNED NOT NULL,
   PRIMARY KEY(id_product),
   FOREIGN KEY(id_tax) REFERENCES tax(id_tax),
   FOREIGN KEY(id_category) REFERENCES category(id_category)
);

CREATE TABLE ticket(
   id_ticket INT UNSIGNED NOT NULL AUTO_INCREMENT,
   ticket_date DATETIME NOT NULL,
   id_users INT UNSIGNED NOT NULL,
   id_reward INT UNSIGNED NOT NULL,
   id_client INT UNSIGNED NOT NULL,
   PRIMARY KEY(id_ticket),
   FOREIGN KEY(id_users) REFERENCES seller(id_users),
   FOREIGN KEY(id_reward) REFERENCES reward(id_reward),
   FOREIGN KEY(id_client) REFERENCES client(id_client)
);

CREATE TABLE update_price(
   id_update_price INT UNSIGNED NOT NULL AUTO_INCREMENT,
   date_ DATE NOT NULL,
   new_price DECIMAL(15,1) NOT NULL,
   id_product INT UNSIGNED NOT NULL,
   PRIMARY KEY(id_update_price),
   FOREIGN KEY(id_product) REFERENCES product(id_product)
);

CREATE TABLE sales(
   id_product INT UNSIGNED NOT NULL,
   id_ticket INT UNSIGNED NOT NULL,
   quantity INT UNSIGNED NOT NULL,
   PRIMARY KEY(id_product, id_ticket),
   FOREIGN KEY(id_product) REFERENCES product(id_product),
   FOREIGN KEY(id_ticket) REFERENCES ticket(id_ticket)
);


INSERT INTO category (category_name)
VALUES ('Magique'), ('Potion'), ('Arme'), ('Armure'), ('Bouclier'), ('Ingrédient'), ('Déco'), ('Services'), ('Artefact'), ('Familier'), ('Vêtement'), ('Nourriture');

INSERT INTO reward (reward_name)
VALUES ('Porte-clés à tête vaudou');

INSERT INTO seller (seller_name, password)
VALUES ('Alaric Stormbringer', '$2y$10$2eT3YVqqEMMvhn0Lkc00EuCcBGt3JXOvx/q/YsyRdxzi/LSKrQ/Ya');

INSERT INTO tax (percentage)
VALUES (13);

INSERT INTO product(stock, product_name, price, id_category)
VALUES 
(12, 'Porte-Clé Gourdin', 11.1, 7), 
(42, 'Slip Elfique', 0.3, 11), 
(7, 'Potion de visibilité', 1, 2), 
(49, 'Bile de Goule', 1.5, 6), 
(2, 'Épée émoussée', 32.3, 3),
(15, 'Bouclier Biscuit', 25.5, 5),
(8, 'Gallinule de compagnie', 8, 10),
(11, 'Gnôle Allume-Dragon', 1.5, 12),
(4, 'Élixir de Vie', 16.2, 2),
(78, 'Parchemin de Boule de Feu', 2.3, 1),
(1, 'Amulette de résurrection', 122, 9),
(51, 'Photo dédicacée de Sieur David le Hardi', 81.3, 9);

SELECT SUM(price*quantity) as total_price, id_ticket
FROM product
   JOIN sales USING (id_product)
   JOIN ticket USING (id_ticket)
WHERE id_ticket = 238
GROUP by id_ticket;

INSERT INTO `sales`(`id_product`, `id_ticket`, `quantity`) VALUES ('14','238','3');
