setwd("C:/Users/Camila/Dropbox/back up")


############# Aula PLOT #################

### o básico do básico


### alguns objetos para nos guiar
sites <- c(paste("area",1:12))
area <- c(303, 379, 961, 879,332,278, 47, 122, 11, 53, 1500,1749)
riqueza<- c(3,10,20,70,8,12,4,8,3,5,17,23)
cobflorestal<- c(30,30,50,50,30,30,10,10,10,10,50,50)
tamanho<-c("M","M","G","G","M","M","P","P","P","P","G","G")

dt1 <- data.frame(sites,area,tamanho,riqueza,cobflorestal)
dt1


sexo <- rep(c("F","M"),each=3, times=10)
dieta<- rep(c("proteína","grãos","frutas"),each=4,times=5)
especie <- rep(c("Akodon A","Akodon B"), each=5)
peso <- rnorm(c(15:50), mean=mean(c(15:50)),sd=sd(c(15:50)))

dt2 <- data.frame(sexo,dieta,especie)
dt2



###### primeiros plots
# plots

Z <- sort(rnorm(20))
Z
plot(Z)
plot(Z, type="p")
  plot(Z, type="l")
  plot(Z, type="b")
  plot(Z, type="h")

  
  plot(riqueza~area)
  plot(riqueza,area)
  plot(y=riqueza,x=area)
  
  #Cartesiana - plot(x,y)  é diferente de Formula - plot(y~x)
  #Ambas as formas são corretas, mas como a grande maioria das análises feitas são no formato y~x, em vez de x,y, acaba ficando mais fácil usar y~x
  
head(pressure) #dados da relação de pressão de vapor e temperatura
plot(pressure) 

plot(dt1)


?plot
?par

#### pch

plot(riqueza~area)
  plot(riqueza~area,pch=16)
  plot(riqueza~area,pch=6)
  plot(riqueza~area,pch="@")
  plot(riqueza~area,pch=c(LETTERS[1:12]))
  #pch chart --> slide

### las --> label style,  posição da legenda do eixo em relação ao eixo
plot(riqueza~area,pch=16)
plot(riqueza~area,pch=16, las=1)
plot(riqueza~area,pch=16, las=2)
plot(riqueza~area,pch=16, las=3)


###bty --> border type
plot(riqueza~area,pch=16, las=1, bty="n")
  plot(riqueza~area,pch=16, las=1, bty="u")
  plot(riqueza~area,pch=16, las=1, bty="o")
  plot(riqueza~area,pch=16, las=1, bty="l")

### tcl -->
plot(riqueza~area,pch=16, las=1, bty="l", tcl=0.3)
plot(riqueza~area,pch=16, las=1, bty="l", tcl=-0.3)


#col --> Cores
plot(riqueza~area,pch=16, las=1, bty="l", tcl=0.3, col="blue")
  plot(riqueza~area,pch=16, las=1, bty="l", tcl=0.3, col=c(1:9))
  plot(riqueza~area,pch=16, las=1, bty="l", tcl=0.3, col=rainbow(12))
  plot(riqueza~area,pch=16, las=1, bty="l", tcl=0.3, col=terrain.colors(12))
  plot(riqueza~area,pch=16, las=1, bty="l", tcl=0.3, col=heat.colors(12))
  plot(riqueza~area,pch=16, las=1, bty="l", tcl=0.3, col=cm.colors(12))
  
    #R color chart --> slide

#alterando os eixos
  plot(riqueza~area, pch=16,las=1, bty="l", tcl=0.3, xaxp=c(0,3000,4), ylim= c(0,50))
  3000/4  
  plot(riqueza~area, pch=16,las=1, bty="l", tcl=0.3, axes=F)
  plot(riqueza~area, pch=16,las=1, bty="l", tcl=0.3, axes=F,ann=F)
  

  
#título dos eixos
plot(riqueza~area,pch=16, las=1, bty="l", tcl=0.3, main="A")
  plot(riqueza~area,pch=16, las=1, bty="l", tcl=0.3, main="A",xlab="Área")
  plot(riqueza~area,pch=16, las=1, bty="l", tcl=0.3, main="A",xlab="Área (ha)")
  plot(riqueza~area,pch=16, las=1, bty="l", tcl=0.3, main="A",xlab="Área ha",ylab="Riqueza de espécies")
  
