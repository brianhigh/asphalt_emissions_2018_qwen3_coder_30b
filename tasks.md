# Task Checklist

## Project Setup
- [x] Create data/ folder for downloaded data using R code
- [x] Create plots/ folder for saved plots using R code
- [x] Download EPA data file if it doesn't exist locally using R code
- [x] Install required R packages using pacman in R code

## Data Processing
- [x] Read "Output - State" sheet from Excel file
- [x] Extract State and Total kg/person columns
- [x] Normalize state names for merging
- [x] Convert values to numeric (suppress warnings)
- [x] Suppress read_excel informational messages

## Map Creation
- [x] Load U.S. state map data
- [x] Merge emissions data with map data
- [x] Create choropleth map using ggplot2
- [x] Set custom color scale (dark green → yellow → red)
- [x] Add title, subtitle, and caption
- [x] Remove axis titles
- [x] Save plot as PNG in plots/ folder

## Documentation
- [x] Create README.md with map preview
- [x] Add EPA citation and DOI link
- [x] Include links to all markdown files
- [x] Add Project Structure section

## Testing
- [x] Test folder creation
- [x] Test data download and processing
- [x] Test map creation and saving
- [x] Verify color differentiation
