

#-----Packages-----

  packages <- unique(c("base"
                       ,"knitr"
                       ,"bookdown"
                       ,"fs"
                       ,"sessioninfo"
                       ,"tidyverse"
                       )
                     )
  
  purrr::walk(packages,library,character.only=TRUE)  
  
  write_bib(packages,file="packageCitations.bib",tweak=TRUE)


  
#-------Load functions-------
  
  commonFiles <- path("..","template","toCommon")
  
  if(file.exists(commonFiles)){
    
    files <- dir_ls(commonFiles)
    newFiles <- files %>% gsub(commonFiles,path("common"),.)
    dir_create("common")
    walk2(files,newFiles,file_copy,overwrite=TRUE)
    
  }
  
  source("common/functions.R") # these are generic functions (e.g. vec_to_sentence)
  

#------Chunk options-------
  # Set default chunk options (can adjust individual chunks differently if required)

  knitr::opts_chunk$set(echo = FALSE
                        , warning = FALSE
                        , error = FALSE
                        , message = FALSE
                        , tidy = TRUE
                        , tidy.opts = list(comment = FALSE)
                        , fig.width = 7
                        )
  
  options(knitr.kable.NA = ""
          , kableExtra.html.bsTable = TRUE
          , knitr.duplicate.label = "allow"
          )

#------Mapping-----

  # # Set mapping defaults
  # tmap_options(basemaps = c("OpenStreetMap.Mapnik"
  #                                 , "Esri.WorldImagery"
  #                                 )
  #                    )
  # 
  # tmap_mode("view")
  # 
  # # don't use scientific notation for numbers
  # options(scipen = 999)


#------Project------

  repo <- system("git config remote.origin.url", intern = TRUE)
  
  repoLink <- path(dirname(repo),"blob","master",basename(repo))
  
  reportLink <- path(repoLink
                       , list.files(pattern="Rmd") %>% grep("^_",.,invert=TRUE,value=TRUE)
                       )

#---------Parallel-----------

  # # Cores to use for any parallel processing
  # useCores <- if(parallel::detectCores() > 20) 20 else parallel::detectCores()-1
  # 
  # # Plan for any furrr functions
  # plan(multiprocess
  #      , workers = useCores
  #      , gc = TRUE
  #      )
