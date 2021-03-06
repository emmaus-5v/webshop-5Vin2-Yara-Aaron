--
-- create tables
--

DROP TABLE IF EXISTS products;
DROP TABLE IF EXISTS allergie;
DROP TABLE IF EXISTS product_allergie;
DROP TABLE IF EXISTS verpakking;
DROP TABLE IF EXISTS smaak;

-- Basis tabel PRODUCTS
CREATE TABLE products (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  code VARCHAR(15),
  name VARCHAR(255),
  description TEXT,
  price NUMERIC(10, 2),
  verpakking_id INTEGER,
  smaak_id INTEGER
);

-- Koppeltabel PRODUCT <> ALLERGIE --- n:m --- 1 product kan meerdere allergische ingerdienten hebben
CREATE TABLE product_allergie (
  product_id INTEGER,
  ingredient_id INTEGER
);

-- Basis tabel ALLERGIE
CREATE TABLE allergie (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  ingredient VARCHAR(255)
);

-- Basis tabel VERPAKKING --- 1:n -- 1 verpakking kan meerdere keren voorkomen in een andere tabel
CREATE TABLE verpakking (
  id INTEGER,
  vorm VARCHAR(25)
);

-- Basis tabel SMAAK --- 1:n -- 1 smaak kan meerdere keren voorkomen in een andere tabel
CREATE TABLE smaak (
  id INTEGER,
  taste VARCHAR(25)
);


--
-- populate with data
--
-- generared using
-- curl "https://api.mockaroo.com/api/910b6c20?count=100&key=90eac760" > seed.sql
--
-- want different data? check: https://www.mockaroo.com/910b6c20
--

-- Basis tabel SMAAK
insert into smaak (id, taste) values (10, 'vanilie');
insert into smaak (id, taste) values (20, 'chocolade');
insert into smaak (id, taste) values (30, 'overig');

-- Basis tabel VERPAKKING
insert into verpakking (id, vorm) values (100, 'zakje');
insert into verpakking (id, vorm) values (200, 'tube');
insert into verpakking (id, vorm) values (300, 'doos');

-- Basis tabel ALLERGIE
insert into allergie (ingredient) values ('Noten');
insert into allergie (ingredient) values ('Soja'); 
insert into allergie (ingredient) values ('Tarwe');
insert into allergie (ingredient) values ('Glutenbevattende Granen');
insert into allergie (ingredient) values ('Melk');

-- Basis tabel PRODUCTEN
insert into products (name, description, code, price, verpakking_id, smaak_id) values ('Oreo Original Cookies', 'Oreo is een uniek koekje met een heerlijke vanille cremevulling', '816905633-0', '1.89' , 300, 20);
insert into products (name, description, code, price, verpakking_id, smaak_id) values ('Oreo White Chocolate', 'Oreo omhuld met een heerlijke laag witte chocolade.', '077030122-3', '2.25', 300, 20);
insert into products (name, description, code, price, verpakking_id, smaak_id) values ('Oreo Milk Chocolate', 'Oreo omhuld met een heerlijke laag melkchocolade.', '445924201-X', '2.25', 300, 20);
insert into products (name, description, code, price, verpakking_id, smaak_id) values ('Oreo Golden', ' Oreo golden is een uniek koekje met een heerlijke vanille cremevulling..', '693155505-7', '1.45', 200, 10);
insert into products (name, description, code, price, verpakking_id, smaak_id) values ('Oreo Double creme', 'Oreo double stuffed, het unieke zwarte koekje met een dubbel zo dikke vanille cremevulling.', '686928463-6', '1.89', 300, 20);
insert into products (name, description, code, price, verpakking_id, smaak_id) values ('Oreo Crunchies original', 'Jouw geliefde Oreo koekjes in een handig bite-size formaat. Deze biscuits zijn de perfecte verhouding tussen een Crispy bite en een zachte, romige vulling.', '492662523-7', '1.59', 100, 20);
insert into products (name, description, code, price, verpakking_id, smaak_id) values ('Oreo Peanut Butter', 'Je vertrouwde Oreo koekje, met een verrassend lekkere vulling met pindakaassmaak.', '492687524-2','1.39', 300, 30);
insert into products (name, description, code, price, verpakking_id, smaak_id) values ('Oreo Lemon Cream', 'Oreo Lemon Cream, het unieke koekje met een citroen cremevulling.', '696948268-5', '1.29', 300, 30);
insert into products (name, description, code, price, verpakking_id, smaak_id) values ('Oreo Mint', 'Oreo mint, het unieke zwarte koekje met een heerlijke mint cremevulling.', '6868294698-8', '1.49', 200, 30);
insert into products (name, description, code, price, verpakking_id, smaak_id) values ('Oreo Gingerbread', 'De feestdagen zijn natuurlijk niet compleet zonder Gingerbread Oreo Cookies! Deze kerstkoekjes zijn gevuld met een creme met Crunchy Sugar Crystals en hebben een prachtig design voor de feestdagen.', '686928467-6', '1.89', 300, 30);

