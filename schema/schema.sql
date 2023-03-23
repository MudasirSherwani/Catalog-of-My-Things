
CREATE TABLE item(
  id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  publish_date Date,
  genre_id INT,
  Author_id INT,
  lable_id INT,
  archived BOOLEAN,
  FOREIGN KEY (author_id) REFERENCES Authors (id),
    FOREIGN KEY (label_id) REFERENCES Label (id),
    FOREIGN KEY (genre_id) REFERENCES genre (id),
);

CREATE TABLE Label(
    id SERIAL PRIMARY KEY,
    title VARCHAR(50),
    color VARCHAR(50)
);

CREATE TABLE Book (
    id SERIAL PRIMARY KEY,
    item_id INTEGER,
    publisher VARCHAR(100),
    cover_state VARCHAR(50),
    label_id INTEGER,
    publish_date DATE,
    archived BOOLEAN,
    FOREIGN KEY (label_id) REFERENCES Label (id),
    FOREIGN KEY (item_id) REFERENCES item (id),
);


CREATE TABLE Game (
    id SERIAL PRIMARY KEY,
    item_id INTEGER NOT NULL,
    archived BOOLEAN,
    multiplayer VARCHAR(5)
    last_played_at DATE,
    FOREIGN KEY (item_id) REFERENCES item (id),
);

CREATE TABLE Authors(
    id SERIAL PRIMARY KEY AUTOINCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
);

CREATE TABLE genre(
  id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  genre_name VARCHAR(50)
);

CREATE TABLE music_album(
  id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  genre_id INT,
  publish_date DATE,
  archived BOOLEAN,
  on_spotify BOOLEAN,
  item_id INT NOT NULL,

  CONSTRAINT fk_item
      FOREIGN KEY (item_id)
      REFERENCES item (id)
      ON DELETE CASCADE
);

-- create indexes for foreign keys
CREATE INDEX item_genre_id_idx ON item (genre_id);
CREATE INDEX item_author_id_idx ON item (author_id);
CREATE INDEX item_label_id_idx ON item (label_id);
CREATE INDEX book_item_id_idx ON book (item_id);
CREATE INDEX book_label_id_idx ON book (label_id);
CREATE INDEX game_item_id_idx ON game (item_id);
CREATE INDEX music_album_genre_id_idx ON music_album (genre_id);
CREATE INDEX music_album_item_id_idx ON music_album (item_id);

