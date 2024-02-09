rm(list = ls())

# Load libraries
library(tidyverse)

# Which csv file do we want to code?

id_data <- read_csv("2_for_check/2_id_data_for_check_batch_7.csv")


# Function to check match
check_match <- function(id, item) {
  cat("\n-----------------------------------\n")
  print(paste("ID: ", id, "       Item: ", item))
  cat("\nDo they match? Press 1 for Yes, 0 or Enter for No: ")
  response <- readline()
  if(response == "1") {
    return(1)
  } else {
    return(0)
  }
}

# Get all CSV files that start with '2_id_data'
# files <- list.files(path = "2_for_check", pattern = "^2_id_data.*\\.csv$", full.names = TRUE)



# Randomly order the data
set.seed(123)
id_data <- id_data[sample(nrow(id_data)),]

# Create directory if it doesn't exist
dir.create("3_checked", showWarnings = FALSE)

# Loop through rows
for(i in 1:nrow(id_data)) {
  
  # Skip if 'id_id' is 'NA'
  if(is.na(id_data$id_id[i]) || id_data$id_id[i] == 'NA') {
    next
  }
  
  # Check if a_item is NA
  if(is.na(id_data$a_item[i])) {
    id_data$A_correct[i] <- 0
  } else {
    cat(paste("Progress: ", 2*i-1, "/", 2*nrow(id_data), "\n"))
    id_data$A_correct[i] <- check_match(id_data$id_id[i], id_data$a_item[i])
  }
  
  # Check if b_item is NA
  if(is.na(id_data$b_item[i])) {
    id_data$B_correct[i] <- 0
  } else {
    cat(paste("Progress: ", 2*i, "/", 2*nrow(id_data), "\n"))
    id_data$B_correct[i] <- check_match(id_data$id_id[i], id_data$b_item[i])
  }
  
  
  # Save the dataset every 100 iterations
  if(i %% 100 == 0) {
    # Initialize the counter
    j <- 1
    
    # Initialize the filename
    file_name <- paste0("3_checked/3_checked_", j, "_", i, ".csv")
    
    # While the file already exists, increment the counter and update the filename
    while (file.exists(file_name)) {
      j <- j + 1
      file_name <- paste0("3_checked/3_checked_", j, "_", i, ".csv")
    }
    
    # Save the dataset
    write_csv(id_data, file_name)
  }

}


