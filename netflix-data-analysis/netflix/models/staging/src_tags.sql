
WITH raw_tags AS (
    SELECT * FROM MOVIELENS.RAW.RAW_TAGS
)


SELECT
    movieId AS movie_id,
    userId AS user_id,
    tag,
    TO_TIMESTAMP_LTZ(timestamp) AS tag_timestamp
FROM raw_tags