?legend
  
#legenda
  plot(riqueza~area,pch=16, las=1, bty="l", tcl=0.3, col="blue")
  legend("top",legend="riqueza",pch=16,col="blue")
  
  plot(riqueza~area,pch=16, las=1, bty="l", tcl=0.3, col="blue")
  legend(x=1500,y=10,legend="riqueza",lwd=1,col="blue",bty="n")
  #locator()
  
  legend("topleft","riqueza",pch=16,col="blue")
  legend("topright","riqueza",pch=16,col="blue")
  legend("bottom","riqueza",pch=16,col="blue")
  legend("bottomright","riqueza",pch=16,col="blue")
  
### argumentos do PAR

#
  plot(riqueza~area,pch=16, las=1, bty="l", tcl=0.3, col="blue")
  
  par(las=1, bty="l", tcl=0.3)
  plot(riqueza~area,pch=16, col="blue")
  plot(pressure)
  
##background
par(bg="darkolivegreen")
plot(riqueza~area,pch=16, col=cm.colors(12))
par(bg="white")
  
#### mar --> margens
par(las=1, bty="l", tcl=0.3,mar=c(5,5.2,2,1)) #vetor numérico (bottom,left,top,right)
plot(riqueza~area, pch=16, xlab="Área (ha)", ylab="Riqueza de espécies de \n roedores e marsupiais")

#mgp --> distância para os eixos (título, eixo y, eixo x), default é c(3,1,0)
par(las=1, bty="l", tcl=0.3, mar=c(5,6,2,1),mgp=c(3,0.3,0)) 
plot(riqueza~area, pch=16, xlab="Área (ha)", ylab="Riqueza de espécies de \n roedores e marsupiais", main="A")

#family --> altera a fonte 
par(las=1, bty="l", tcl=0.3, mar=c(5,6,2,1),mgp=c(3,0.3,0), family="serif") plot(riqueza~area, xlab="Área (ha)", ylab="Riqueza de espécies de\nroedores e marsupiais", pch=16, main="A")
  
  par(family="HersheySerif") 
  plot(riqueza~area, xlab="Área (ha)", ylab="Riqueza de espécies de \n roedores e marsupiais", pch=16,main="A")
  par(family="HersheyGothicItalian") 
  plot(riqueza~area, xlab="Área (ha)", ylab="Riqueza de espécies de \n roedores e marsupiais", pch=16, main="A")
   

# cex --> reescalonando a relação de tamanho dos eixos e pontos
par(las=1, bty="l", tcl=0.3, mar=c(5,6,2,1),mgp=c(3,0.3,0), mar=c(5,6.7,2,1), family="", cex.axis=1.5, cex.lab=2)

  plot(riqueza~area, pch=16, xlab="Área (ha)", ylab="Riqueza de espécies de\nroedores e marsupiais")

  plot(riqueza~area, pch=16, xlab="Área (ha)", ylab="Riqueza de espécies de\nroedores e marsupiais",cex=2)

  plot(riqueza~area, pch=16, xlab="Área (ha)", ylab="Riqueza de espécies de\nroedores e marsupiais",cex=cobflorestal/10)



#vamos voltar ao gráfico com melhor visualização e inserir outros dados
par(  las=1, bty="l", tcl=0.3, mar=c(5,5,2,2),mgp=c(3,0.8,0), family="", cex.axis=0.9, cex.lab=1,cex.main=1.5)

plot(riqueza~area, xlab="Área (ha)", ylab="Riqueza de espécies de\nroedores e marsupiais", cex=1.2, pch=16, main="A")


#### acrescentando dados

w <-c(500,330,270,290,170,100,80,90,50,9,7,10)

plot(riqueza~area, xlab="Área (ha)", ylab="Riqueza de espécies de\n roedores e marsupiais", cex=1.2, pch=16, bty="u", main="A")
par(new=TRUE)
plot(w~area,  ann=F,axes=F, cex=1.2, pch=17,col="blue") 
axis(4)



#### 2 gráficos
local=rep(c("A","B"),each=2, times=3)
local

par(mfrow=c(2,1))
par(mar=c(3,5,2,2),cex.axis=1.2,cex.lab=1.2,cex.main=1.5,family="serif",las=1,tcl=0.3,mgp=c(2,0.3,0)) 
plot(riqueza~area, xlab="Área (ha)", ylab="Riqueza de espécies de\n roedores e marsupiais", cex=1.2, pch=16, bty="u")
par(new=TRUE)
plot(w~area,  ann=F,axes=F, cex=1,2, pch=17,col="blue") 
axis(4)

