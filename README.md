# Spotify Data Analysis

Exploratory data analysis of Spotify tracks using Python, SQL, Pandas, MySQL, and Plotly.

The project explores artist representation, popularity trends, explicit content across decades, and the relationship between song duration and popularity.

## Project Structure

```text
spotify-data-analysis/
├── data/
│   ├── top_10000_1950-now.csv
│   ├── spotify_cleaned.csv
│   └── spotify_analysis.csv
├── notebooks/
│   └── spotify_analysis.ipynb
├── sql/
│   ├── database_setup.sql
│   └── spotify_analysis.sql
├── src/
│   └── data_cleaning.py
└── README.md
```

## Tools & Technologies

- Python
- Pandas
- MySQL
- SQL
- Plotly
- Jupyter Notebook

## Data Preparation

The raw Spotify dataset was cleaned and prepared using Pandas. The process included:

- removing duplicate rows
- removing empty columns
- standardizing column names
- converting release dates to datetime format
- extracting album release year
- handling missing values in essential analysis fields
- creating an analysis-ready dataset for SQL and Python

After cleaning, the analysis dataset contains **9,949 tracks**.

## SQL Analysis

MySQL was used to explore six analytical questions:

1. Which artists have the strongest presence in the dataset?
2. Which songs are the most popular in the dataset?
3. How has explicit content changed across decades?
4. How has popularity changed across decades?
5. Is song duration associated with popularity?
6. Do explicit and non-explicit songs differ in popularity?

The SQL analysis includes grouping, aggregation, conditional aggregation, sorting, filtering, and data transformation.

## Python Analysis & Visualization

Pandas and Plotly were used to further explore and visualize selected findings from the SQL analysis.

The notebook includes:

- Top 10 artists by number of tracks
- song duration vs. popularity
- explicit tracks by decade
- average popularity by decade
- correlation analysis between song duration and popularity

## Key Findings

- Taylor Swift has the strongest presence in the dataset with 50 tracks, followed by P!nk with 47 and Elvis Presley with 46.
- The share of explicit tracks increases substantially across decades, reaching 13.95% in the 2020s.
- Average popularity varies considerably across decades. The 2020s show a notable increase compared with the 1990s–2010s, while the high average for the 1950s should be interpreted cautiously because that decade contains only 27 tracks.
- Song duration shows almost no linear relationship with popularity (r = 0.029).
- Explicit tracks have a higher average popularity score (39.85) than non-explicit tracks (32.09) in this dataset.

## Dataset

The project uses the **Top 10,000 Spotify Songs (1950–Now)** dataset by joebeachcapital, available on Kaggle.