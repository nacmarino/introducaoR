# dados do pacote
library(gapminder)
library(tidyverse)

# relembrando ultima aula
gapminder %>% 
  filter(year == 2007) %>% 
  select(-year) %>% 
  mutate(log_populacao = log10(pop), lifeExp = round(lifeExp, digits = 0)) %>% 
  arrange(lifeExp) %>% 
  group_by(continent) %>% 
  summarise(expectativa_media = mean(lifeExp))

# colocando um vetor em um data.frame
vetor <- paste(1:31, month.name, 2017, sep = "/")
vetor

coletas <- data.frame(vetor)
coletas

separate(data = coletas, col = vetor, into = c("dia", "mes", "ano"), sep = "/")

# formato longo vs largo
library(vegan)
data("varespec")
varespec # formato largo
gapminder # formato longo

exemplo <- varespec

exemplo %>% 
  rownames_to_column(var = "site") %>% 
  tbl_df() %>% 
  gather(key = especie, value = cobertura, Callvulg:Cladphyl) %>% 
  filter(cobertura > 0) %>% 
  spread(key = especie, value = cobertura, fill = 0)
  
# GGPLOT2 -----------------------------------------------------------------
## para carregar o ggplot2
# library(ggplot2)

# o conjunto de dados que trabalharemos
gapminder

## função básica, para criar um grafico rapido
args(qplot)

## o caminho da função ggplot
ggplot()

# uma forma de criar o grafico
ggplot(data = gapminder, mapping = aes(x = year, y = gdpPercap))

## adicionar os pontos
ggplot(data = gapminder, mapping = aes(x = year, y = gdpPercap)) +
  geom_point()

# outra forma de criar o grafico
ggplot() +
  geom_point(data = gapminder, mapping = aes(x = year, y = gdpPercap))
  
# customizar o display dos pontos
ggplot(data = gapminder, mapping = aes(x = year, y = gdpPercap)) +
  geom_point(mapping = aes(fill = continent), shape = 21, size = 8)
  
ggplot(data = gapminder, mapping = aes(x = year, y = gdpPercap)) +
  geom_point(mapping = aes(colour = continent, shape = continent), size = 8)

ggplot(data = gapminder, mapping = aes(x = year, y = gdpPercap)) +
  geom_point(mapping = aes(colour = continent, shape = continent, size = pop))

# paineis
ggplot(data = gapminder, mapping = aes(x = year, y = gdpPercap)) +
  geom_point(mapping = aes(fill = continent), shape = 21, size = 8) +
  facet_grid(facets = ~ continent)

ggplot(data = gapminder, mapping = aes(x = year, y = gdpPercap)) +
  geom_point(mapping = aes(fill = continent), shape = 21, size = 8) +
  facet_wrap(facets = ~ continent)

# facet_grid: paineis em um grid
# facet_wrap: paineis com combinações de variaveis

## exemplo da diferença entre os dois
mtcars

# um facet apenas
ggplot(data = mtcars, mapping = aes(x = hp, y = mpg)) +
  geom_point() +
  facet_grid(facets = ~ cyl)

ggplot(data = mtcars, mapping = aes(x = hp, y = mpg)) +
  geom_point() +
  facet_wrap(facets = ~ cyl)

# dois facets
ggplot(data = mtcars, mapping = aes(x = hp, y = mpg)) +
  geom_point() +
  facet_grid(facets = gear ~ cyl)

ggplot(data = mtcars, mapping = aes(x = hp, y = mpg)) +
  geom_point() +
  facet_wrap(facets = gear ~ cyl)

# mais sobre opções de mapeamento

## por valores de uma variavel continua
ggplot(data = gapminder, mapping = aes(x = year, y = gdpPercap)) +
  geom_point(mapping = aes(fill = lifeExp), shape = 21, size = 4) +
  facet_grid(facets = ~ continent)

ggplot(data = gapminder, mapping = aes(x = year, y = gdpPercap)) +
  geom_point(mapping = aes(fill = lifeExp), shape = 21, size = 4, stroke = 2) +
  facet_grid(facets = ~ continent)

ggplot(data = gapminder, mapping = aes(x = year, y = gdpPercap)) +
  geom_point(size = 4, position = position_jitter(width = 0.5))

ggplot(data = gapminder, mapping = aes(x = year, y = gdpPercap)) +
  geom_point(size = 4, position = position_jitter(width = 0.5), alpha = 0.5)

