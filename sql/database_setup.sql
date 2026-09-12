# Create database
CREATE DATABASE IF NOT EXISTS spotify_analysis;

# Select database
USE spotify_analysis;

# Remove existing table
DROP TABLE IF EXISTS spotify_tracks;

# Create table
CREATE TABLE spotify_tracks (
    track_name TEXT,
    artist_names TEXT,
    album_release_year SMALLINT,
    track_duration_ms INT,
    explicit VARCHAR(10),
    popularity INT
);

-- Update the file path below to match your local project directory
LOAD DATA LOCAL INFILE
'C:/path/to/spotify-data-analysis/data/spotify_analysis.csv'
INTO TABLE spotify_tracks
FIELDS TERMINATED BY ','
OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

-- Check imported row count
SELECT COUNT(*) AS total_tracks
FROM spotify_tracks;

-- Preview imported data
SELECT *
FROM spotify_tracks
LIMIT 10;
