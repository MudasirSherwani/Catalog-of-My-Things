
CREATE TABLE Label(
    id SERIAL PRIMARY KEY,
    title VARCHAR(50),
    color VARCHAR(50)
);

CREATE TABLE Book (
    id SERIAL PRIMARY KEY,
    publisher VARCHAR(100),
    cover_state VARCHAR(50),
    author_id INTEGER,
    genre_id INTEGER,
    label_id INTEGER,
    publish_date DATE,
    archived BOOLEAN,
    FOREIGN KEY (genre_id) REFERENCES Genre (id),
    FOREIGN KEY (author_id) REFERENCES Authors (id),
    FOREIGN KEY (label_id) REFERENCES Label (id),
);



