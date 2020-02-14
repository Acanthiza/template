
#------Options-------

  # Project name
  project <- basename(here::here())

#-----Packages-----

  packages <- unique(c("base"
                       ,"knitr"
                       ,"bookdown"
                       ,"readr"
                       ,"readxl"
                       ,"dplyr"
                       ,"tidyr"
                       ,"purrr"
                       ,"furrr"
                       ,"tibble"
                       ,"stringr"
                       ,"forcats"
                       ,"ggplot2"
                       ,"lubridate"
                       ,"dbplyr"
                       ,"DBI"
                       ,"fs"
                       ,"sf"
                       ,"raster"
                       ,"ggrepel"
                       ,"gridExtra"
                       ,"DT"
                       ,"tmap"
                       ,"maptools"
                       ,"kableExtra"
                       )
                     )
  
  purrr::walk(packages,library,character.only=TRUE)  
  
  write_bib(packages,file="common/packageCitations.bib",tweak=TRUE)


#------Chunk options-------
  # Set default chunk options (can adjust individual chunks differently if required)

  knitr::opts_chunk$set(echo = FALSE
                        , warning = FALSE
                        , error = FALSE
                        , message = FALSE
                        , tidy = TRUE
                        , tidy.opts = list(comment = FALSE)
                        )
  
  options(knitr.kable.NA = ""
          , kableExtra.html.bsTable = TRUE
          , knitr.duplicate.label = "allow"
          )

#------Mapping-----

  # Set mapping defaults
  tmap::tmap_options(basemaps = c("OpenStreetMap.Mapnik"
                                  , "Esri.WorldImagery"
                                  )
                     )
  
  tmap::tmap_mode("view")
  
  # don't use scientific notation for numbers
  options(scipen = 999)


#------Project------

  repo <- system("git config remote.origin.url", intern = TRUE)
  
  repoLink <- path(dirname(repo),"blob","master",basename(repo))
  
  reportLink <- path(repoLink
                       , list.files(here::here(),pattern="Rmd") %>% grep("^_",.,invert=TRUE,value=TRUE)
                       )

#---------Parallel-----------

# Cores to use for any parallel processing
useCores <- parallel::detectCores()*3/4

# Plan for any furrr functions
plan(multiprocess
     , workers = 
       useCores
     #round(parallel::detectCores()*0.5,0)
     , gc = TRUE
)
