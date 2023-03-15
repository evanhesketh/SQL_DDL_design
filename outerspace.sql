CREATE TABLE stars (
    name TEXT PRIMARY KEY,
    temp_in_k INT NOT NULL
);

CREATE TABLE planets (
    name TEXT PRIMARY KEY,
    period_in_yrs FLOAT NOT NULL,
    star TEXT NOT NULL REFERENCES stars,
    UNIQUE(name, star)
);

CREATE TABLE moons (
    name TEXT PRIMARY KEY,
    planet TEXT NOT NULL REFERENCES planets,
    UNIQUE(name, planet)
);


INSERT INTO stars (name, temp_in_k)
    VALUES
        ('The Sun', 5800),
        ('Proxima Centauri', 3042),
        ('Gliese 876', 3192);

INSERT INTO planets (name, period_in_yrs, star)
    VALUES
        ('Earth', 1.00, 'The Sun'),
        ('Mars', 1.882, 'The Sun'),
        ('Venus', 0.62, 'The Sun'),
        ('Proxima Centauri b', 0.03, 'Proxima Centauri'),
        ('Gliese 876 b', 0.236, 'Gliese 876');


INSERT INTO moons (name, planet)
    VALUES
        ('The Moon', 'Earth'),
        ('Phobos', 'Mars'),
        ('Deimos', 'Mars');


-- Query --

SELECT planets.name AS planet, star, COUNT(moons.name) as moon_count
    FROM planets
        LEFT OUTER JOIN stars
            ON stars.name = planets.star
        LEFT OUTER JOIN moons
            ON moons.planet = planets.name
    GROUP BY planets.name
    ORDER BY planets.name;
