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
        HTML(paste0('<iframe width="630" height="500" src="https://www.youtube.com/embed/Oiq-Al1ZdN8',
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
          input_id = "tipo_Vivienda",
          label = "Tipo de vivienda actual",
          choices = c(
            "Casa" = "1",
            "Apartamento" = "2",
            "Cuarto" = "3",
            #"Vivienda Indígena" = "4",
            "Otro" = "5"
          ),
          selected = "1"
        ),
        material_dropdown(
          input_id = "sexo",
          label = "Sexo",
          choices = c(
            "Hombre" = "1",
            "Mujer" = "2"
          ),
          selected = "0"
        ),
        #material_switch(
        #  input_id = "conyuge_en_hogar",
        #  label = "El (la) cónyuge vive en el hogar",
        #  off_label = "No",
        #  on_label = "Sí"
        #),
        material_dropdown(
          input_id = "padre_en_hogar",
          label = "El padre vive en el hogar",
          choices = c(
            "Sí" = "1",
            "No" = "2",
            "Fallecido" = "3"
          ),
          selected = "1"
        ),
        material_dropdown(
          input_id = "madre_en_hogar",
          label = "La madre vive en el hogar",
          choices = c(
            "Sí" = "1",
            "No" = "2",
            "Fallecida" = "3"
          ),
          selected = "1"
        ),
        material_dropdown(
          input_id = "se_reconoce",
          label = "La familia se reconoce como",
          choices = c(
            "Indígena" = "1",
            "Gitano(a)" = "2",
            "Raizal" = "3",
            "Palenquero" = "4",
            "Negro, mulato, afrodescendiente" = "5",
            "Ninguno" = "6"
          ),
          selected = "1"
        ),
        material_switch(
          input_id = "sentimiento_seguridad",
          label = "En el barrio, pueblo o vereda se siente",
          off_label = "Seguro",
          on_label = "Inseguro"
        ),
        material_dropdown(
          input_id = "condiciones_hogar",
          label = "Las condiciones de vida en el hogar son",
          choices = c(
            "muy buenas" = "1",
            "Buenas" = "2",
            "Regulares" = "3",
            "Malas" = "4"
          ),
          selected = "1"
        ),
        #material_dropdown(
        #  input_id = "ingresos_hogar",
        #  label = "Los ingresos del hogar",
        #  choices = c(
        #    "No alcanzan para cubrir los gastos mínimos" = "1",
        #    "Sólo alcanzan para cubrir los gastos mínimos" = "2",
        #    "Cubren más que los gastos mínimos" = "3"
        #  ),
        #  selected = "1"
        #),
        #material_switch(
        #  input_id = "considera_pobre",
        #  label = "Se considera pobre",
        #  off_label = "Sí",
        #  on_label = "No"
        #),
        material_dropdown(
          input_id = "vivienda_es",
          label = "La vivienda es",
          choices = c(
            "Propia, totalmente pagada" = "1",
            "Propia, la están pagando" = "2",
            "En arriendo o subarriendo" = "3",
            "Permiso del propietario sin paga alguna" = "4",
            "Posesión sin título" = "5",
            "Propiedad colectiva" = "6"
          ),
          selected = "1"
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

  #Lectura del modelo
  modcf <- readRDS("./modeloTAE.rds")  

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

probabilidades <- reactive({
  
  #Probabilidad de acuerdo a las caracteristicas de la familia--------
  c1 <- data.frame(P1070 = input$tipo_vivienda,
                   P6020 = input$sexo,
                   P6081 = input$padre_en_hogar,
                   P6083 = input$madre_en_hogar,
                   P6080 = input$se_reconoce,
                   P9010 = if (input$sentimiento_seguridad) "1" else "2",
                   P9030 = input$condiciones_hogar,
                   P5095 = input$vivienda_es)
  
  ProbList <- predict(modcf, c1, type="prob")
})

}

shinyApp(ui = ui, server = server)