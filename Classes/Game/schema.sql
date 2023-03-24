CREATE TABLE Game (
    id SERIAL PRIMARY KEY,
    genre_id INTEGER,
    label_id INTEGER,
    author_id INTEGER,
    source_id INTEGER,
    archived BOOLEAN,
    multiplayer VARCHAR(5)
    last_played_at DATE,
    FOREIGN KEY (genre_id) REFERENCES Genre (id),
    FOREIGN KEY (author_id) REFERENCES Authors (id),
    FOREIGN KEY (label_id) REFERENCES Label (id),
);

CREATE TABLE Authors(
    id SERIAL PRIMARY KEY AUTOINCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
);