library(shiny)
library(shinymaterial)
library(datasets)
library(gbm)
library(shinyjs)

# UI ---------------------------------------------------------------------
# --------------------------------------------------------------------------
ui <- material_page(
  
  includeCSS("styles.css"),
  #shinyjs::useShinyjs(),
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
        HTML(paste0('<iframe width="630" height="500" src="https://www.youtube.com/embed/3SrZW7GVvbI',
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
        
        material_dropdown(
          input_id = "tipo_vivienda",
          label = "Tipo de vivienda actual",
          choices = c(
            "Casa" = "1",
            "Apartamento" = "2",
            "Cuarto" = "3",
            "Vivienda Indígena" = "4",
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
        material_slider(
          label = "Años cumplidos",
          input_id = "anios",
          min_value = 15,
          max_value = 100,
          initial_value = 20
        ),
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
            "Muy buenas" = "1",
            "Buenas" = "2",
            "Regulares" = "3",
            "Malas" = "4"
          ),
          selected = "1"
        ),
        material_slider(
          label = "Número de personas en el hogar",
          input_id = "personas",
          min_value = 1,
          max_value = 11,
          initial_value = 2
        ),
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
        
        ## -------- Row para las probabilidades
        material_row(
          material_column(
            width = 3
          )
        ),
        material_row(
          material_column(
            width = 4,
            material_card(
              #title = "1 Hijo",
              textOutput("probabilidad1"),
              tags$head(tags$style("#probabilidad1{
                                   font-size: 20px;
                                   text-align: center;
                                   }"
                         )
              )
              )
              ),
          material_column(
            width = 4,
            material_card(
              #title = "2 Hijos",
              textOutput("probabilidad2"),
              tags$head(tags$style("#probabilidad2{
                                   font-size: 20px;
                                   text-align: center;
                                   }"
                         )
              )
              )
              ),
          material_column(
            width = 4,
            material_card(
              #title = "3 Hijos",
              textOutput("probabilidad3"),
              tags$head(tags$style("#probabilidad3{
                                   font-size: 20px;
                                   text-align: center;
                                   }"
                         )
              )
              )
              )
        ),
        ## ------- Row para el número de hijos
        material_row(
          material_column(
            width = 2
          ),
          material_column(
            width = 8,
            tags$label("La probabilidad más alta muestra que, para una familia
                       con las características ingresadas, en su hogar habría:",
                       style = "font-size: 22px;
                                color: black;
                                text-align: center;")
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
            height = "100px",
            plotOutput("baby1")
          ),
          material_column(
            width = 1,
            height = 1,
            plotOutput("baby2")
          ),
          material_column(
            width = 1,
            height = 1,
            plotOutput("baby3")
          ),
          material_column(
            width = 1,
            height = 1,
            plotOutput("baby4")
          ),
          material_column(
            width = 1,
            height = 1,
            plotOutput("baby5")
          ),
          material_column(
            width = 1,
            height = 1,
            plotOutput("baby6")
          ),
          material_column(
            width = 1,
            height = 1,
            plotOutput("baby7")
          ),
          material_column(
            width = 1,
            height = 1,
            plotOutput("baby8")
          ),
          material_column(
            width = 1,
            height = 1,
            plotOutput("baby9")
          ),
          material_column(
            width = 1,
            height = 0.2,
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

modcf <- readRDS("./modeloTAE.rds")

probfunction <- function(k){
  pred.boost<-predict(modcf, newdata=k,
                      n.trees=5000,
                      type="response")
}

  
server <- function(input, output) {
  
  probabilidades <- reactive({
    #Probabilidad de acuerdo a las caracteristicas de la familia--------
    c1 <- data.frame(P1070 = input$tipo_vivienda,
                     P6020 = input$sexo,
                     P6040 = input$anios,
                     P6081 = input$padre_en_hogar,
                     P6083 = input$madre_en_hogar,
                     P6080 = input$se_reconoce,
                     P9010 = if (input$sentimiento_seguridad) "1" else "2",
                     P9030 = input$condiciones_hogar,
                     CANT_PERSONAS_HOGAR = input$personas,
                     P5095 = input$vivienda_es)
    c3 <- data.frame(P1070="1",P6020="2",P6040=28,P6081="3",P6083="3",
                     P6080="1",P9010="2",P9030="1",
                     CANT_PERSONAS_HOGAR=1,P5095="1")
    
    pred.boost<-predict(modcf, newdata=c1,
                        n.trees=5000,
                        type="response")
    
  })
  output$probabilidad1<- renderText({
    Prob <- probabilidades()
    paste("Con una probabilidad de ", round(max(Prob)*100, 4),"%", "habría ", which.max(Prob), " hijo(s)")
  })  
  
  output$probabilidad2<- renderText({
    Prob <- probabilidades()
    Prob2 <- Prob[-(which.max(Prob))]
    paste("Con una probabilidad de ", round(max(Prob2)*100, 4),"%", "habría ", which(Prob==max(Prob2)), " hijo(s)")
  })
  output$probabilidad3<- renderText({
    Prob <- probabilidades()
    Prob2 <- Prob[-(which.max(Prob))]
    Prob3 <- Prob2[-(which.max(Prob2))]
    paste("Con una probabilidad de ", round(max(Prob3)*100, 4),"%", "habría ", which(Prob==max(Prob3)), " hijo(s)")
  })
  
  
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
    Prob <- probabilidades()
    if(which.max(Prob) >= 1){
      list(src = babyImage())
    }
    else{
      list(src = babyImageGray())
    }
  }, deleteFile = FALSE)

output$baby2 <- renderImage({
  Prob <- probabilidades()
  if(which.max(Prob) >= 2){
    list(src = babyImage())
  }
  else{
    list(src = babyImageGray())
  }
}, deleteFile = FALSE)

output$baby3 <- renderImage({
  Prob <- probabilidades()
  if(which.max(Prob) >= 3){
    list(src = babyImage())
  }
  else{
    list(src = babyImageGray())
  }
}, deleteFile = FALSE)

output$baby4 <- renderImage({
  Prob <- probabilidades()
  if(which.max(Prob) >= 4){
    list(src = babyImage())
  }
  else{
    list(src = babyImageGray())
  }
}, deleteFile = FALSE)

output$baby5 <- renderImage({
  Prob <- probabilidades()
  if(which.max(Prob) >= 5){
    list(src = babyImage())
  }
  else{
    list(src = babyImageGray())
  }
}, deleteFile = FALSE)

output$baby6 <- renderImage({
  Prob <- probabilidades()
  if(which.max(Prob) >= 6){
    list(src = babyImage())
  }
  else{
    list(src = babyImageGray())
  }
}, deleteFile = FALSE)

output$baby7 <- renderImage({
  Prob <- probabilidades()
  if(which.max(Prob) >= 7){
    list(src = babyImage())
  }
  else{
    list(src = babyImageGray())
  }
}, deleteFile = FALSE)

output$baby8 <- renderImage({
  Prob <- probabilidades()
  if(which.max(Prob) >= 8){
    list(src = babyImage())
  }
  else{
    list(src = babyImageGray())
  }
}, deleteFile = FALSE)

output$baby9 <- renderImage({
  Prob <- probabilidades()
  if(which.max(Prob) >= 9){
    list(src = babyImage())
  }
  else{
    list(src = babyImageGray())
  }
}, deleteFile = FALSE)

output$baby10 <- renderImage({
  Prob <- probabilidades()
  if(which.max(Prob) >= 10){
    list(src = babyImage())
  }
  else{
    list(src = babyImageGray())
  }
}, deleteFile = FALSE)

output$cantidad_hijos <- renderText({
  Prob <- probabilidades()
  paste(which.max(Prob)," hijo(s)")
})

  #----------------------------------Lectura del modelo
  #modcf <- readRDS("./modeloTAE.rds")  


#Para poner en Disabled las opciones a restringir
  observeEvent(input$personas, {
    if(input$personas == 1){
      shinyjs::disable("padre_en_hogar") 
      shinyjs::disable("madre_en_hogar")
    } 
  })
  
  
  
}

shinyApp(ui = ui, server = server)