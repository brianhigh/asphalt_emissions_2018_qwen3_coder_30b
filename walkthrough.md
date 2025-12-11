# Step-by-Step Walkthrough

## 1. Project Setup
- Create `data/` folder for downloaded data
- Create `plots/` folder for saved plots
- Check if EPA data file exists locally
- If not, download from EPA URL in binary mode using `download.file()`

## 2. Package Installation
- Use `pacman::p_load()` to install/load required packages:
  - `readxl` for reading Excel files
  - `ggplot2` for creating the choropleth map
  - `dplyr` for data manipulation
  - `sf` for spatial data handling
  - `ggthemes` for additional themes (optional)

## 3. Data Processing
- Read "Output - State" sheet from Excel file using `read_excel()`
- Extract columns: `State` and `Total kg/person`
- Normalize state names to ensure compatibility with map data
- Convert `Total kg/person` values to numeric, suppressing warnings
- Suppress informational messages from `read_excel()` using `.name_repair = "unique_quiet"`

## 4. Map Data Preparation
- Load U.S. state map data using `map_data()` or similar function
- Merge emissions data with map data on state names
- Handle any missing data or mismatches

## 5. Choropleth Map Creation
- Create base ggplot with state geometries
- Add fill aesthetic mapping to `Total kg/person` values
- Set custom color scale from dark green → yellow → red
- Add title, subtitle, and caption with appropriate text
- Remove axis titles
- Set plot background to white
- Add grey state borders

## 6. Plot Saving
- Save the final plot as a PNG file in the `plots/` folder
- Set appropriate dimensions for the output image

## 7. Documentation
- Create `README.md` file with:
  - Map preview (link to PNG)
  - EPA citation and DOI link
  - Links to all markdown files
  - Project structure section