# multiplos geoms
ggplot(data = gapminder, mapping = aes(x = year, y = gdpPercap)) +
  geom_point(size = 4, position = position_jitter(width = 0.5), alpha = 0.5) +
  geom_smooth(size = 1, se = FALSE, method = "loess")

ggplot(data = gapminder, mapping = aes(x = year, y = gdpPercap)) +
  geom_point(mapping = aes(fill = continent), size = 4, shape = 21,
             position = position_jitter(width = 0.5), alpha = 0.5) +
  geom_smooth(mapping = aes(colour = continent), size = 2, se = FALSE)

ggplot(data = gapminder, mapping = aes(x = year, y = gdpPercap)) +
  geom_smooth(mapping = aes(colour = continent), size = 2, se = FALSE) + 
  geom_point(mapping = aes(fill = continent), size = 4, shape = 21,
             position = position_jitter(width = 0.5), alpha = 0.5)

# BOXPLOT

ggplot(data = gapminder, mapping = aes(x = continent, y = gdpPercap)) +
  geom_boxplot()


ggplot(data = gapminder, mapping = aes(x = continent, y = gdpPercap)) +  
  geom_boxplot() +
  geom_point()

### EXERCICIO PARA ENTREGAR
# a. altere o preenchimento dos boxplots
# b. mude a cor dos outliers
# c. altere a largura do boxplot
# d. altere as cores das linhas que formam o boxplot
# e. sobreponha os pontos da relação ao boxplot (preenchimento dos pontos = ao do boxplot), 
#### reduzindo a sobreposicao entre pontos que você acabou de sobrepor. É preciso que você
#### remova os outliers do boxplot antes!(colour = NA)

# QUAL A DIFERENÇA DE ESPECIFICAR AS COISAS DENTRO DO AESTHETIC E FORA DELE?

ggplot(data = gapminder, mapping = aes(x = continent, y = gdpPercap)) +  
  geom_boxplot(fill = "gold")

ggplot(data = gapminder, mapping = aes(x = continent, y = gdpPercap)) +  
  geom_boxplot(fill = continent)

ggplot(data = gapminder, mapping = aes(x = continent, y = gdpPercap)) +  
  geom_boxplot(mapping = aes(fill = continent))

ggplot(data = gapminder, mapping = aes(x = continent, y = gdpPercap)) +  
  geom_boxplot(mapping = aes(fill = "gold"))

ggplot(data = gapminder, mapping = aes(x = continent, y = gdpPercap)) +  
  geom_boxplot(mapping = aes(fill = continent), fill = "gold")

# MANIPULAÇÃO E EDIÇÃO DO GGPLOT ------------------------------------------

figura <- ggplot(data = gapminder, mapping = aes(x = continent, y = gdpPercap, fill = continent)) +  
  geom_boxplot()
figura

figura +
  scale_fill_grey()

figura +
  scale_fill_manual(values = c("gold", "firebrick2", "deepskyblue3", "forestgreen", "orange3"))

# pacote dichromat, para daltonicos
# pacote viridis, com muitas paletas de cores pre-programadas
figura +
  scale_fill_manual(values = heat.colors(5))

# um exemplo com um gradiente contínuo de cores
ggplot(data = gapminder, mapping = aes(x = year, y = gdpPercap)) +
  geom_point(mapping = aes(fill = lifeExp, alpha = continent), shape = 21, size = 4, stroke = 2) +
  scale_fill_gradient(low = "firebrick1", high = "deepskyblue")

# seguindo a aula...
figura <- figura +
  scale_fill_manual(values = heat.colors(5))
figura

# sem efeito, pois não mapeamos a variavel continente ao alpha
figura +
  scale_alpha_manual(values = c(0.1, 0.3, 0.5, 0.7, 0.9)) 

ggplot(data = gapminder, mapping = aes(x = continent, y = gdpPercap, fill = continent)) +  
  geom_boxplot(show.legend = FALSE) +
  scale_fill_manual(values = heat.colors(5))

# titulos dos eixos
## uma forma
ggplot(data = gapminder, mapping = aes(x = continent, y = gdpPercap, fill = continent)) +  
  geom_boxplot(show.legend = FALSE) +
  scale_fill_manual(values = heat.colors(5)) +
  ylab("Produto Interno Bruto per capita (USD)") +
  xlab("Continente")

