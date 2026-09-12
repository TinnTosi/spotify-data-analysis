-- Spotify Data Analysis
-- Dataset: Top 10,000 Spotify Songs (1950–Now)

USE spotify_analysis;


-- 1. Which artists have the strongest presence in the dataset?
SELECT 
    artist_names,
    COUNT(track_name) AS track_count
FROM spotify_tracks
GROUP BY artist_names
ORDER BY track_count DESC
LIMIT 10;


-- 2. Which songs are the most popular in the dataset?
SELECT 
    artist_names,
    track_name,
    popularity
FROM spotify_tracks
ORDER BY popularity DESC
LIMIT 10;


-- 3. How has explicit content changed across decades?
SELECT 
    FLOOR(album_release_year / 10) * 10 AS decade,
    COUNT(*) AS total_tracks,
    ROUND(
        SUM(CASE WHEN explicit = 'True' THEN 1 ELSE 0 END)
        / COUNT(*) * 100,
        2
    ) AS explicit_percentage
FROM spotify_tracks
GROUP BY decade
ORDER BY decade;


-- 4. How has popularity changed across decades?
SELECT 
    FLOOR(album_release_year / 10) * 10 AS decade,
    COUNT(*) AS total_tracks,
    ROUND(AVG(popularity), 2) AS average_popularity
FROM spotify_tracks
GROUP BY decade
ORDER BY decade;


-- 5. Is song duration associated with popularity?
SELECT 
    track_name,
    popularity,
    ROUND(track_duration_ms / 60000, 2) AS duration_minutes
FROM spotify_tracks;


-- 6. Do explicit and non-explicit songs differ in popularity?
SELECT 
    explicit,
    ROUND(AVG(popularity), 2) AS average_popularity
FROM spotify_tracks
GROUP BY explicit;