

  library("bookdown")
  library("tidyverse")
  library("fs")
  
  # Ensure any previous failed knit result is cleaned up
  file_delete("_main.Rmd")
  
  # Make book, collecting all .Rmd files in order and knitting to book
  render_book("Rmd")
  
  # Copy book over to saveTo to make available outside of c: drive
  saveTo <- path("R:IST/DEHTemp",basename(here::here()),basename(outDir))
  
#------Code--------
  
  folders <- dir_info(recursive = TRUE) %>%
    dplyr::filter(grepl("_book|out",path)
                  , type == "directory"
                  ) %>%
    dplyr::mutate(toDir = path(saveTo,path)) %>%
    dplyr::pull(toDir) %>%
    dir_create()
  
  files <- dir_info(recursive = TRUE) %>%
    dplyr::filter(grepl("_book|out",path)
                  , type != "directory"
                  ) %>%
    dplyr::mutate(toDir = path(saveTo,path))
  
  
  walk2(files$path
        , files$toDir
        , file_copy
        , overwrite = TRUE
        )

  