DROP TABLE pizzas;

CREATE TABLE pizzas(
  id SERIAL4 primary key,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  toppings VARCHAR(255),
  quantity INT2
);

