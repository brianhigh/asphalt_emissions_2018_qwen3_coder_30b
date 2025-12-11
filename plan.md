# Implementation Plan

## Overview
Create an R script that generates a choropleth map of U.S. states based on asphalt emissions data from the EPA's 2018 State County Inventory.

## Project Structure
- `asphalt_emissions.R`: Main R script
- `README.md`: Documentation with map preview and citation
- `plan.md`: This file
- `tasks.md`: Task checklist
- `walkthrough.md`: Step-by-step walkthrough
- `.gitignore`: Git ignore file for R project
- `data/`: Folder for downloaded data
- `plots/`: Folder for saved plots

## Data Handling
1. Check if data file exists locally
2. If not, download from EPA URL in binary mode
3. Read "Output - State" sheet from Excel file
4. Extract State and Total kg/person columns
5. Normalize state names for merging
6. Suppress warnings during numeric conversion
7. Suppress read_excel informational messages

## Map Visualization
1. Load U.S. state map data
2. Merge with emissions data
3. Create choropleth map using ggplot2
4. Set custom color scale (dark green → yellow → red)
5. Add title, subtitle, and caption
6. Remove axis titles
7. Save as PNG in plots/ folder

## Technical Implementation
1. Use pacman::p_load() for package management
2. Include error handling throughout
3. Create data/ and plots/ folders if needed
4. Follow EPA citation requirements
