CREATE TABLE IF NOT EXISTS league (
          league_id SERIAL PRIMARY KEY,
          name VARCHAR(50) NOT NULL UNIQUE,
abbreviation VARCHAR(10) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS brand (
         brand_id SERIAL PRIMARY KEY,
         name VARCHAR(80) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS athlete (
           athlete_id SERIAL PRIMARY KEY,
           league_id INT NOT NULL REFERENCES league(league_id) ON DELETE RESTRICT,
full_name VARCHAR(120) NOT NULL,
active BOOLEAN DEFAULT TRUE,
CONSTRAINT uq_athlete UNIQUE (league_id, full_name)
);

CREATE TABLE IF NOT EXISTS tag (
       tag_id SERIAL PRIMARY KEY,
       label VARCHAR(50) NOT NULL UNIQUE,
status_type VARCHAR(20) DEFAULT 'Standard'
);

CREATE TABLE IF NOT EXISTS shoe (
        shoe_id SERIAL PRIMARY KEY,
        brand_id INT NOT NULL REFERENCES brand(brand_id) ON DELETE RESTRICT,
athlete_id INT NOT NULL REFERENCES athlete(athlete_id) ON DELETE CASCADE,
name VARCHAR(150) NOT NULL,
featured_image_url TEXT,
intro_year INT,
status_badge VARCHAR(30) DEFAULT 'Standard',
description TEXT,
espn_anchor VARCHAR(100),
created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
 );

CREATE TABLE IF NOT EXISTS shoe_tag (
            shoe_id INT NOT NULL REFERENCES shoe(shoe_id) ON DELETE CASCADE,
tag_id INT NOT NULL REFERENCES tag(tag_id) ON DELETE CASCADE,
PRIMARY KEY (shoe_id, tag_id)
);

CREATE TABLE IF NOT EXISTS shoe_model (
              model_id SERIAL PRIMARY KEY,
              shoe_id INT NOT NULL REFERENCES shoe(shoe_id) ON DELETE CASCADE,
model_name VARCHAR(150) NOT NULL,
release_year INT,
image_url TEXT
);

CREATE TABLE IF NOT EXISTS shoe_image (
              image_id SERIAL PRIMARY KEY,
              shoe_id INT NOT NULL REFERENCES shoe(shoe_id) ON DELETE CASCADE,
model_id INT REFERENCES shoe_model(model_id) ON DELETE SET NULL,
image_url TEXT NOT NULL,
image_type VARCHAR(30) DEFAULT 'gallery'
);