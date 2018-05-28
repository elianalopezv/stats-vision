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
        h4("¡Conoce más aquí!"),
        HTML(paste0('<iframe width="850" height="500" src="https://www.youtube.com/embed/Oiq-Al1ZdN8',
                    '" frameborder="0" allowfullscreen></iframe>'))
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
        title = "Ingresa los datos de la familia:",
        material_slider(
          label = "Cantidad de hijos",
          input_id = "cantidad",
          min_value = 0,
          max_value = 10,
          initial_value = 2
        ),
        material_dropdown(
          input_id = "input2",
          label = "Input 2",
          choices = c(
            "Chicken" = "c",
            "Steak" = "s",
            "Fish" = "f"
          ),
          selected = "s"
        ),
        material_switch(
          input_id = "input3",
          label = "Input3",
          off_label = "",
          on_label = ""
        )
      )
    ),
    material_column(
      width = 6,
      material_card(
        title = "Resultado",
        material_row(
          material_column(
            width = 2
          ),
          material_column(
            width = 8,
            tags$label("Una familia con las características ingresadas tendría:",
                       style = "font-size: 22px;
                       color: black;")
          ),
          material_column(
            width = 2
          )
        ),
        material_row(
          material_column(
            width = 4
          ),
          material_column(
            width = 4,
            material_card(
              textOutput("cantidad_hijos"),
              tags$head(tags$style("#cantidad_hijos{
                                   font-size: 45px;
                                   text-align: center;
                                   }"
                         )
              )
            )
          ),
          material_column(
            width = 4
          )
        ),
        material_row(
          material_column(
            width = 1,
            plotOutput("baby1")
          ),
          material_column(
            width = 1,
            plotOutput("baby2")
          ),
          material_column(
            width = 1,
            plotOutput("baby3")
          ),
          material_column(
            width = 1,
            plotOutput("baby4")
          ),
          material_column(
            width = 1,
            plotOutput("baby5")
          ),
          material_column(
            width = 1,
            plotOutput("baby6")
          ),
          material_column(
            width = 1,
            plotOutput("baby7")
          ),
          material_column(
            width = 1,
            plotOutput("baby8")
          ),
          material_column(
            width = 1,
            plotOutput("baby9")
          ),
          material_column(
            width = 1,
            plotOutput("baby10")
          )
        )
      )
    )
  ),
  material_row(
    material_column(
      width = 12,
      material_card(
        material_row(
          material_column(
            width = 8,
            h5("Desarrollado por StatsVision ® 2018")
          ),
          material_column(
            width = 4,
            h5("Síguenos"),
            tags$img(src = "facebook.png"),
            tags$img(src = "twitter.png"),
            tags$img(src = "youtube.png")
            
          )
        )
      )
    )
  )
)

# SERVER ---------------------------------------------------------------------
# ------------------------------------------------------------------------------
  
server <- function(input, output) {
  

  babyImage <- reactive({
    # When input$n is 1, filename is ./images/image1.jpeg
    filename <- normalizePath(file.path('./images',
                                        paste('baby','.png', sep='')))
  })
  
  babyImageGray <- reactive({
    # When input$n is 1, filename is ./images/image1.jpeg
    filename <- normalizePath(file.path('./images',
                                        paste('baby-gray','.png', sep='')))
  })
  
  
  output$baby1 <- renderImage({
    
    if(input$cantidad >= 1){
      list(src = babyImage())
    }
    else{
      list(src = babyImageGray())
    }
  }, deleteFile = FALSE)

output$baby2 <- renderImage({
  
  if(input$cantidad >= 2){
    list(src = babyImage())
  }
  else{
    list(src = babyImageGray())
  }
}, deleteFile = FALSE)

output$baby3 <- renderImage({
  
  if(input$cantidad >= 3){
    list(src = babyImage())
  }
  else{
    list(src = babyImageGray())
  }
}, deleteFile = FALSE)

output$baby4 <- renderImage({
  
  if(input$cantidad >= 4){
    list(src = babyImage())
  }
  else{
    list(src = babyImageGray())
  }
}, deleteFile = FALSE)

output$baby5 <- renderImage({
  
  if(input$cantidad >= 5){
    list(src = babyImage())
  }
  else{
    list(src = babyImageGray())
  }
}, deleteFile = FALSE)

output$baby6 <- renderImage({
  
  if(input$cantidad >= 6){
    list(src = babyImage())
  }
  else{
    list(src = babyImageGray())
  }
}, deleteFile = FALSE)

output$baby7 <- renderImage({
  
  if(input$cantidad >= 7){
    list(src = babyImage())
  }
  else{
    list(src = babyImageGray())
  }
}, deleteFile = FALSE)

output$baby8 <- renderImage({
  
  if(input$cantidad >= 8){
    list(src = babyImage())
  }
  else{
    list(src = babyImageGray())
  }
}, deleteFile = FALSE)

output$baby9 <- renderImage({
  
  if(input$cantidad >= 9){
    list(src = babyImage())
  }
  else{
    list(src = babyImageGray())
  }
}, deleteFile = FALSE)

output$baby10 <- renderImage({
  
  if(input$cantidad >= 10){
    list(src = babyImage())
  }
  else{
    list(src = babyImageGray())
  }
}, deleteFile = FALSE)

output$cantidad_hijos <- renderText({
  paste(input$cantidad," hijos")
})

}

shinyApp(ui = ui, server = server)