par(mar=c(2,5,1,2))
boxplot(riqueza~local)



#inserindo texto
par(mfrow=c(2,1))
par(mar=c(3,4.5,2,3),cex.axis=1,cex.lab=1,cex.main=1.5,family="serif",las=1,tcl=0.3,mgp=c(2,0.3,0)) 
plot(riqueza~area, xlab="Área (ha)", ylab="Riqueza de espécies de\n roedores e marsupiais", cex=1.2, pch=16, bty="u")
par(new=TRUE)
plot(w~area,  ann=F,axes=F, cex=1, pch=17,col="blue") 
axis(4)
mtext("Riqueza insetos", side=4, cex=1, line=1.5, las=0,col="blue")

par(mar=c(3,5,2,2))
boxplot(riqueza~local,names= c("", ""))
mtext(c("RJ", "SP"),side= 1,cex=1.3,line=0.3,at=c(1,2))
mtext("Riqueza", side=2, cex=1.2, line=1.5, las=0)
mtext("Cidade", side=1, cex=1.2, line=1.5)

text(2,25, "@", cex=1.8)
#locator()

############################

#AXIS e JITTER
par(mfrow=c(1,1))
plot.default(CO2$uptake~CO2$Treatment)

plot.default(CO2$uptake~jitter(as.numeric(CO2$Treatment)),xaxt="n",xlim=c(0.5,2.5), xlab="",ylab="uptake",bty="l")
axis(1, at = 1:2, labels =c ("chilled", "nonchilled"),las=1, cex.axis=1.2)



##### inserindo linhas de tendência
mriq=lm(riqueza~area)
mw=lm(w~area)

par(mfrow=c(2,1))
par(mar=c(3,4.5,2,3),cex.axis=1.2,cex.lab=1.2,cex.main=1.5,family="serif",las=1,tcl=0.3,mgp=c(2,0.3,0)) 
plot(riqueza~area, xlab="Área (ha)", ylab="Riqueza de espécies de\n roedores e marsupiais", cex=1.2, pch=16, bty="u")
abline(mriq)
par(new=TRUE)
plot(w~area,  ann=F,axes=F, cex=1,2, pch=17,col="blue") 
abline(mw,col="blue")
axis(4)
mtext("Riqueza insetos", side=4, cex=1.2, line=1.5, las=0,col="blue")

par(mar=c(3,5,2,2))
boxplot(riqueza~local,names= c("", ""),col="gray")
mtext(c("RJ", "SP"),side= 1,cex=1.3,line=0.3,at=c(1,2))
mtext("Riqueza", side=2, cex=1.2, line=1.5, las=0)
mtext("Cidade", side=1, cex=1.2, line=1.5)


#Outras linhas:
par(mfrow=c(1,1))
par(mar=c(3,4.5,2,3),cex.axis=1.2,cex.lab=1.2,cex.main=1.5,family="serif",las=1,tcl=0.3,mgp=c(2,0.3,0)) 
plot(riqueza~area, xlab="Área (ha)", ylab="Riqueza de espécies de\n roedores e marsupiais", cex=1.2, pch=16, bty="u")
abline(v=mean(area))
abline(h=mean(riqueza))

#Exercício 
# No conjunto de dados "trees" temos a medidad e circunferência (girth), altura (height) e volume das árvores. Plote em um gráfico a relação de volume (em azul) e diâmetro (em vermelho) com altura. Insira título, legenda e linha de tendência de modelo linear.  
head(trees)



##### Exercício 2
## Observe o gráfico que seá produzido e em seguida reproduza este gráfico




##### outras dicas
### uma figura, vários gráficos
k=c(5,37,44,31,45,25,30,29,25,20,15,11)

par(mfrow=c(1,1))
par(mar=c(3,4.5,2,3),cex.axis=1.2,cex.lab=1.2,cex.main=1.5,family="serif",las=1,tcl=0.3,mgp=c(2,0.3,0)) 
plot(riqueza~area, xlab="Área (ha)", ylab="", cex=1.2, pch=16, bty="u",ylim=c(-50,50),yaxt="n")
axis(2,at=c(0,10,20,30,40,50))
abline(h=0)

