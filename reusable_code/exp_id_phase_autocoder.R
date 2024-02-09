# Load libraries
library(tidyverse)

# Read the new data
data <- read_csv("dummy_id.csv")

# Function to check match
check_match <- function(id, item, non_matching_item, id_type) {
  cat("\n-----------------------------------\n")
  print(paste("ID: ", id, "       Item: ", item, "       Non-matching Item: ", non_matching_item))
  if(id == item) {
    return(1)
  } else if(id_type == "id_id" && id == non_matching_item) {
    return(1)
  } else {
    cat("\nDo they match? Press 1 for Yes, 0 for No")
    if(id_type == "id_id") {
      cat(", 2 for Non-matching correct: ")
    } else {
      cat(": ")
    }
    response <- readline()
    if(response == "1" || response == "2") {
      return(1)
    } else {
      return(0)
    }
  }
}

# Randomly order the data
set.seed(123)
data <- data[sample(nrow(data)),]

# Create directory if it doesn't exist
dir.create("difficulty_data", showWarnings = FALSE)

# Define the file name
file_name <- "difficulty_data/difficulty_data.csv"

# Initialize NA counter, auto-correct counter, and response counter
na_counter <- 0
auto_correct_counter <- 0
response_counter <- 0

# Welcome message
cat("Welcome to the coding process. Let's get started!\n")

# Loop through rows
for(i in 1:nrow(data)) {
  
  # Check if exp_id matches with name
  if(!is.na(data$exp_id[i]) && data$exp_id[i] != 'NA') {
    cat(paste("Progress: ", 2*i-1, "/", 2*nrow(data), "\n"))
    response <- check_match(data$exp_id[i], data$name[i], data$non_stim_name[i], "exp_id")
    data$exp_correct[i] <- response
    if(response == 1 && data$exp_id[i] == data$name[i]) {
      auto_correct_counter <- auto_correct_counter + 1
    }
    response_counter <- response_counter + 1
  } else {
    na_counter <- na_counter + 1
  }
  
  # Check if id_id matches with name
  if(!is.na(data$id_id[i]) && data$id_id[i] != 'NA') {
    cat(paste("Progress: ", 2*i, "/", 2*nrow(data), "\n"))
    response <- check_match(data$id_id[i], data$name[i], data$non_stim_name[i], "id_id")
    data$id_correct[i] <- response
    if(response == 1) {
      data$non_matching_correct[i] <- 1
      if(data$id_id[i] == data$name[i] || data$id_id[i] == data$non_stim_name[i]) {
        auto_correct_counter <- auto_correct_counter + 1
      }
    }
    response_counter <- response_counter + 1
  } else {
    na_counter <- na_counter + 1
  }
  
  # Save the dataset every 10 rows and on the last row
  if(i %% 10 == 0 || i == nrow(data)) {
    write_csv(data, file_name)
  }
}

# Print the number of NAs skipped, auto-corrects, and responses coded
cat(paste("The coding process is complete. Skipped", na_counter, "NA values. Automatically marked", auto_correct_counter, "values as correct. You coded", response_counter, "responses.\n"))
