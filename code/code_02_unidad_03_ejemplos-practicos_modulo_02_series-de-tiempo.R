####  Setup

# source("code/code_01_setup_01_packages.R" )
source("code/code_01_setup_02_libraries.R")
source("code/code_01_setup_03_functions.R")

# library(readr)
# library(tidyr)
# library(dplyr)

corr_table_moneda <- read_xlsx("raw/corr_table_moneda.xlsx")

evol_moneda <- corr_table_moneda %>% pivot_longer(cols = c(starts_with("usd"), starts_with("uf")), names_to = c("moneda", "mes"), names_sep = "_")

evol_moneda <- evol_moneda %>% group_by(año, moneda)
evol_moneda <- evol_moneda %>% summarise(value = mean(value, na.rm = TRUE))

evol_uf     <- evol_moneda %>% filter(moneda == "uf" ) 
evol_uf     <- evol_uf     %>% rename(uf = value) 
evol_uf     <- evol_uf     %>% select(-moneda) 

evol_usd    <- evol_moneda %>% filter(moneda == "usd") 
evol_usd    <- evol_usd    %>% rename(usd = value) 
evol_usd    <- evol_usd    %>% select(-moneda) 

#### usd y uf

moneda_plot <- evol_moneda %>%  ggplot(aes(x = año, y = value, color = moneda)) 
(moneda_plot <- moneda_plot + geom_point())
(moneda_plot <- moneda_plot + geom_line())
(moneda_plot <- moneda_plot + geom_path())
(moneda_plot <- moneda_plot + facet_wrap(.~moneda))
(moneda_plot <- moneda_plot + facet_wrap(.~moneda, scales = "free_y"))

#### usd vs uf

evol_moneda_2 <- evol_uf       %>% left_join(evol_usd, by = "año")
(evol_moneda_2 <- evol_moneda_2 %>% arrange(año))
(evol_moneda_2 <- evol_moneda_2 %>% arrange(usd))

moneda_plot  <- evol_moneda_2 %>% ggplot(aes(x = usd, y = uf)) 
(moneda_plot <- moneda_plot + geom_point())
(moneda_plot <- moneda_plot + geom_line())
(moneda_plot <- moneda_plot + geom_label(aes(label = año)))

moneda_plot  <- evol_moneda_2 %>% ggplot(aes(x = usd, y = uf)) 
(moneda_plot <- moneda_plot + geom_path() )
(moneda_plot <- moneda_plot + geom_point())
(moneda_plot <- moneda_plot + geom_label(aes(label = año)))

#### Variacion porcentual usd y uf

evol_moneda <- evol_moneda %>% group_by(moneda)
(evol_moneda <- evol_moneda %>% mutate(value_1   = lag(value)))
(evol_moneda <- evol_moneda %>% mutate(value_pct = (value - value_1)/value_1))

moneda_plot <- evol_moneda %>%  ggplot(aes(x = año, y = value_pct, color = moneda)) 
(moneda_plot <- moneda_plot + geom_point())
(moneda_plot <- moneda_plot + geom_line())
(moneda_plot <- moneda_plot + geom_path())
(moneda_plot <- moneda_plot + facet_wrap(.~moneda))