par(new=TRUE)
plot(k~area,  cex=1,2, pch=17,col="blue",ylim=c(0,100),ann=F,axes=F) 
axis(4,at=c(0,10,20,30,40,50))

mtext("Riqueza mamíferos", side=2, cex=1.2, line=1.5, las=0)
mtext("Riqueza insetos", side=4, cex=1.2, line=1.5, las=0,col="blue")



### inserindo barras de erros

sdriq=sd(riqueza)
upper=riqueza+sdriq
lower=riqueza-sdriq

par(mfrow=c(1,1))
par(mar=c(3,4.5,2,3),cex.axis=1.2,cex.lab=1.2,cex.main=1.5,family="serif",las=1,tcl=0.3,mgp=c(2,0.3,0)) 
plot(riqueza~area, xlab="Área (ha)", ylab="", cex=1.2, pch=16, bty="u",ylim=c(0,40))
arrows()
arrows(area,upper,area,lower,length=.05,angle=90,code=3)


mtext("Riqueza mamíferos", side=2, cex=1.2, line=1.5, las=0)



#### inserindo linhas

lines(x=c(0,3000),y=c(10,10), lty=1, lwd=1)
lines(c(0,3000),c(40, 40), lty=2 , lwd=2)
lines(c(0,3000),c(31,21), lty=3 , lwd=3)
lines(c(0,3000),c(20, 20), lty=4 , lwd=1)

###
###

plot(1:10,ann=F,axes=F,type="n")
rect(xleft=1, ybottom=2, xright=10, ytop=10, col="darkgreen")
polygon(x=c(2,5.5,9,9,5.5,2),y=c(6,2.5,6,6,9.5,6),col="yellow")
points(5.5,6,cex=10,pch=16,col="blue")



#### salvando os gráficos
?jpeg
#jpeg("Brasil.jpg", width = 22, height = 16, units = "cm", quality =2000, res= 500)
par(mfrow=c(1,1))
par(las=2,bty="u",tck=0.02,mar=c(5,3,4,4), mgp=c(2,1,0))
plot(1:10,ann=F,axes=F,col="white")
rect(xleft=1, ybottom=2, xright=10, ytop=10, col="darkgreen")
polygon(x=c(2,5.5,9,9,5.5,2),y=c(6,2.5,6,6,9.5,6),col="yellow")
points(5.5,6,cex=10,pch=16,col="blue")
dev.off()

#Exercício: salve este gráfico no melhor formato possível

###############################
?ChickWeight  
head(ChickWeight)

###### Análise exploratória #######
max(ChickWeight$weight)
min(ChickWeight$weight)
range(ChickWeight$weight)

max(ChickWeight$Time)
min(ChickWeight$Time)
range(ChickWeight$Time)


#Variância
sum((ChickWeight$weight-mean(ChickWeight$weight)^2)/(length(ChickWeight$weight)-1))
var(ChickWeight$weight)

sqrt(var(ChickWeight$Time))
sd(ChickWeight$Time)

summary (ChickWeight$Time)



#############

boxplot(ChickWeight$weight, col="gray", xlab="Soil pH", main=" ")

boxplot(list(ChickWeight$weight,ChickWeight$Time), col="gray",  main=" " )


# Exercício
head(Orange,10)
# Mostre graficamente a variação dos dados de idade e circunferência para o indivíduo 1




######
library(datasets)
head(OrchardSprays) #dados de material de pulverização de pomares para repelir abelhas,  rowpos:	 numeric	 Row of the design,colpos	 numeric:	 Column of the design (tratamento 8x8), decrease:	 numeric	 Response, treatment: A--> nível mais alto de adubo de cal--> H menor nível


boxplot(OrchardSprays$decrease, col="gray",ylim=c(0,70))
boxplot(OrchardSprays$decrease~OrchardSprays$treatment)

boxplot(decrease ~ treatment, data = OrchardSprays, log = "y", col="light grey")
boxplot(decrease ~ treatment, data = OrchardSprays, log = "y", col="light grey", boxwex=0.5)#muda a largura do box
boxplot(decrease ~ treatment, data = OrchardSprays, log = "y", col="light grey", boxwex=0.5,border="blue")


