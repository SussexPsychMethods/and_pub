
##### upload file as comments on assignemnts

######################## EDIT AS APPROPRIATE ################################
# EDIT PATH to the OneDrive folder we shared with you (NOT your folder!)
file_path <- "marking/AnD/2019-20"
# insert your Canvas token
canvas_token <- ""
# Your name (must be the same as the name of your folder)
# c("Alaa", "Ali", "Anthony", "Becks", "Elena",
# "Jennifer", "Laura", "Magda", "Silvia", "Sofia")
marker <- c("Alaa", "Ali", "Anthony", "Becks", "Elena",
            "Jennifer", "Laura", "Magda", "Silvia", "Sofia")
#############################################################################

set_canvas_domain("https://canvas.sussex.ac.uk")

and_id <- 9242
report_id <- 25272
all_submissions <- teachR::get.submitted(canvas_token,
                                     course_id = and_id, assign_id = report_id)
uploaded <- c()
for (m in marker) {
  fpath <- file.path(file_path, m)
  ff <- list.files(fpath, pattern = "_marked\\.html$")
  ids <- sub("(\\d+).*", "\\1", ff)
  submissions <- all_submissions[all_submissions$user_id %in% ids, ]
  
  
  for (i in 1:length(ff)) {
    
    url <- paste0(
      "https://canvas.sussex.ac.uk/api/v1/courses/",
      and_id, "/assignments/", report_id, "/submissions/",
      ids[i], "/comments/files")
    
    file_size <- file.info(file.path(fpath, ff[i]))$size
    
    args <- rcanvas:::sc(list(name = ff[i], size = file_size, 
                              parent_folder_path = fpath, on_duplicate = "overwrite"))
    
    upload_resp <- rcanvas:::canvas_query(url, args, "POST")
    upload_content <- httr::content(upload_resp)
    upload_url <- upload_content$upload_url
    upload_params <- upload_content$upload_params
    upload_params[[length(upload_params) + 1]] <- httr::upload_file(file.path(fpath, ff[i]))
    names(upload_params)[[length(upload_params)]] <- "file"
    post_result <- httr::POST(url = upload_url, body = upload_params)
    
    file_id <- as.numeric(sub(".*?(\\d+$)", "\\1", post_result$all_headers[[1]]$headers$location))
    
    
    url <- sub("/comments/files", "", url)
    args <- list(access_token = rcanvas:::check_token(),
                 `comment[text_comment]` = "See attached file for feedback", 
                 `include[visibility]` = TRUE,
                 `comment[file_ids][]` = file_id,
                 per_page = 100)
    attach_resp <- rcanvas:::canvas_query(url, args, "PUT")
    uploaded <- c(uploaded, ids[i])
  }
}

##### Grade submissions
marks <- readxl::read_xlsx(file.path(file_path, "marking_spreadsheet.xlsx"))
marks <- marks[!is.na(as.numeric(marks$user_id)), c("user_id", "grade", "mod_mark")]
mod_ind <- !is.na(marks$mod_mark)
marks$grade[mod_ind] <- marks$mod_mark[mod_ind]

for (i in 1:nrow(marks)) {
  rcanvas::grade_submission(and_id, report_id, marks$user_id[i], marks$grade[i])
}
