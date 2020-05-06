
# Script to knit MARKED and COMMENTED .Rmd submissions into augmented HTML
# Only run once you've finised marking and entered marks in the Google sheet

######################## EDIT AS APPROPRIATE ################################
# EDIT PATH to the OneDrive folder we shared with you
marking_path <- "C:/work/OneDrive - University of Sussex/marking/AnD/2019-20/Milan"

marks <- read.csv("https://spreadsheets.google.com/feeds/download/spreadsheets/Export?key=19CXCZk28CQzX4MzQ86a5U-ijYQvP47x0mfX7pQk6KKo&exportFormat=csv", stringsAsFactors = F)
# marks <- read.csv("path/to/csv/file.csv", stringsAsFactors = F)
#############################################################################

# lists default and required packages so they don't get unloaded
default_pkgs <-  c("base", "teachR", "survival", getOption("defaultPackages"))
# lists installed packages
installed_pkgs <- installed.packages()[ , 1]
# objects to keep when cleaning environment
keep_obj <- c("candidate_number", "default_pkgs", "fdbck_boiler", "ff", "i",
              "installed_pkgs", "keep_obj", "marking_path", "marks", "num_cols",
              "rubric")

knitr::opts_chunk$set(error = T, message= F, warning = F)

library(teachR)

# source the marking rubric
source("https://raw.githubusercontent.com/SussexPsychMethods/and_pub/master/marking/sussex_rubric.R")

marks <- read.csv("https://spreadsheets.google.com/feeds/download/spreadsheets/Export?key=19CXCZk28CQzX4MzQ86a5U-ijYQvP47x0mfX7pQk6KKo&exportFormat=csv", stringsAsFactors = F)
fdbck_boiler <- readLines(
  "https://raw.githubusercontent.com/SussexPsychMethods/and_pub/master/marking/fdbck_boilerplate.txt")

ff <- list.files(file.path(marking_path), pattern="\\.rmd$", ignore.case = T)
ff <- grep("_marked\\.", ff, invert = T, value = T)
ids <- sub("(\\d+).*", "\\1", ff)
marks <- marks[marks$user_id %in% ids, ]

num_cols <- c("analysis", "crit_thinking", "theory_understand", "organisation", "research", "grade", "mod_mark")
marks[ , num_cols] <- lapply(marks[ , num_cols], function(x) if (!is.numeric(x)) as.integer(as.character(x)) else x)
marks$final_grade <- marks$mod_mark
ind <- is.na(marks$mod_mark)
marks$final_grade[ind] <- marks$grade[ind]

for (i in 1:nrow(marks)) {
  # tidy up
  rm(list = setdiff(ls(), keep_obj))
  teachR:::unlibrary() # unload packages except for default_pkgs
  
  # cand no must be in global env for knitting
  tmp <- readLines(file.path(marking_path, ff[i]))
  eval(parse(text = grep("candidate_number", tmp, value = T)))
  
  # categorise partial marks into grades (1st, 2:1, 2:2...)
  rubric_grades <- cut(
    unlist(marks[i , num_cols[1:5]]),
    breaks = c(0, 30, 39, 49, 59, 69, 79, 89, 100),
    include.lowest = T,
    labels = c("F&minus;", "F", "3<sup>rd</sup>", "2:2", "2:1", "1<sup>st</sup>", "1<sup>st</sup>+", "1<sup>st</sup>&Dagger;")
  )
  
  # knit
  try(
    mark(file = file.path(marking_path, ff[i]),
         mark = marks$final_grade[i], rubric_grades = rubric_grades,
         rubric = rubric, include_rubric_desc = T, study = marks$study[i], include_results = T,
         results_obj = teachR:::res(marks$study[i]), feedback = T, fdbck_boiler_text = fdbck_boiler,
         install_missing_pkgs = T, installed_pkgs = installed_pkgs, collapse_chunks = T)
  )
}

# tidy up
rm(list = setdiff(ls(), keep_obj))
teachR:::unlibrary() # unload packages except for default_pkgs
# revert back to default
knitr::opts_chunk$set(error = F, message = T, warning = T)