#Exercício
# Mostre graficamente a variação dos dados de circunferência todos os indivíduos de laranjas, sendo cada box de uma cor, todos com borda cinza escuro.




###### barplot
?barplot

barplot(VADeaths,legend.text = T)
barplot(t(VADeaths),legend.text = T)
barplot(t(VADeaths),legend.text = T, col=terrain.colors(4))


barplot(VADeaths, legend.text = T, col=terrain.colors(5), horiz=TRUE)
barplot(VADeaths, legend.text = T,horiz=TRUE,angle = c(45, 135), density = 20)
barplot(VADeaths, legend.text = T,horiz=TRUE,angle = c(45, 135), density = 20,col=terrain.colors(5))


barplot(riqueza,names.arg = sites,las=3)
barplot(sort(riqueza,decreasing=T))
dt1
dtplot <- dt1[order(dt1$riqueza,decreasing=T),]
barplot(dtplot$riqueza,names.arg = dtplot$sites,las=3)


#### exercício
# As variáveis dieta e sexo descrevem o resultado de um experimento de preferência alimentar. Foram oferecidos proteínas, grãos e frutas para diferentes indivíduos e foi registrado a prefência alimentar de cada indivíduo e seu respectivo sexo. Plote um gráfico de barras resumindo o resultado encontrado. Coloque cores adequadas a cada variável.




#####
# histogramas

### histogramas
hist(CO2$uptake,col="gray")
hist(CO2$uptake,prob=T,col="gray")
hist(CO2$uptake,prob=T,col="gray",border="black")
hist(CO2$uptake,prob=T,col="gray",border="black",density=30)
hist(CO2$uptake,prob=T,col="gray",border="black",density=30,angle=150)
hist(CO2$uptake,prob=T,col="gray",border="black",density=30,angle=150,breaks=20)



#reescalonado, de forma que as barras somem 1
hist(CO2$uptake,prob=T,col="gray")
lines(density(CO2$uptake),col="blue",lwd=2 )


head(Nile) #Measurements of the annual flow of the river Nile at Aswan (formerly Assuan), 1871-1970, in 10^8 m^3, "with apparent changepoint near 1898"
hist(Nile,col="gray")
rug(jitter(Nile))
hist(Nile,prob=T) #reescalonado, de forma que as barras somem 1
lines(density(Nile),col="blue" )
curve(expr = dnorm(x,mean=mean(Nile),sd=sd(Nile)),add=T, col="red")

#um teste de normalidade
qqnorm(Nile)
qqline(Nile)

plot(density(Nile),col="blue")
curve(expr = dnorm(x,mean=mean(Nile),sd=sd(Nile)),add=T, col="red")

plot(density(riqueza),col="blue")
curve(expr = dnorm(x,mean=mean(riqueza),sd=sd(riqueza)),add=T, col="red")


#Exercício
#Crie uma variável que varie de -4 a 4, com um total de 100 valores. Crie uma distribuição normal, a partir desses valores, com média zero e desvios padrões de 1, 2 e 3 respectivamente. Plote todas as curvas num mesmo gráfico. 


##### diferentes distribuições de probabilidade

par(mfrow=c(2,2))
hist(rnorm(1000,5,2), col= "gray", main="Normal", breaks=15)
hist(rnorm(1000,0,0.5), col= "gray", main="lognormal", breaks=15)
hist(rpois(1000,2), col= "gray", main="Poisson", breaks=15)
hist(c(rnorm(500,0,2),rnorm(500,8,2)), col= "gray", main="Bimodal", breaks=15)




Z <- rnorm(40,10)
qqnorm(Z)
qqline(Z)

W<-rpois(40,10)
qqnorm(W)
qqline(W)


K<-rexp(40)
qqnorm(K)
qqline(K)

par(mfrow=c(1,1))

# Exercício
#verifique visualmente se a distribuição de concentração de CO2 do pacote de dados CO2 apresenta uma distribuição normal


# explorando objetos


### explorando informações gráficas de modelos

lm.SR <- lm(sr ~ pop15 + pop75 + dpi + ddpi,data = LifeCycleSavings)
par(mfrow=c(2,2))
plot(lm.SR)  #produz 4 gráficos: "Residuals vs Fitted", "Normal Q-Q plot", "Scale-Location Plot", "Cook´s distance plot"


### veja mais no blog : http://melinaleiteblog.netlify.com/