## outra forma
ggplot(data = gapminder, mapping = aes(x = continent, y = gdpPercap, fill = continent)) +  
  geom_boxplot(show.legend = FALSE) +
  scale_fill_manual(values = heat.colors(5)) +
  scale_x_discrete("Continente", labels = c("África", "Américas", "Ásia", "Europa", "Oceania"))


### para enganar o ggplot2
ggplot(data = gapminder, mapping = aes(x = continent, y = gdpPercap, fill = continent)) +  
  geom_boxplot(show.legend = FALSE) +
  scale_fill_manual(values = heat.colors(5)) +
  scale_x_discrete("Continente", labels = c("África", "Américas", "Ásia", "Europa", "Oceania")) +
  scale_y_continuous("Produto Interno Bruto per capita (USD)", 
                     breaks  = seq(from = 0, to = 120000, by = 15000),
                     labels = c(0, "", 30000, "", 60000, "", 90000, "", 120000))

### mais edições para o eixo y
ggplot(data = gapminder, mapping = aes(x = continent, y = gdpPercap, fill = continent)) +  
  geom_boxplot(show.legend = FALSE) +
  scale_fill_manual(values = heat.colors(5)) +
  scale_x_discrete("Continente", labels = c("África", "Américas", "Ásia", "Europa", "Oceania")) +
  scale_y_continuous("Produto Interno Bruto per capita (USD)", 
                     breaks  = seq(from = 0, to = 120000, by = 15000), 
                     limits = c(0, 125000), expand = c(0, 0))

## temas
ggplot(data = gapminder, mapping = aes(x = continent, y = gdpPercap, fill = continent)) +  
  geom_boxplot(show.legend = FALSE) +
  scale_fill_manual(values = heat.colors(5)) +
  scale_x_discrete("Continente", labels = c("África", "Américas", "Ásia", "Europa", "Oceania")) +
  scale_y_continuous("Produto Interno Bruto per capita (USD)", 
                     breaks  = seq(from = 0, to = 120000, by = 15000), 
                     limits = c(0, 125000), expand = c(0, 0)) +
  theme_bw()

ggplot(data = gapminder, mapping = aes(x = continent, y = gdpPercap, fill = continent)) +  
  geom_boxplot(show.legend = FALSE) +
  scale_fill_manual(values = heat.colors(5)) +
  scale_x_discrete("Continente", labels = c("África", "Américas", "Ásia", "Europa", "Oceania")) +
  scale_y_continuous("Produto Interno Bruto per capita (USD)", 
                     breaks  = seq(from = 0, to = 120000, by = 15000), 
                     limits = c(0, 125000), expand = c(0, 0)) +
  theme_dark()

#### um pacote util com outros temas pre-programados
library(ggthemes)


ggplot(data = gapminder, mapping = aes(x = continent, y = gdpPercap, fill = continent)) +  
  geom_boxplot(show.legend = FALSE) +
  scale_fill_manual(values = heat.colors(5)) +
  scale_x_discrete("Continente", labels = c("África", "Américas", "Ásia", "Europa", "Oceania")) +
  scale_y_continuous("Produto Interno Bruto per capita (USD)", 
                     breaks  = seq(from = 0, to = 120000, by = 15000), 
                     limits = c(0, 125000), expand = c(0, 0)) +
  theme_base()

ggplot(data = gapminder, mapping = aes(x = continent, y = gdpPercap, fill = continent)) +  
  geom_boxplot(show.legend = FALSE) +
  scale_fill_manual(values = heat.colors(5)) +
  scale_x_discrete("Continente", labels = c("África", "Américas", "Ásia", "Europa", "Oceania")) +
  scale_y_continuous("Produto Interno Bruto per capita (USD)", 
                     breaks  = seq(from = 0, to = 120000, by = 15000), 
                     limits = c(0, 125000), expand = c(0, 0)) +
  theme_excel()

ggplot(data = gapminder, mapping = aes(x = continent, y = gdpPercap, fill = continent)) +  
  geom_boxplot(show.legend = FALSE) +
  scale_fill_manual(values = heat.colors(5)) +
  scale_x_discrete("Continente", labels = c("África", "Américas", "Ásia", "Europa", "Oceania")) +
  scale_y_continuous("Produto Interno Bruto per capita (USD)", 
                     breaks  = seq(from = 0, to = 120000, by = 15000), 
                     limits = c(0, 125000), expand = c(0, 0)) +
  theme_economist()

