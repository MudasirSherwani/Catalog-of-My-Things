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