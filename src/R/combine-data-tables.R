#!/usr/bin/env Rscript
# combine-data-tables.R
# Combine the data from the different sheets of grass data into a single CSV file.

library(openxlsx)


# Read data ---------------------------------------------------------------
# the location of the excel file that contains the grass data
excel_file <- "https://github.com/utia-gc/20240805-usda-sep-fellows-r-workshop/raw/main/data/z_b.xlsx"

# read in the data for teff grass sheet
teff <- read.xlsx(
  excel_file,
  sheet = "Boussad"
)
# read in the data for crabgrass sheet
crabgrass <- read.xlsx(
  excel_file,
  sheet = "Zahia"
)


# Combine data tables -----------------------------------------------------
# combine the teff and crabgrass data by their rows
grasses <- rbind(teff, crabgrass)


# Write data to file ------------------------------------------------------
write.csv(
  grasses,
  file = "data/grasses.csv",
  append = FALSE,
  quote = FALSE,
  row.names = FALSE
)
