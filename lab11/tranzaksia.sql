
-- -- -- -- -- -- -- Lab 11
---------Task 1---------
CREATE OR REPLACE FUNCTION sum_or_rollback(a INT, b INT, c INT) RETURNS VOID AS $$
BEGIN
    IF c >= 0 THEN
        -- ���� ����� ��������������, �� ��������� ��
        RAISE NOTICE '����� % = %', c, a + b;
    ELSE
        -- ����� ���������� ����������
        RAISE EXCEPTION '������������� �����';
    END IF;
END;
$$ LANGUAGE plpgsql;

SELECT sum_or_rollback(10, 15, 7); -- ����� 22
SELECT sum_or_rollback(10, 15, -7); -- ������ "������������� �����"


---------Task 2---------
-- �������� ������ � ������� ��������, ���� �� ��������� ������� ������� � ����� ����������
CREATE OR REPLACE FUNCTION check_user_name() RETURNS TRIGGER AS $$
BEGIN
  IF NEW.last_name IS NULL THEN
    RAISE EXCEPTION 'Last name cannot be empty';
  END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER before_insert_customer
BEFORE INSERT ON users
FOR EACH ROW
EXECUTE FUNCTION check_user_name();


---------Task 3---------
--�������� ������ � ������� �������, ���� ���� ������������� �� ���������� �������, �������� ����������

-- �������� ������� �������
CREATE TABLE orders (
  order_id SERIAL PRIMARY KEY,
  customer_id INTEGER,
  order_date DATE,
  order_amount NUMERIC(10, 2),
  CONSTRAINT fk_customer FOREIGN KEY (customer_id) REFERENCES users (id)
);

-- �������� �������� ��� �������� �������������
CREATE OR REPLACE FUNCTION check_customer_debt() RETURNS TRIGGER AS $$
DECLARE
  total_debt NUMERIC(10, 2);
BEGIN
  SELECT SUM(order_amount) INTO total_debt FROM orders WHERE customer_id = NEW.customer_id;

  IF total_debt > 0 THEN
    RAISE EXCEPTION 'Cannot place new order. Customer has unpaid balance of %', total_debt;
  END IF;

  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER check_customer_debt
  BEFORE INSERT ON orders
  FOR EACH ROW
  EXECUTE FUNCTION check_customer_debt();

---------Task 4---------
---������� 1:

CREATE TABLE departments (
  id SERIAL PRIMARY KEY,
  name VARCHAR(50) NOT NULL
);

CREATE TABLE employees (
  id SERIAL PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  department_id INTEGER REFERENCES departments(id)
);

INSERT INTO departments (name) VALUES ('����� ������');
INSERT INTO departments (name) VALUES ('����� ����������');

INSERT INTO employees (name, department_id) VALUES ('������ ����', 1);
INSERT INTO employees (name, department_id) VALUES ('������ ����', 2);

--���������� ��� ���������� ������ ������ � ����������� � ����:
BEGIN;

INSERT INTO departments (name) VALUES ('����� ����������');
SELECT currval('departments_id_seq') INTO NEW_DEPARTMENT_ID;

INSERT INTO employees (name, department_id) VALUES ('������� �����', NEW_DEPARTMENT_ID);
INSERT INTO employees (name, department_id) VALUES ('������� ���������', NEW_DEPARTMENT_ID);

COMMIT;

---������� 2:

CREATE TABLE products (
  id SERIAL PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  price NUMERIC(10, 2) NOT NULL
);

CREATE TABLE orders (
  id SERIAL PRIMARY KEY,
  customer_name VARCHAR(50) NOT NULL,
  order_date DATE NOT NULL
);

CREATE TABLE order_products (
  order_id INTEGER REFERENCES orders(id),
  product_id INTEGER REFERENCES products(id),
  quantity INTEGER NOT NULL
);

INSERT INTO products (name, price) VALUES ('�������', 10000);
INSERT INTO products (name, price) VALUES ('�������', 50000);

INSERT INTO orders (customer_name, order_date) VALUES ('������ ����', '2022-01-01');

--���������� ��� ���������� ������ ������ � ������� � ����:

BEGIN;

INSERT INTO orders (customer_name, order_date) VALUES ('������ ����', '2022-02-01');
SELECT currval('orders_id_seq') INTO NEW_ORDER_ID;

INSERT INTO order_products (order_id, product_id, quantity) VALUES (NEW_ORDER_ID, 1, 2);
INSERT INTO order_products (order_id, product_id, quantity) VALUES (NEW_ORDER_ID, 2, 1);

COMMIT;