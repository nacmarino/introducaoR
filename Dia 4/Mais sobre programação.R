# argumentos
set.seed(1)
vetor <- rnorm(15, 0, 1)
n <- length(vetor)

# algoritmo

soma <- sum(vetor)
(media <- soma/n)

# escrever funcao

nossa.media <- function(x) {
  soma <- sum(x)
  n <- length(x)
  media <- soma/n
  media
}
vetor <- 1:1000
(resu <- nossa.media(x = vetor))
mean(vetor)


(x - X)/desvio padrao

zmaker <- function(x, xiszao, desv) {
  (x - xiszao)/desv
}

2^2

vetor <- seq(1, 20)

xiszao <- 12.5
desv <- 2


x <- 2
y <- 4
x^y

potencia <- function(a, b) {
  pot <- a^b
  pot
}

potencia(a = 3, b = 3)

zmaker(x = vetor, xiszao = xiszao, desv = desv)
