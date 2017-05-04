# limpando ambiente -------------------------------------------------------------------------------------------------------------------
rm(list = ls(all = TRUE))

# carregando pacote -------------------------------------------------------------------------------------------------------------------

library(tidyverse)

# carregando dados --------------------------------------------------------------------------------------------------------------------

dados <- read_delim("05_leitura_de_dados/dados/lista_de_presenca.csv", delim = ";")

# resumindo dados ---------------------------------------------------------------------------------------------------------------------

## ouvintes por palestras por formacao
dados %>% 
  group_by(palestra, formacao_ouvinte) %>% 
  summarise(Presentes = n()) %>% 
  write_csv("08_operacoes/dados/palestras_ouvintes.csv")

## ouvintes por palestras por laboratorio

dados %>% 
  group_by(palestra, laboratorio_ouvinte) %>% 
  summarise(Presentes = n()) %>% 
  write_csv("08_operacoes/dados/palestras_por_laboratorio.csv")

## quem sao os ouvintes

dados %>% 
  distinct(id, .keep_all = TRUE) %>% 
  select(id, formacao_ouvinte, origem_ouvinte, instituicao_ouvinte, laboratorio_ouvinte) %>% 
  write_csv("08_operacoes/dados/ouvintes_das_palestras.csv")

## ouvintes por palestras
dados %>% 
  group_by(palestra, `tema #1`) %>% 
  summarise(Presentes = n()) %>% 
  rename(tema = `tema #1`) %>% 
  write_csv("08_operacoes/dados/ouvintes_por_palestra.csv")
