CREATE TABLE customers (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(25) NOT NULL,
    last_name VARCHAR(25) NOT NULL
);

CREATE TABLE models (
    code TEXT PRIMARY KEY,
    name TEXT NOT NULL,
    base_cost NUMERIC(10, 2) NOT NULL,
    UNIQUE(code, name)
);

CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customers NOT NULL,
    order_time TIMESTAMP WITH TIME ZONE NOT NULL
);

CREATE TABLE items (
    id SERIAL PRIMARY KEY,
    order_id INT REFERENCES orders NOT NULL,
    model_code TEXT REFERENCES models NOT NULL,
    quantity INT NOT NULL,
    note TEXT NOT NULl
);