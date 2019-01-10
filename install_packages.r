##
## Load packages used in the Shiny app.
##

if (!require(devtools))
  install.packages("devtools")


if (!require(statupinternal)) {
  devtools::install_git(
    "https://git.stablab.de/RPackages/statupinternal",
    branch = "v1.0",
    upgrade_dependencies = FALSE)
}

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
