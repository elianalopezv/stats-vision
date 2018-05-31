library(gbm)

datos <- read.csv2("D:/Universidad/2018 - 01/TAE/Trabajo 4/datosfinales.csv", header=T, encoding="UTF-8")
datos$P1070 <- as.factor(datos$P1070)
datos$P6020 <- as.factor(datos$P6020)
datos$P6081 <- as.factor(datos$P6081)
datos$P6083 <- as.factor(datos$P6083)
datos$P6080 <- as.factor(datos$P6080)
datos$P9010 <- as.factor(datos$P9010)
datos$P9030 <- as.factor(datos$P9030)
datos$P5095 <- as.factor(datos$P5095)

#Boosting
boost.datos<-gbm(ch~P1070+P6020+P6040+P6081+P6083+
                   P6080+P9010+P9030+CANT_PERSONAS_HOGAR+
                   P5095, data=datos,
                  distribution="multinomial",
                  n.trees=5000,interaction.depth=4)

#Guardamos el modelo de predicción
saveRDS(boost.datos, "D:/Universidad/2018 - 01/TAE/Trabajo 4/modeloTAE.rds")

#Cargamos el modelo de predicción guardado como modeloTAE.rds
mk <- readRDS("D:/Universidad/2018 - 01/TAE/Trabajo 4/stats-vision/modeloTAE.rds")

#Caracteristicas del hogar
c3 <- data.frame(P1070="1",P6020="2",P6040=38,P6081="1",P6083="1",
                 P6080="1",P9010="2",P9030="1",
                 CANT_PERSONAS_HOGAR=8,P5095="1")

#--------Prediccion normal
pred.boost<-predict(boost.datos, newdata=c3,
                    n.trees=5000,
                    type="response")
pred.boost

#---------Prediccion con save y load
predk.boost<-predict(mk, newdata=c3,
                    n.trees=5000,
                    type="response")
predk.boost

predk.boost[1]
paste(round(predk.boost[1]*100, 4),"%")

c1 <- data.frame(P1070="1",P6020="2",P6040=28,P6081="3",P6083="3",
                 P6080="1",P9010="2",P9030="1",
                 CANT_PERSONAS_HOGAR=1,P5095="1")
predk.boost<-predict(mk, newdata=c1,
                     n.trees=5000,
                     type="response")
prob <- double(10)
prob
