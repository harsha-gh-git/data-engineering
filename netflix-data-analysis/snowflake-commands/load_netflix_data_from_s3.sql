USE WAREHOUSE COMPUTE_WH;
USE DATABASE MOVIELENS;
USE SCHEMA RAW;

CREATE OR REPLACE STAGE netflixstage
  URL='s3://hr-netflixmoviedata/'
  CREDENTIALS=(
    AWS_KEY_ID=AWS_KEY_ID
    AWS_SECRET_KEY=AWS_SECRET_KEY
  )

DESC STAGE MOVIELENS.RAW.NETFLIXSTAGE

CREATE OR REPLACE TABLE raw_movies (
    movieId INTEGER,
    title STRING,
    genres STRING
)

COPY INTO raw_movies
FROM '@netflixstage/movies.csv'
FILE_FORMAT=(TYPE='CSV' SKIP_HEADER=1 FIELD_OPTIONALLY_ENCLOSED_BY='"');


CREATE OR REPLACE TABLE raw_ratings (
    userId INTEGER,
    movieId INTEGER,
    rating FLOAT,
    timestamp BIGINT
)

COPY INTO raw_ratings
FROM '@netflixstage/ratings.csv'
FILE_FORMAT=(TYPE='CSV' SKIP_HEADER=1 FIELD_OPTIONALLY_ENCLOSED_BY='"');

CREATE OR REPLACE TABLE raw_tags (
    userId INTEGER,
    movieId INTEGER,
    tag STRING,
    timestamp BIGINT
)

COPY INTO raw_tags
FROM '@netflixstage/tags.csv'
FILE_FORMAT=(TYPE='CSV' SKIP_HEADER=1 FIELD_OPTIONALLY_ENCLOSED_BY='"')
ON_ERROR='CONTINUE';


CREATE OR REPLACE TABLE raw_genome_scores (
    movieId INTEGER,
    tagId INTEGER,
    relevance FLOAT
);

COPY INTO raw_genome_scores
FROM '@netflixstage/genome-scores.csv'
FILE_FORMAT=(TYPE='CSV' SKIP_HEADER=1 FIELD_OPTIONALLY_ENCLOSED_BY='"');

CREATE OR REPLACE TABLE raw_genome_tags (
    tagId INTEGER,
    tag STRING
);

COPY INTO raw_genome_tags
FROM '@netflixstage/genome-tags.csv'
FILE_FORMAT=(TYPE='CSV' SKIP_HEADER=1 FIELD_OPTIONALLY_ENCLOSED_BY='"');



CREATE OR REPLACE TABLE raw_links (
    movieId INTEGER,
    imdbId INTEGER,
    tagId INTEGER
);

COPY INTO raw_links
FROM '@netflixstage/links.csv'
FILE_FORMAT=(TYPE='CSV' SKIP_HEADER=1 FIELD_OPTIONALLY_ENCLOSED_BY='"');


