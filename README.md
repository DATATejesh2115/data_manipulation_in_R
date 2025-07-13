# 🚴 Divvy Bike Share Data Cleaning & Exploration

This repository contains data cleaning and basic exploratory analysis of the **Divvy bike-sharing dataset** for January 2023. The dataset includes over **190,000** ride records with information about trip times, stations, bike types, and user categories.

---

## 📦 Dataset Summary

- **Rows**: 190,301  
- **Columns**: 13  

### Key Columns:
- `ride_id`: Unique identifier for each ride  
- `rideable_type`: Type of bike (e.g., electric_bike, classic_bike)  
- `started_at`, `ended_at`: Start and end timestamps  
- `start_station_name`, `end_station_name`: Station names (some missing values)  
- `start_lat`, `start_lng`, `end_lat`, `end_lng`: GPS coordinates  
- `member_casual`: Type of rider (member or casual)

---

## 🧼 Data Cleaning Steps

### ✅ 1. Convert datetime columns
Converted `started_at` and `ended_at` to `POSIXct` format using `lubridate`.  
**Why:** Enables duration calculations and time-based grouping.

### ✅ 2. Calculate ride duration
Created a new column `ride_duration` (in minutes) as the difference between `ended_at` and `started_at`.  
**Why:** Useful for filtering and ride behavior analysis.

### ✅ 3. Remove invalid rides
Filtered out rides with:
- Negative durations (i.e., where `ended_at < started_at`)
- Rides shorter than 1 minute (likely accidental or test unlocks)

**Why:** Improve data quality by removing noise and errors.

### ✅ 4. Handle missing values
Identified columns with missing data (e.g., ~14% missing in `end_station_name`).  
No rows dropped at this stage.  
**Why:** To be handled based on future analysis needs.

### ✅ 5. Validate categorical fields
Checked for consistency in:
- `rideable_type`: e.g., electric_bike, classic_bike
- `member_casual`: member vs casual

**Why:** Ensure no typos, missing categories, or format issues.

### ✅ 6. Exploratory summaries
Grouped data by:
- Rider type (`member_casual`)
- Bike type (`rideable_type`)
- Hour of day (`hour(started_at)`)

**Why:** Understand rider behavior patterns by user type and time of day.

---

## 📈 Example Insights (Basic EDA)
- Members tend to ride more during morning and evening commute hours.
- Casual users prefer midday and weekend rides.
- Electric bikes are slightly more popular among casual users.

---

## 🛠️ Technologies Used

- **Language:** R
- **Packages:** `dplyr`, `lubridate`, `ggplot2`, `readr`

---

## 📁 Folder Structure

📦 divvy-data-cleaning/
┣ 📄 README.md
┣ 📄 data_cleaning.R
┣ 📄 hourly_analysis.R
┣ 📄 202301-divvy-tripdata.csv
┗ 📄 202301-divvy-tripdata-cleaned.csv

---

## 📌 Next Steps

- Deeper analysis by weekday, station, and distance (using GPS)
- Visualizations with `ggplot2`
- Optional Shiny dashboard or R Markdown report
- Apply same process across multiple months for trend analysis

---

## © License

This repository is for learning and demonstration purposes only and uses publicly available data. No commercial use intended.
