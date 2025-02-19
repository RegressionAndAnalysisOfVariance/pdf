generate_pdf <- function(responses) {
  # Load required packages
  if (!require("rmarkdown")) install.packages("rmarkdown")
  
  # Create the content as a character vector with sections
  content <- c(
    "# Survey Responses\n",
    "Generated on: ", format(Sys.time(), "%Y-%m-%d %H:%M:%S"), "\n\n",
    "## Personal Information\n",
    paste("* Email:", responses$email),
    paste("* Language:", responses$language),
    paste("* Age:", responses$age),
    paste("* Gender:", responses$gender),
    paste("* Relationship Status:", responses$relationship),
    paste("* Number of Children:", responses$children),
    if(!is.null(responses$youngest_child_age)) paste("* Age of Youngest Child:", responses$youngest_child_age),
    if(!is.null(responses$coparenting)) paste("* Coparenting:", responses$coparenting),
    "\n## Work Information\n",
    paste("* Professional Status:", responses$professional_status),
    paste("* Work System:", responses$work_system),
    paste("* Seniority:", responses$seniority, "years"),
    "\n## Recovery Responses\n",
    paste("* Forget Work:", responses$recovery_1),
    paste("* Not Think Work:", responses$recovery_2),
    paste("* Distance Mentally:", responses$recovery_3),
    paste("* Break Demands:", responses$recovery_4),
    paste("* Relax Easily:", responses$recovery_5),
    paste("* Do Relaxing:", responses$recovery_6),
    paste("* Time Relax:", responses$recovery_7),
    paste("* Leisure Time:", responses$recovery_8)
  )
  
  # Join all content with newlines
  content <- paste(content, collapse = "\n")
  
  # Create a temporary Rmd file
  temp_rmd <- tempfile(fileext = ".Rmd")
  writeLines(content, temp_rmd)
  
  # Set the output file path
  output_file <- tempfile(fileext = ".pdf")
  
  # Render to PDF
  rmarkdown::render(
    temp_rmd,
    output_format = "pdf_document",
    output_file = output_file,
    quiet = TRUE
  )
  
  return(output_file)
}