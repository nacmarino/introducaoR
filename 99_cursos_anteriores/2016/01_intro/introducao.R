####### Iniciando os trabalhos #########
getwd()
setwd("C:/Users/Camila/Dropbox/back up") #indica o diretório de trabalho
getwd() #verifica o diretório de trabalho

####Salvando o trabalho
save.image()
save.image(file="minha primeira aula.RData")


###ajuda
help (mean)
?mean
args(lm)

mean
help

### erros e avisos
logaritmo(2)
log(2))
log(2,basse=10)
log(2,base=10)
log(-2)


########### operadores #########
area <- c(303, 379, 961, 332, 47, 122, 11, 53, 2749)
area

area = c(303, 379, 961, 332, 47, 122, 11, 53, 2749)
area

c(303, 379, 961, 332, 47, 122, 11, 53, 2749) -> area
area


riqueza<- c(3,10,20,7,4,8,3,5,23)
riqueza

sites <- c("area 1", "area 2","area 3", "area 4", "area 5", "area 6", "area 7","area 8", "area 9") 
sites


sexo <- rep(c("F","M"),each=3, times=2)
sexo



b = 1:8
b
b=2.5:10
b
b=seq(from=1, to=4)
b
b=seq(from=1, to=4, by=0.5)
b
b=seq(from=1, to=4, length=6)
b

###para estudar os objetos
class(area)
class(riqueza)

class (sites)
sites<- as.factor(sites)
class(sites)

class(sexo)



#para alterar a classe do objeto
sites<- as.factor(sites)
class(sites)
sites

sexo<- as.factor(sexo)
sexo


fert=c(10,20,20,50,10,20,10,50,20) 
fert=as.factor(fert) #"as.factor" é uma forma abreviada de "factor"
fert
fert=c(10,20,20,50,10,20,10,50,20) 
fert=factor(fert,ordered=TRUE) #Fatores ordenados em algumas funções de modelagem 
fert

#para estudar os obejtos  ###    resumo do objeto
summary (area)
summary(riqueza)
summary(sites)


table(sites)
table(sexo)

dieta=rep(c("H","G","O"),each=2,times=2)
dieta

table(sexo,dieta)

length(sexo)
mean(riqueza) 
range(riqueza)

median(riqueza)
var(riqueza)
min(riqueza)
max(riqueza)
sum(riqueza)


riqueza
sort(riqueza)
sort(riqueza, decreasing=T)



###descobrindo os ojetos já salvos
ls()
rm(sexo)
ls()
#rm(list=ls())
ls()

#### R como calculadora

4 + 2
4 - 2
4 * 2
4 / 2
4^2


2*4^3 - 1  
2*4^(3 - 1) 
(2*4)^3 - 1 
(2*4)^(3 - 1) 



sqrt(9) # Raiz Quadrada

abs( - 1 ) # Módulo ou valor absoluto

log( 2 ) # Logaritmo natural

log( 2, base = 10) # Log base 10

log10(2) # Também log de base 10

log( 2, base = 3.4076) # base 3.4076

exp( 1 ) # Exponencial


#arredondamento

ceiling( 3.4076 )

floor( 3.4076 )

round( 3.4076 )

round( 3.4076 , digits=3)

round( 3.4076 , digits=2)


round(log(2),digits=2)

#e mais

area
riqueza
area*riqueza

##Ciclagem
b=c(1:9)
c=c(1,2,3)
b
c
b*c

#valores infinitos, indefinidos e inexistentes

-2/0

2000000000000/Inf

sqrt( - 1 )

2 * NA

2 * NaN

#funções para o vetor
a<-c(1.0000000, 10.0000000,  3.4000000,  3.1415927,  0.7853982,  0.3678794,  0.8020016)
a
cumsum(a)
diff(a)


#### importando arquivos
dados <- read.table("Pasta1.csv", header=T, sep=";")
dados

# indexação
dados[1,]
dados[,1]
dados$site

##### Exercícios

 