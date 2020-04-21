
# Script to knit MARKED and COMMENTED .Rmd submissions into augmented HTML
# Only run once you've finised marking and entered marks in the Google sheet

######################## EDIT AS APPROPRIATE ################################
# You must use the name in the Google spreadsheet!
marker <- "Milan"
########### EDIT PATH to where you saved students' .Rmd files ###############
marking_path <- "marking/AnD/2019-20"
#############################################################################

# lists default and required packages so they don't get unloaded
default_pkgs <-  c("base", "teachR", getOption("defaultPackages"))
# objects to keep when cleaning environment
keep_obj <- c("candidate_number", "default_pkgs", "i", "keep_obj",
              "marking_path", "marks", "rubric")

library(teachR)

# source the marking rubric
source("https://raw.githubusercontent.com/SussexPsychMethods/and_pub/master/marking/sussex_rubric.R")

# download the marking Google sheet
marks <- googlesheets4::read_sheet("19CXCZk28CQzX4MzQ86a5U-ijYQvP47x0mfX7pQk6KKo")
marks <- marks[marks$marker == marker, ]

for (i in 1:nrow(marks)) {
  # tidy up
  rm(list = setdiff(ls(), keep_obj))
  teachR:::unlibrary() # unload packages except for default_pkgs
  
  # cand no must be in global env for knitting
  candidate_number <- as.numeric(marks$cand_no[i])
  
  # categorise partial marks into grades (1st, 2:1, 2:2...)
  rubric_grades <- cut(
    c(92, 68, 43, 77, 54),
    breaks = c(0, 30, 39, 49, 59, 69, 79, 89, 100),
    include.lowest = T,
    labels = c("F&minus;", "F", "3<sup>rd</sup>", "2:2", "2:1", "1<sup>st</sup>", "1<sup>st</sup>+", "1<sup>st</sup>&Dagger;")
  )
  
  # knit
  try(
    teachR::mark(file = file.path(marking_path, marks$file_name[i]),
                 mark = marks$grade[i], rubric_grades = rubric_grades,
                 rubric = rubric, include_rubric_desc = T, study = marks$study[i], include_results = T,
                 results_obj = teachR:::res(marks$study[i]), feedback = T)
  )
}

# tidy up
rm(list = setdiff(ls(), keep_obj))
teachR:::unlibrary() # unload packages except for default_pkgs
