import pandas as pd


# Load dataset
df = pd.read_csv("data/top_10000_1950-now.csv")


# Initial inspection
print("Dataset shape:", df.shape)

print("\nDataset info:")
df.info()

print("\nMissing values:")
print(df.isna().sum())

print("\nDuplicate rows:", df.duplicated().sum())


# Remove empty columns
df = df.drop(columns=["Album Genres"])


# Standardize column names
df.columns = (
    df.columns
    .str.strip()
    .str.lower()
    .str.replace("[()]", "", regex=True)
    .str.replace(r"[^a-z0-9]+", "_", regex=True)
    .str.strip("_")
)


# Remove duplicate rows
df = df.drop_duplicates()


# Convert release date to datetime
df["album_release_date"] = pd.to_datetime(
    df["album_release_date"],
    format="mixed",
    errors="coerce"
)


# Extract release year
df["album_release_year"] = (
    df["album_release_date"]
    .dt.year
    .astype("Int64")
)


# Remove rows missing essential analysis data
df = df.dropna(
    subset=["track_name", "artist_names", "album_release_year"]
)


# Final checks
print("\nCleaned dataset shape:", df.shape)

print("\nRemaining duplicate rows:")
print(df.duplicated().sum())

print("\nMissing values after cleaning:")
print(df.isna().sum())

print("\nData types:")
print(df.dtypes)


# Save cleaned dataset
df.to_csv("data/spotify_cleaned.csv", index=False)

print("\nCleaned dataset saved to data/spotify_cleaned.csv")

# Select columns needed for SQL analysis
analysis_columns = [
    "track_name",
    "artist_names",
    "album_release_year",
    "track_duration_ms",
    "explicit",
    "popularity"
]

df_analysis = df[analysis_columns]


# Final check for analysis dataset
print("\nAnalysis dataset shape:", df_analysis.shape)
print("\nMissing values in analysis dataset:")
print(df_analysis.isna().sum())


# Save analysis-ready dataset
df_analysis.to_csv(
    "data/spotify_analysis.csv",
    index=False
)

print("\nAnalysis-ready dataset saved to data/spotify_analysis.csv")