# Sourcing the packages for data prep
source("config.r")

# Data being loaded
master_data <- read.csv("data/202301-divvy-tripdata.csv")

#copying the data set from the Original data
copy_data <- master_data

# Convert datetime cOlumns
copy_data <- copy_data %>%
  mutate(
    started_at = ymd_hms(started_at),
    ended_at = ymd_hms(ended_at)
  )

# Calculate ride durations
copy_data <- copy_data %>%
  mutate(ride_duration = as.numeric(difftime(ended_at, started_at, units = "mins")))

# Remove short or invalid durations
initial_rows <- nrow(copy_data)

copy_data <- copy_data %>%
  filter(ride_duration > 1)

after_rows <- nrow(copy_data)
rows_removed <- initial_rows - after_rows

cat("Rows removed due to invalid/short durations:", rows_removed, "\n")

# Check for missin values
missing_summary <- colSums(is.na(copy_data)) %>%
  sort(decreasing = TRUE)

print(missing_summary)

# Check categorical distributions
table(copy_data$rideable_type)

table(copy_data$member_casual)


# Summary by user and bike type
usage_summary <- copy_data %>%
  group_by(member_casual, rideable_type) %>%
  summarise(ride_count = n(), .groups = "drop")

print(usage_summary)


# Save the data to a new CSV file
write_csv(copy_data, "202301-divvy-tripdata-cleaned.csv")




