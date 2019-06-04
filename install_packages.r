##
## Load packages used in the Shiny app.
##

if (!require(devtools))
  install.packages("devtools")


if (!isTRUE(try(
  compareVersion(installed.packages()["statupinternal","Version"], "1.2.0") == 0
)))
  devtools::install_git("https://git.stablab.de/RPackages/statupinternal", 
                        ref = "1.2",
                        upgrade = FALSE)

library(statupinternal)


# Needed for correct paths
install.packages("here")

# Data wrangling
install.packages("data.table")
install.packages("magrittr")
install.packages("purrr")
install.packages("stringr")
install.packages("checkmate")
install.packages("lubridate")

# Parallelization
install.packages("future")
install.packages("promises")
install.packages("foreach")
install.packages("doFuture")

# Visualization
install.packages("ggplot2")
install.packages("plotly")
install.packages("cowplot")

# Database
install.packages("DBI")
install.packages("RPostgres")
install.packages("pool")

# Shiny
install.packages("shiny")
install.packages("shinydashboard")
install.packages("shinyWidgets")
install.packages("shinycssloaders")
install.packages("DT")

# Misc
install.packages("car")
