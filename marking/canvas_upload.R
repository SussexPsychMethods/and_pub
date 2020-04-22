
##### upload file as comments on assignemnts

######################## EDIT AS APPROPRIATE ################################
# EDIT PATH to where you saved students' .Rmd files
fpath <- "marking/AnD/2019-20"
# insert your Canvas token
set_canvas_token("")
#############################################################################

set_canvas_domain("https://canvas.sussex.ac.uk")

course_id <- 9242
assign_id <- 25272
submissions <- get_submissions(course_id, "assignments", assign_id) %>%
  filter(workflow_state == "submitted")
ff <- unlist(lapply(submissions$attachments, function(x) x$filename))
ff <- gsub("\\+", "_", ff)

good_submission <- grepl("\\.rmd$", tolower(ff))

ff <- ff[good_submission]
ff <- gsub("\\.[rR]md$", "_marked.html", ff)

submissions <- submissions[good_submission, ]

for (i in 1:nrow(submissions)) {
  
  url <- paste0(
    "https://canvas.sussex.ac.uk/api/v1/courses/",
    course_id, "/assignments/", assign_id, "/submissions/",
    submissions$user_id[i], "/comments/files")
  
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
}
