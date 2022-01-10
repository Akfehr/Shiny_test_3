library("DT")

  navbarPage(
    "Allow Users to Download Filtered Data",
    tabPanel(
      "Star Table",
      fluidPage(
        wellPanel(
          "This table should be able to be downloaded",
        downloadButton(
          "Download Data"
        )
        ),
        sliderInput("height_limit_star_table",
                    label = "Height limit",
                    min = 66,
                    max = 264,
                    value = 180),
        DTOutput("star_table")
      )
    ),
    # tabPanel(
    #   "Star Wide",
    #   fluidPage(
    #     sliderInput("height_limit_star_wide",
    #                 label = "Height limit",
    #                 min = 66,
    #                 max = 264,
    #                 value = 180),
    #     tableOutput("star_wide")
    #   )
    # ),
    tabPanel(
      "Star List",
      fluidPage(
        tableOutput("star_lists")
      )
    ),
    collapsible = TRUE
)