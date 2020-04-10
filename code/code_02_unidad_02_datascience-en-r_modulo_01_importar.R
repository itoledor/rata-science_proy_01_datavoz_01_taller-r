####  Data Science en R                  ####
####  Setup

# source("code/code_01_setup_01_packages.R" )
source("code/code_01_setup_02_libraries.R")
source("code/code_01_setup_03_functions.R")

#### Read_data

conciyt  <- read_sav("raw/Base_Usuarios_CONICYT_Finalv7.sav")
empresas <- read_xlsx("raw/sii_empresas_2018.xlsx") 
censo    <- read_csv2("raw/Censo2017_16R_ManzanaEntidad_CSV/Censo2017_Manzanas.csv")


data <- read_sav("raw/Base_Usuarios_CONICYT_Finalv7.sav")

data$DIA %>% class()

sexo <- as_factor(data$SEXO)

as.factor(data) # Solo admite objetos clase vector

as_factor(data) # también admite objetos clase data.frame

data <- data %>% as_factor(only_labelled = TRUE)

data %>% colnames
colnames(data)

summarise(group_by(data, SEXO, P5), edad_prom = mean(Edad))
mutate(group_by(data, SEXO, P5), edad_prom = mean(Edad))
transmute(group_by(data, SEXO, P5), edad_prom = mean(Edad))

data %>% group_by(SEXO) %>% summarise(edad_prom = mean(Edad))

data$SEXO
data$Edad_Tramos

#### Tablas de Contingencia ####
# base

table(data$SEXO, data$Edad_Tramos)                            # Tabla de contingencia
table(data$SEXO, data$Edad_Tramos) %>% prop.table(          ) # Tabla de contingencia en proporciones  
table(data$SEXO, data$Edad_Tramos) %>% prop.table(margin = 1) # Tabla de contingencia en proporciones horizontal 
table(data$SEXO, data$Edad_Tramos) %>% prop.table(margin = 2) # Tabla de contingencia en proporciones vertical

# tidy

data %>% tabyl(SEXO, Edad_Tramos)                              # Tabla de contingencia
data %>% tabyl(SEXO, Edad_Tramos) %>% adorn_totals("row")      # Tabla de contingencia con totales vertical 
data %>% tabyl(SEXO, Edad_Tramos) %>% adorn_totals("col")      # Tabla de contingencia con totales horizontal 
data %>% tabyl(SEXO, Edad_Tramos) %>% adorn_percentages("row") # Tabla de contingencia en proporciones horizontal  
data %>% tabyl(SEXO, Edad_Tramos) %>% adorn_percentages("col") # Tabla de contingencia en proporciones vertical 

# tabyl 2 variables

data %>% tabyl(SEXO, Edad_Tramos) 
data %>% tabyl(SEXO, Edad_Tramos) %>% adorn_totals("col") 
data %>% tabyl(SEXO, Edad_Tramos) %>% adorn_totals("col") %>% adorn_percentages("row") 
data %>% tabyl(SEXO, Edad_Tramos) %>% adorn_totals("col") %>% adorn_percentages("row") %>% adorn_pct_formatting(digits = ) 
data %>% tabyl(SEXO, Edad_Tramos) %>% adorn_totals("col") %>% adorn_percentages("row") %>% adorn_pct_formatting(rounding = "half up", digits = 2) 
data %>% tabyl(SEXO, Edad_Tramos) %>% adorn_totals("col") %>% adorn_percentages("row") %>% adorn_pct_formatting(rounding = "half up", digits = 0) %>% adorn_ns()
data %>% tabyl(SEXO, Edad_Tramos) %>% adorn_totals("col") %>% adorn_percentages("row") %>% adorn_pct_formatting(rounding = "half up", digits = 0) %>% adorn_ns() %>% adorn_title() 
data %>% tabyl(SEXO, Edad_Tramos) %>% adorn_totals("col") %>% adorn_percentages("row") %>% adorn_pct_formatting(rounding = "half up", digits = 0) %>% adorn_ns() %>% adorn_title("combined")
data_tabyl <-  data %>% tabyl(SEXO, Edad_Tramos) %>% adorn_totals("col") %>% adorn_percentages("row") %>% adorn_pct_formatting(rounding = "half up", digits = 0) %>% adorn_ns() %>% adorn_title("combined") %>% kable()

library(kableExtra)

write_rds(data_tabyl, "data/dataviz.rds")

#### Visualización ####

data_tabyl <- data %>% tabyl(SEXO, Edad_Tramos) 
data_tabyl %>%
  as_tibble() %>% 
  pivot_longer(cols = -SEXO,
               names_to = "Edad_Tramos",
               values_to = "n") %>% 
  ggplot(aes(x = Edad_Tramos, y = n, fill = SEXO, position = "fill")) +
  geom_col()


data %>% 
  ggplot(aes(x = Edad_Tramos, fill = SEXO)) +
  geom_bar(position = "stack")

data %>% 
  ggplot(aes(x = Edad_Tramos, fill = SEXO)) +
  geom_bar(position = "fill") 