## faça você mesmo
ggplot(data = gapminder, mapping = aes(x = continent, y = gdpPercap, fill = continent)) +  
  geom_boxplot(show.legend = FALSE) +
  scale_fill_manual(values = heat.colors(5)) +
  scale_x_discrete("Continente", labels = c("África", "Américas", "Ásia", "Europa", "Oceania")) +
  scale_y_continuous("Produto Interno Bruto per capita (USD)", 
                     breaks  = seq(from = 0, to = 120000, by = 15000), 
                     limits = c(0, 125000)) +
  theme(axis.title = element_text(face = "bold", colour = "black", size = 20),
        axis.title.y = element_text(face = "bold.italic", colour = "black", size = 20),
        axis.text = element_text(colour = "black", size = 18),
        panel.background = element_rect(fill = NA, colour = "black"),
        panel.grid = element_blank())


## colocando o tema em um objeto
meu_tema <- theme(axis.title = element_text(face = "bold", colour = "black", size = 20),
                  axis.title.y = element_text(face = "bold.italic", colour = "black", size = 20),
                  axis.text = element_text(colour = "black", size = 18),
                  panel.background = element_rect(fill = NA, colour = NA),
                  panel.grid = element_blank(),
                  axis.line.x = element_line(colour = "black"),
                  axis.line.y = element_line(colour = "black"))

ggplot(data = gapminder, mapping = aes(x = continent, y = gdpPercap, fill = continent)) +  
  geom_boxplot(show.legend = FALSE) +
  scale_fill_manual(values = heat.colors(5)) +
  scale_x_discrete("Continente", labels = c("África", "Américas", "Ásia", "Europa", "Oceania")) +
  scale_y_continuous("Produto Interno Bruto per capita (USD)", 
                     breaks  = seq(from = 0, to = 120000, by = 15000), 
                     limits = c(0, 125000)) +
  meu_tema

### anotando coisas no grafico
figura <- ggplot(data = gapminder, mapping = aes(x = continent, y = gdpPercap, fill = continent)) +  
  geom_boxplot(show.legend = FALSE) +
  scale_fill_manual(values = heat.colors(5)) +
  scale_x_discrete("Continente", labels = c("África", "Américas", "Ásia", "Europa", "Oceania")) +
  scale_y_continuous("Produto Interno Bruto per capita (USD)", 
                     breaks  = seq(from = 0, to = 120000, by = 15000), 
                     limits = c(0, 125000)) +
  meu_tema +
  annotate(geom = "text", x = 5.2, y = 120000, label = "(a)", size = 8)
figura

## salvando o grafico

pdf("/Users/Nick/Desktop/exemplo.pdf")

figura

dev.off()

### via ggsave

ggsave(filename = "/Users/Nick/Desktop/via_ggsave.pdf", 
       plot = figura, width = 10, height = 8)

# EXERCICIO PARA ENTREGAR -------------------------------------------------

dados <- read_tsv("11_manipulacao_de_dados/dados/dados_limpos.xls")

dados %>% 
  group_by(turma) %>% 
  summarise(quantidade = n()) %>% 
  ggplot(mapping = aes(x = factor(turma), y = quantidade, fill = factor(turma))) +
  geom_bar(stat = "identity", show.legend = FALSE) +
  theme_bw() +
  meu_tema

dados %>% 
  summarise(quantidade = n()) %>%
  mutate(total = "total") %>% 
  ggplot(mapping = aes(x = total, y = quantidade)) +
  geom_bar(stat = "identity")

dados %>% 
  group_by(turma, usuario) %>% 
  summarise(quantidade = n()) %>% 
  ggplot(mapping = aes(x = factor(usuario), y = quantidade, fill = factor(turma))) +
  geom_bar(stat = "identity", position = "dodge")

dados %>% 
  summarise(media = mean(`Qts cursos feitos`),
            desvio = sd(`Qts cursos feitos`)) %>% 
  mutate(cursos = "cursos") %>% 
  ggplot(mapping = aes(x = cursos, y = media)) +
  geom_point() +
  geom_errorbar(mapping = aes(ymin = media - desvio, ymax = media + desvio), width = 0)

dados %>% 
  filter(programa != "Ouvinte") %>% 
  group_by(Cursando) %>% 
  summarise(media = mean(`Prazo defesa`), desvio = sd(`Prazo defesa`)) %>% 
  ggplot(mapping = aes(x = Cursando, y = media, colour = Cursando)) +
  geom_point(show.legend = FALSE) +
  geom_errorbar(mapping = aes(ymin = media - desvio, ymax = media + desvio), show.legend = FALSE) +
  theme_bw()
