CREATE TABLE stars (
    name TEXT PRIMARY KEY,
    temperature INT NOT NULL
);

CREATE TABLE planets (
    name TEXT PRIMARY KEY,
    period FLOAT NOT NULL,
    star TEXT NOT NULL REFERENCES stars,
    UNIQUE(name, star)
);

CREATE TABLE moons (
    name TEXT PRIMARY KEY,
    planet TEXT NOT NULL REFERENCES planets,
    UNIQUE(name, planet)
);


INSERT INTO stars (name, temperature)
    VALUES
    ('The Sun', 5800);

INSERT INTO planets (name, period, star)
    VALUES
    ('Earth', 1.00, 'The Sun');

INSERT INTO moons (name, planet)
    VALUES
    ('The Moon', 'Earth');