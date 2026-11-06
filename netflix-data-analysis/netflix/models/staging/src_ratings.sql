WITH raw_ratings AS (
    SELECT * FROM MOVIELENS.RAW.RAW_RATINGS
)


SELECT
    movieId AS movie_id,
    userId AS user_id,
    rating,
    TO_TIMESTAMP_LTZ(timestamp) AS rating_timestamp
FROM raw_ratings




