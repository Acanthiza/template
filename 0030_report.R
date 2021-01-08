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
          dplyr::left_join(as_tibble(sessioninfo::package_info(include_base = TRUE))) %>%
          dplyr::select(package,citation,loadedversion,date,source)
        , caption = "R [@R-base] packages used in the production of this report" 
        )



## ----sessionInfoPackages------------------------------------------------------
  
  as_tibble(sessioninfo::package_info()) %>%
    dplyr::filter(!attached) %>%
    dplyr::select(package,loadedversion,date,source) %>%
    kable(caption = "@R-base packages required to produce this report but not explicitly attached")
  


## ----sessionInfoPlatform------------------------------------------------------
  
  session_info()$platform %>%
    tibble::enframe(name = "setting", value = "value") %>%
    tidyr::unnest(cols = c(value))
    kable() %>%
    kable_styling()
