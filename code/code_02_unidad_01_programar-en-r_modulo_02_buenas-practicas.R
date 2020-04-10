#### Programar en R - Buenas Prácticas ####
# Fuente: https://rstats.wtf/
#         https://peerj.com/collections/50-practicaldatascistats/+

#### 1. Siempre partir en blanco       ####
# Guardar el codigo fuente, no el environment
# Usar un IDE
# No guardar el workspace
# No cargar el workspace
# Reiniciar la sesión a menudo utilizando ctrl + shift + F10
# Ojo con rm(list = ls())
# Archivos que demora crear: Modularizar y guardar por pasos. 
# Automatizar flujos de trabajo

#### 2. Proyectos como método          ####
# Metodología de trabajo basada en proyectos
# Organizar proyectos intencionadamente 
#   disciplina en el sistema de archivos
#   intencionalidad de la dirección de trabajo
#   disciplina en las direcciones de archivos
# Direccion de trabajo fija. Adiós setwd()
# Más ordenado
# Más replicable
# Cosas fáciles de encontrar
# Carpetas separadas
#   code
#   raw
#   data
#   figs
#   rmd
#   docs
getwd()
setwd("/Users/nacho/mis documentos/rata science/proyectos/encuestas/r/data")
setwd("/Esta/direccion/solo/funciona/en/mi/comuputador")

source("code/code_01_setup_02_libraries.R")

x = c(1:100)
y = c(1:100)

library(readr)

write_rds(x, "data/x.rds") # .RData
write_rds(y, "data/y.rds")

x = read_rds("data/x.rds")
y = read_rds("data/y.rds")

library(tibble)
library(magrittr)
library(ggplot2)

tibble(1:100,1:100)
tibble(x = 1:100, y = 1:100) %>% ggplot(aes(x,y)) + geom_line()

gg1 <- tibble(x = x) %>% ggplot(aes(x,y)) + geom_line() 
gg1
ggsave("figs/gg1.png", gg1)

write_rds(gg1, "data/gg1.rds")


#### 3. Nombrar Variabes               ####
# Tres Principios
#    Legible por maquinas
#    Legible por humanos
#    Funciona bien el ordenamiento estandar

#    Legible por maquinas
#       regular expression and globbing friendly
#          - avoid spaces, punctuation, accented
#       characters, case sensitivity
#       easy to compute on
#          - deliberate use of delimiters

#    Legible por humanos
#    regular expression and globbing friendly
#    - avoid spaces, punctuation, accented
#    characters, case sensitivity
#    easy to compute on
#    - deliberate use of delimiters

data <- data %>% mutate() 
data <- data %>% filter() 
data <- data %>% mutate      
data <- data %>% mutate      
data <- data %>% mutate      
data <- data %>% select()
data <- data %>% summarise()
data <- data %>% summarise()


list.files(path = "code", pattern = "unidad_01")
dir("code")

x <- tibble(dir = dir("code")) 

# Ejemplos:

# Estandarizar
#        resultados_terreno_1, result.terr.2, result_terreno_3 
#        resultados_terreno_1, resultados_terreno_2, resultados_terreno_3

# Siempre en minúsculas
#        resultados_terreno_1, RESULTADOS_TERRENO_2, Resultados_Terreno_3
#        resultados_terreno_1, resultados_terreno_2, resultados_terreno_3

# Usar _ en vez de nada, espacios o puntos
#        resultadosterreno1, `resultados terreno 2`, resultados.terreno.3
#        resultados_terreno_1, resultados_terreno_2, resultados_terreno_3

t <- tibble(resultadosterreno1 = 1:10, 
            `RESULTADO terreno 2`= letters[1:10], 
            Result.Terr.3 = 100:91, 
            datos_irrelevantes = LETTERS[1:10])

t %>% select(starts_with("resultados"))

t <- tibble(resultados_terreno_1 = 1:10         ,
            resultados_terreno_2 = letters[1:10], 
            resultados_terreno_3 = 100:91       ,
            datos_irrelevantes  = LETTERS[1:10])

t %>% select(starts_with("resultados"))



# También aplica a nombres de archivos de codigo

library(magrittr)
library(dplyr)
library(stringr)
dir("code")

tibble(dir = dir("code")) 
tibble(dir = dir("code")) %>% filter(str_detect(dir,"unidad_02"))
tibble(dir = dir("code")) %>% filter(str_detect(dir,"unidad_02"),str_detect(dir,"modulo_02"))

