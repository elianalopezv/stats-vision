library(shiny)
library(shinymaterial)
library(datasets)

# UI ---------------------------------------------------------------------
# --------------------------------------------------------------------------
ui <- material_page(
  
  includeCSS("styles.css"),
  title = "StatsVision",
  nav_bar_color = "green darken-4",
  
  # Parallax ----------------------------------
  # Image in folder 'www' at same level as app.R
  material_parallax(
    image_source = "statistics-image.jpg"
  ),
  material_row(
    material_column(
      width = 6,
      material_card(
        h4("Bienvenido"),
        material_row(
          material_column(
            width = 4,
            tags$img(src = "family.png")
          ),
          material_column(
            width = 8,
            h5("En esta página te brindamos información acerca de
           la cantidad de hijos que puede tener una familia colombiana
           según las características que ingreses. Esto te ayudará 
           a determinar a qué tipo de familias debes dirigirte para ofrecer
           tus servicios.")
            
          )
        )
      )
    ),
    material_column(
      width = 6,
      material_card(
        title = "iris",
        plotOutput("irisPlot")
      )
    )
  ),
  # Parallax ----------------------------------
  # Image in folder 'www' at same level as app.R
  material_parallax(
    image_source = "digital-map.jpg"
  ),
  material_row(
    material_column(
      width = 6,
      material_card(
        title = "mtcars",
        plotOutput("mtcarsPlot")
      )
    ),
    material_column(
      width = 6,
      material_card(
        title = "airmiles",
        plotOutput("airmilesPlot")
      )
    )
  ),
  material_row(
    material_column(
      width = 6,
      tags$a(
        target = "_blank",
        class = "btn green darken-4",
        href = "https://github.com/ericrayanderson/shinymaterial_parallax/blob/master/app.R#L1",
        "APP CODE"
      )
    )
  )
)

# SERVER ---------------------------------------------------------------------
# ------------------------------------------------------------------------------
  
server <- function(input, output) {
  
  
  
  output$mtcarsPlot <- renderPlot({
    plot(mtcars)
  })
  output$irisPlot <- renderPlot({
    plot(iris)
  })
  
  output$faithfulPlot <- renderPlot({
    plot(faithful)
  })
  output$airmilesPlot <- renderPlot({
    plot(airmiles)
  })
}

shinyApp(ui = ui, server = server)