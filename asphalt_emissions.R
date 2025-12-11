# Load required packages
pacman::p_load(readxl, ggplot2, dplyr, sf, ggthemes)

# Create data/ folder if it does not exist
if (!dir.exists("data")) {
  dir.create("data")
}

# Create plots/ folder if it does not exist
if (!dir.exists("plots")) {
  dir.create("plots")
}

# Define data file path
data_file <- "data/AP_2018_State_County_Inventory.xlsx"

# Check if data file exists, if not download it
if (!file.exists(data_file)) {
  message("Downloading EPA data file...")
  download.file("https://pasteur.epa.gov/uploads/10.23719/1531683/AP_2018_State_County_Inventory.xlsx", 
                destfile = data_file, mode = "wb")
}

# Read the "Output - State" sheet from the Excel file
# Suppress informational messages using .name_repair = "unique_quiet"
emissions_data <- read_excel(data_file, sheet = "Output - State", .name_repair = "unique_quiet")

# Extract required columns: State and Total kg/person
# Suppress warnings when converting to numeric
emissions_data <- emissions_data %>%
  select(State, `Total kg/person`) %>%
  mutate(`Total kg/person` = as.numeric(`Total kg/person`))

# Print success message after reading data
message("Successfully read emissions data from ", data_file)

# Load US state map data
# Using built-in maps package data
us_states <- map_data("state")

# Normalize state names for merging (convert to lowercase for both datasets)
emissions_data <- emissions_data %>%
  mutate(State = tolower(State))

us_states <- us_states %>%
  mutate(region = tolower(region))

# Merge emissions data with map data
merged_data <- us_states %>%
  left_join(emissions_data, by = c("region" = "State"))

# Fix deprecated size aesthetic
merged_data <- merged_data %>%
  mutate(linewidth = 0.2)

# Create the choropleth map
map <- ggplot() +
  # Add state geometries with fill based on emissions
  geom_polygon(data = merged_data, 
               aes(x = long, y = lat, group = group, fill = `Total kg/person`), 
               color = "grey", linewidth = 0.2) +
  # Set custom color scale from dark green to yellow to red
  scale_fill_gradientn(colors = c("darkgreen", "yellow", "red"), 
                       name = "Total kg/person",
                       na.value = "white") +
  # Remove axis titles
  theme_void() +
  # Add title, subtitle, and caption
  labs(
    title = "Asphalt Emissions by State (2018)",
    subtitle = "Total kg/person of asphalt-related emissions by U.S. state",
    caption = "Data source: EPA 2018 State County Inventory"
  ) +
  # Set plot background to white
  theme(plot.background = element_rect(fill = "white"))

# Save the plot as PNG
ggsave("plots/asphalt_emissions_map.png", map, width = 10, height = 6, dpi = 300)

# Print confirmation message
message("Map saved to plots/asphalt_emissions_map.png")