-- Koppeltabel PRODUCT <> ALLERGIE
insert into product_allergie (product_id, ingredient_id) select products.id, allergie.id FROM products, allergie WHERE products.name = 'Oreo Original Cookies' and allergie.ingredient='Soja';
insert into product_allergie (product_id, ingredient_id) select products.id, allergie.id FROM products, allergie WHERE products.name = 'Oreo Original Cookies' and allergie.ingredient='Tarwe';
insert into product_allergie (product_id, ingredient_id) select products.id, allergie.id FROM products, allergie WHERE products.name = 'Oreo Original Cookies' and allergie.ingredient='Glutenbevattende Granen';
insert into product_allergie (product_id, ingredient_id) select products.id, allergie.id FROM products, allergie WHERE products.name = 'Oreo Original Cookies' and allergie.ingredient='Melk';
insert into product_allergie (product_id, ingredient_id) select products.id, allergie.id FROM products, allergie WHERE products.name = 'Oreo White Chocolate' and allergie.ingredient='Soja';
insert into product_allergie (product_id, ingredient_id) select products.id, allergie.id FROM products, allergie WHERE products.name = 'Oreo White Chocolate' and allergie.ingredient='Tarwe';
insert into product_allergie (product_id, ingredient_id) select products.id, allergie.id FROM products, allergie WHERE products.name = 'Oreo White Chocolate' and allergie.ingredient='Glutenbevattende Granen';
insert into product_allergie (product_id, ingredient_id) select products.id, allergie.id FROM products, allergie WHERE products.name = 'Oreo White Chocolate' and allergie.ingredient='Melk';
insert into product_allergie (product_id, ingredient_id) select products.id, allergie.id FROM products, allergie WHERE products.name = 'Oreo Milk Chocolate' and allergie.ingredient='Soja';
insert into product_allergie (product_id, ingredient_id) select products.id, allergie.id FROM products, allergie WHERE products.name = 'Oreo Milk Chocolate' and allergie.ingredient='Tarwe';
insert into product_allergie (product_id, ingredient_id) select products.id, allergie.id FROM products, allergie WHERE products.name = 'Oreo Milk Chocolate' and allergie.ingredient='Glutenbevattende Granen';
insert into product_allergie (product_id, ingredient_id) select products.id, allergie.id FROM products, allergie WHERE products.name = 'Oreo Milk Chocolate' and allergie.ingredient='Melk';
insert into product_allergie (product_id, ingredient_id) select products.id, allergie.id FROM products, allergie WHERE products.name = 'Oreo Golden' and allergie.ingredient='Soja';
insert into product_allergie (product_id, ingredient_id) select products.id, allergie.id FROM products, allergie WHERE products.name = 'Oreo Golden' and allergie.ingredient='Tarwe';
insert into product_allergie (product_id, ingredient_id) select products.id, allergie.id FROM products, allergie WHERE products.name = 'Oreo Double creme' and allergie.ingredient='Soja';
insert into product_allergie (product_id, ingredient_id) select products.id, allergie.id FROM products, allergie WHERE products.name = 'Oreo Double creme' and allergie.ingredient='Tarwe';
insert into product_allergie (product_id, ingredient_id) select products.id, allergie.id FROM products, allergie WHERE products.name = 'Oreo Double creme' and allergie.ingredient='Glutenbevattende Granen';
insert into product_allergie (product_id, ingredient_id) select products.id, allergie.id FROM products, allergie WHERE products.name = 'Oreo Double creme' and allergie.ingredient='Melk';
insert into product_allergie (product_id, ingredient_id) select products.id, allergie.id FROM products, allergie WHERE products.name = 'Oreo Crunchies original' and allergie.ingredient='Soja';
insert into product_allergie (product_id, ingredient_id) select products.id, allergie.id FROM products, allergie WHERE products.name = 'Oreo Crunchies original' and allergie.ingredient='Glutenbevattende Granen';
insert into product_allergie (product_id, ingredient_id) select products.id, allergie.id FROM products, allergie WHERE products.name = 'Oreo Crunchies original' and allergie.ingredient='Melk';
insert into product_allergie (product_id, ingredient_id) select products.id, allergie.id FROM products, allergie WHERE products.name = 'Oreo Peanut Butter' and allergie.ingredient='Soja';
insert into product_allergie (product_id, ingredient_id) select products.id, allergie.id FROM products, allergie WHERE products.name = 'Oreo Peanut Butter' and allergie.ingredient='Glutenbevattende Granen';
insert into product_allergie (product_id, ingredient_id) select products.id, allergie.id FROM products, allergie WHERE products.name = 'Oreo Peanut Butter' and allergie.ingredient='Melk';
insert into product_allergie (product_id, ingredient_id) select products.id, allergie.id FROM products, allergie WHERE products.name = 'Oreo Lemon Cream' and allergie.ingredient='Soja';
insert into product_allergie (product_id, ingredient_id) select products.id, allergie.id FROM products, allergie WHERE products.name = 'Oreo Lemon Cream' and allergie.ingredient='Tarwe';
insert into product_allergie (product_id, ingredient_id) select products.id, allergie.id FROM products, allergie WHERE products.name = 'Oreo Mint' and allergie.ingredient='Soja';
insert into product_allergie (product_id, ingredient_id) select products.id, allergie.id FROM products, allergie WHERE products.name = 'Oreo Mint' and allergie.ingredient='Glutenbevattende Granen';
insert into product_allergie (product_id, ingredient_id) select products.id, allergie.id FROM products, allergie WHERE products.name = 'Oreo Mint' and allergie.ingredient='Melk';
insert into product_allergie (product_id, ingredient_id) select products.id, allergie.id FROM products, allergie WHERE products.name = 'Oreo Gingerbread' and allergie.ingredient='Soja';
insert into product_allergie (product_id, ingredient_id) select products.id, allergie.id FROM products, allergie WHERE products.name = 'Oreo Gingerbread' and allergie.ingredient='Tarwe';




