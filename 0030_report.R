## ----setup--------------------------------------------------------------------

  source("0010_setup.R")



## ----setupCode, code = readLines("0010_Setup.R"), echo = TRUE, eval = FALSE----
## NA


## ---- code = readLines(knitr::purl(knitr::current_input(),documentation=1)), echo = TRUE, eval = FALSE----
## 
## # From
## # https://github.com/yihui/knitr/issues/332
## # https://stackoverflow.com/questions/36868287/purl-within-knit-duplicate-label-error
## 


## ----packages-----------------------------------------------------------------

  kable(tibble(package = packages) %>%
          dplyr::mutate(citation = paste0("@R-",package)) %>%
<<<<<<< HEAD
          dplyr::left_join(as_tibble(package_info(include_base = TRUE))) %>%
=======
          dplyr::left_join(as_tibble(sessioninfo::package_info(include_base = TRUE))) %>%
>>>>>>> 2b0de5662c276592e236605fd9b79d32b7011f57
          dplyr::select(package,citation,loadedversion,date,source)
        , caption = "R [@R-base] packages used in the production of this report" 
        )



## ----sessionInfoPackages------------------------------------------------------
  
<<<<<<< HEAD
  as_tibble(package_info()) %>%
=======
  as_tibble(sessioninfo::package_info()) %>%
>>>>>>> 2b0de5662c276592e236605fd9b79d32b7011f57
    dplyr::filter(!attached) %>%
    dplyr::select(package,loadedversion,date,source) %>%
    kable(caption = "@R-base packages required to produce this report but not explicitly attached")
  


## ----sessionInfoPlatform------------------------------------------------------
  
  session_info()$platform %>%
    tibble::enframe(name = "setting", value = "value") %>%
<<<<<<< HEAD
    tidyr::unnest(cols = c(value))

=======
    tidyr::unnest() %>%
    kable() %>%
    kable_styling()
  
>>>>>>> 2b0de5662c276592e236605fd9b79d32b7011f57

