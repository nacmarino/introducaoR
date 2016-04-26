
# Control + Shift + F10 = reiniciar sessão do R
# Control + L = limpar o console

# limpando tudo -----------------------------------------------------------
rm(list=ls(all=TRUE))


# lendo txt ---------------------------------------------------------------

# preciso ler aquele arquivo difícil chamado dados_pequeno.txt
dados <- read.table(file = "Dia 1/dados/dados_pequeno.txt", 
                    header = TRUE)
head(dados)


# carregando pacotes ------------------------------------------------------

library(readxl)
library(readr)


# lendo um arquivo xlsx ---------------------------------------------------

# usamos o pacote readxl
# ler os dados bioticos.xlsx, da pasta dados do Dia 2

bioticos <- read_excel(path = "Dia 2/dados/bioticos.xlsx")
head(bioticos)


# ler um arquivo xls ------------------------------------------------------

# usamos o pacote readr
# ler os dados abioticos

abioticos <- read_tsv(file = "Dia 2/dados/abioticos.xls")
head(abioticos)
