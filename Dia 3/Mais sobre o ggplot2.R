
# carregando pacotes ------------------------------------------------------

library(readr)

# carregando arquivo da memória -------------------------------------------

#read_tsv # xls
#read_excel # xlsx
#read.table # txt

abioticos <- read_tsv(file = "Dia 2/dados/abioticos.xls")
head(abioticos)

g <- ggplot(data = abioticos, mapping = aes(x = Tipo, y = Clorofila)) +
  geom_boxplot(fill = NA) +
  geom_point(mapping = aes(colour = Tipo), size = 5,
             position = position_jitter(width = 0.5), alpha = 0.5)


g <- g + scale_y_continuous(name = "Concentração de Clorofila",
                       breaks = seq(0, 60, by = 10), 
                       limits = c(-2,60))
g

g <- g + scale_x_discrete(name = "Dossel",
                     labels = c("Aberto", "Fechado"))
g

g <- g + theme_bw()
g

grafico <- g + annotate(geom = "text", x = 2.3, y = 60, label = "(a)")

final <- grafico + theme(legend.position = "none")

final

ggsave(filename = "figura.jpeg", plot = final)
