############# Aula PLOT #################

### o básico do básico


### alguns objetos para nos guiar
sites <- c("area 1", "area 2","area 3", "area 4", "area 5", "area 6", "area 7","area 8", "area 9","area 10","area 11","area 12") 
area <- c(303, 379, 961, 879,332,278, 47, 122, 11, 53, 1500,1749)
riqueza<- c(3,10,20,70,8,12,4,8,3,5,17,23)
cobflorestal<- c(30,30,50,50,30,30,10,10,10,10,50,50)
tamanho<-c("M","M","G","G","M","M","P","P","P","P","G","G")

sexo <- rep(c("F","M"),each=3, times=10)
dieta<- rep(c("Herb.","Gran.","On?."),each=2,times=10)

length(area)

tbl=matrix(NA,length(sites),5)
colnames(tbl)=c("sites","area","riqueza","tamanho","cobflorestal")
tbl
tbl[,"sites"]=sites
tbl[,"area"]=area
tbl[,"riqueza"]=riqueza
tbl[,"tamanho"]=tamanho
tbl[,"cobflorestal"]=cobflorestal
tbl

#install.packages("datasets")
library(datasets)
#install.packages("UsingR")
library(UsingR)

###### primeiros plots
# plots

Z <- sort(rnorm(20))
Z
plot(Z)
plot(Z, type="p")
plot(Z, type="l")
plot(Z, type="b")
plot(Z, type="h")

head(pressure) #dados da relação de pressão de vapor e temperatura
plot(pressure) 

plot(pressure)
plot(pressure$temperature, pressure$pressure)
plot(pressure ~ temperature, data=pressure)

plot(riqueza~area)
plot(riqueza,area)
plot(y=riqueza,x=area)


#Cartesiana - plot(x,y)  é diferente de Formula - plot(y~x)
#Ambas as formas são corretas, mas como a grande maioria das análises feitas são no formato y~x, em vez de x,y, acaba ficando mais fácil usar y~x.


plot(riqueza~area)
plot(riqueza~area,pch=16)
plot(riqueza~area,pch="@")
plot(riqueza~area,pch=16, las=1)

    #pch chart --> slide

?par

plot(riqueza~area,pch=16, las=1, bty="n")
  plot(riqueza~area,pch=16, las=1, bty="u")
  plot(riqueza~area,pch=16, las=1, bty="o")
  plot(riqueza~area,pch=16, las=1, bty="l")

plot(riqueza~area,pch=16, las=1, bty="l", tcl=0.3)

#Cores
plot(riqueza~area,pch=16, las=1, bty="l", tcl=0.3, col="blue")
  plot(riqueza~area,pch=16, las=1, bty="l", tcl=0.3, col=c(1:9))
  plot(riqueza~area,pch=16, las=1, bty="l", tcl=0.3, col=rainbow(12))
  plot(riqueza~area,pch=16, las=1, bty="l", tcl=0.3, col=terrain.colors(12))
  plot(riqueza~area,pch=16, las=1, bty="l", tcl=0.3, col=heat.colors(12))
  plot(riqueza~area,pch=16, las=1, bty="l", tcl=0.3, col=cm.colors(12))
  
  par(bg="darkolivegreen")#background
  plot(riqueza~area,pch=16, las=1, bty="l", tcl=0.3, col=cm.colors(12))
  par(bg="white")
  
  #R color chart --> slide

#legenda
plot(riqueza~area,pch=16, las=1, bty="l", tcl=0.3, col="blue")
legend("top","riqueza",pch=16,col="blue")
  
plot(riqueza~area,pch=16, las=1, bty="l", tcl=0.3, col="blue")
legend(x=1500,y=10,"riqueza",lwd=1,col="blue",bty="n")
#locator()
  
  legend("topleft","riqueza",pch=16,col="blue")
  legend("topright","riqueza",pch=16,col="blue")
  legend("bottom","riqueza",pch=16,col="blue")
  legend("bottomright","riqueza",pch=16,col="blue")
  
  
  
#título
plot(riqueza~area,pch=16, las=1, bty="l", tcl=0.3, col="blue", main="A")
  legend("bottomright","riqueza",pch=16,col="blue")
plot(riqueza~area,pch=16, las=1, bty="l", tcl=0.3, col="blue", main="A",xlab="Área")
  legend("bottomright","riqueza",pch=16,col="blue")
plot(riqueza~area,pch=16, las=1, bty="l", tcl=0.3, col="blue", main="A",xlab="Área (ha)")
  legend("bottomright","riqueza",pch=16,col="blue")
plot(riqueza~area,pch=16, las=1, bty="l", tcl=0.3, col="blue", main="A",xlab="Área ha",ylab="Riqueza de espécies de \n roedores e marsupiais")
  legend("bottomright","riqueza",pch=16,col="blue")

  
### argumentos do PAR
#### alterando o mar
par(mar=c(5,5.2,2,1),tcl=0.3,las=1, bty="l") #vetor numérico (bottom,left,top,right)
plot(riqueza~area, pch=16, xlab="Área (ha)", ylab="Riqueza de espécies de \n roedores e marsupiais")
plot(Z)

par(mar=c(5,6,2,1),las=1,tcl=0.3,mgp=c(3,0.3,0)) #mgp: distância para os eixos (título, eixo y, eixo x), default é c(3,1,0)
plot(riqueza~area, xlab="Área (ha)", ylab="Riqueza de espécies de\n roedores e marsupiais", pch=16, bty="l",main="A")

#alterando a letra
par(mar=c(5,6,2,1),las=1,tcl=0.3,family="serif",mgp=c(3,0.3,0)) 
  plot(riqueza~area, xlab="Área (ha)", ylab="Riqueza de espécies de \n roedores e marsupiais", pch=16, bty="l",main="A")
  
  par(family="HersheySerif") 
  plot(riqueza~area, xlab="Área (ha)", ylab="Riqueza de espécies de \n roedores e marsupiais", pch=16, bty="l",main="A")
  par(family="HersheyGothicItalian") 
  plot(riqueza~area, xlab="Área (ha)", ylab="Riqueza de espécies de \n roedores e marsupiais", pch=16, bty="l",main="A")
   

#alterandoo cex
par(mar=c(5,6.7,2,1), cex.axis=1.5, cex.lab=2, family="")

  plot(riqueza~area, pch=16, las=1, bty="l", tcl=0.3, xlab="Área (ha)", ylab="Riqueza de espécies de \n roedores e marsupiais")

  plot(riqueza~area, pch=16, las=1, bty="l", tcl=0.3, xlab="Área (ha)", ylab="Riqueza de espécies de \n roedores e marsupiais",cex=2)

  plot(riqueza~area, pch=16, las=1, bty="l", tcl=0.3, xlab="Área (ha)", ylab="Riqueza de espécies de \n roedores e marsupiais",cex=cobflorestal/10)

#mudando os eixos
plot(riqueza~area, xlab="Área (ha)", ylab="Riqueza de espéciess de\n roedores e marsupiais", cex=2, pch=16, bty="l", xaxp=c(0,3000,4), ylim= c(0,50))
3000/4



#vamos voltar ao gráfico com melhor visualização e inserir outros dados
par(mar=c(5,6.7,2,2),cex.axis=0.9,cex.lab=1.2,cex.main=1.5,family="",las=1,tcl=0.3,mgp=c(3,0.3,0)) 
plot(riqueza~area, xlab="Área (ha)", ylab="Riqueza de espécies de \n roedores e marsupiais", cex=1.2, pch=16, bty="l",main="A")

w <-c(500,330,270,290,170,100,80,90,50,9,7,10)

plot(riqueza~area, xlab="Área (ha)", ylab="Riqueza de espécies de \n roedores e marsupiais", cex=1.2, pch=16, bty="u")
par(new=TRUE)
plot(w~area,  ann=F,axes=F, cex=1.2, pch=17,col="blue") 
axis(4)


#AXIS e JITTER
plot.default(CO2$uptake~CO2$Treatment)

plot.default(CO2$uptake~jitter(as.numeric(CO2$Treatment)),xaxt="n",xlim=c(0.5,2.5), xlab="",ylab="uptake",bty="l")
axis(1, at = 1:2, labels =c ("chilled", "nonchilled"),las=1, cex.axis=1.2)


#### 2 gráficos
local=rep(c("A","B"),each=2, times=3)



par(mfrow=c(2,1))
par(mar=c(3,5,2,2),cex.axis=1.2,cex.lab=1.2,cex.main=1.5,family="serif",las=1,tcl=0.3,mgp=c(2,0.3,0)) 
plot(riqueza~area, xlab="Área (ha)", ylab="Riqueza de espécies de\n roedores e marsupiais", cex=1.2, pch=16, bty="u")
par(new=TRUE)
plot(w~area,  ann=F,axes=F, cex=1,2, pch=17,col="blue") 
axis(4)

par(mar=c(2,5,1,2))
boxplot(riqueza~local)



######### opções
mtplot <- matrix(1:9, ncol=3, nrow=3, byrow=TRUE)
layout(mtplot)
layout.show(9)
mtplot <- matrix(1:9, ncol=3, nrow=3, byrow=TRUE)
boxplot(riqueza~local)
plot(riqueza~area, xlab="Área (ha)", ylab="Riqueza de espécies de\n roedores e marsupiais", cex=1.2, pch=16, bty="u")
plot.default(CO2$uptake~jitter(as.numeric(CO2$Treatment)),xaxt="n",xlim=c(0.5,2.5), xlab="",ylab="uptake",bty="l")
mtplot <- matrix(c(0,0,0,1,2,3,0,0,0), ncol=3, nrow=3, byrow=TRUE)
layout(mtplot, widths=c(0.2, 0.6, 0.2), heights=c(1,4,1))
layout.show(9)

######



x <- pmin(3, pmax(-3, stats::rnorm(50)))
y <- pmin(3, pmax(-3, stats::rnorm(50)))
xhist <- hist(x, breaks = seq(-3,3,0.5), plot = FALSE)
yhist <- hist(y, breaks = seq(-3,3,0.5), plot = FALSE)
top <- max(c(xhist$counts, yhist$counts))
xrange <- c(-3, 3)
yrange <- c(-3, 3)
nf <- layout(matrix(c(2,0,1,3),2,2,byrow = TRUE), c(3,1), c(1,3), TRUE)
layout.show(nf)

par(mar = c(3,3,1,1))
plot(x, y, xlim = xrange, ylim = yrange, xlab = "", ylab = "")
par(mar = c(0,3,1,1))
barplot(xhist$counts, axes = FALSE, ylim = c(0, top), space = 0)
par(mar = c(3,0,1,1))
barplot(yhist$counts, axes = FALSE, xlim = c(0, top), space = 0, horiz = TRUE)





#inserindo texto
par(mfrow=c(2,1))
par(mar=c(3,4.5,2,3),cex.axis=1.2,cex.lab=1.2,cex.main=1.5,family="serif",las=1,tcl=0.3,mgp=c(2,0.3,0)) 
plot(riqueza~area, xlab="Área (ha)", ylab="Riqueza de espécies de \n roedores e marsupiais", cex=1.2, pch=16, bty="u")
par(new=TRUE)
plot(z~area,  ann=F,axes=F, cex=1,2, pch=17,col="blue") 
axis(4,col="blue")
mtext("Riqueza insetos", side=4, cex=1.2, line=1.5, las=0,col="blue")

par(mar=c(3,5,2,2))
boxplot(riqueza~local,names= c("", ""))
mtext(c("RJ", "SP"),side= 1,cex=1.3,line=0.3,at=c(1,2))
mtext("Riqueza", side=2, cex=1.2, line=1.5, las=0)
mtext("Cidade", side=1, cex=1.2, line=1.5)

text(2,25, "@", cex=1.8)
#locator()

##### inserindo linhas de tendência
mriq=lm(riqueza~area)
mz=lm(z~area)

par(mfrow=c(2,1))
par(mar=c(3,4.5,2,3),cex.axis=1.2,cex.lab=1.2,cex.main=1.5,family="serif",las=1,tcl=0.3,mgp=c(2,0.3,0)) 
plot(riqueza~area, xlab="Área (ha)", ylab="Riqueza de espécies de\n roedores e marsupiais", cex=1.2, pch=16, bty="u")
abline(mriq)
par(new=TRUE)
plot(z~area,  ann=F,axes=F, cex=1,2, pch=17,col="blue") 
abline(mz,col="blue")
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


##### outras dicas
### uma figura, vários gráficos
w=c(50,47,44,31,50,48,30,29,25,20,15,11)

par(mfrow=c(1,1))
par(mar=c(3,4.5,2,3),cex.axis=1.2,cex.lab=1.2,cex.main=1.5,family="serif",las=1,tcl=0.3,mgp=c(2,0.3,0)) 
plot(riqueza~area, xlab="Área (ha)", ylab="", cex=1.2, pch=16, bty="u",ylim=c(-30,30),yaxt="n")
axis(2,at=c(0,10,20,30))
abline(h=0)

par(new=TRUE)
plot(w~area,  cex=1,2, pch=17,col="blue",ylim=c(5,100),ann=F,axes=F) 
axis(4,at=c(0,10,20,30,40,50))

mtext("Riqueza mamíferos", side=2, cex=1.2, line=1.5, las=0)
mtext("Riqueza insetos", side=4, cex=1.2, line=1.5, las=0,col="blue")



### inserindo barras de erros

riqueza<- c(3,10,20,7,4,8,3,5,25,29,12,3) 

sdriq=sd(riqueza)
upper=riqueza+sdriq
lower=riqueza-sdriq

par(mfrow=c(1,1))
par(mar=c(3,4.5,2,3),cex.axis=1.2,cex.lab=1.2,cex.main=1.5,family="serif",las=1,tcl=0.3,mgp=c(2,0.3,0)) 
plot(riqueza~area, xlab="Área (ha)", ylab="", cex=1.2, pch=16, bty="u",ylim=c(-30,30),yaxt="n")
arrows()
arrows(area,upper,area,lower,length=.05,angle=90,code=3)
axis(2,at=c(0,10,20,30))
par(new=TRUE)
plot(w~area,  cex=1,2, pch=17,col="blue",ylim=c(5,100),ann=F,axes=F)
axis(4,at=c(0,10,20,30,40,50))

mtext("Riqueza mamíferos", side=2, cex=1.2, line=1.5, las=0)
mtext("Riqueza insetos", side=4, cex=1.2, line=1.5, las=0,col="blue")


#### inserindo linhas
par(mfrow=c(1,1))
par(mar=c(3,4.5,2,3),cex.axis=1.2,cex.lab=1.2,cex.main=1.5,family="serif",las=1,tcl=0.3,mgp=c(2,0.3,0)) 
plot(riqueza~area, xlab="Área (ha)", ylab="", cex=1.2, pch=16, bty="u",ylim=c(-30,30),yaxt="n")
axis(2,at=c(0,10,20,30))
par(new=TRUE)
plot(z~area,  cex=1,2, pch=17,col="blue",ylim=c(5,100),ann=F,axes=F) 
axis(4,at=c(0,10,20,30,40,50))

mtext("Riqueza mamíferos", side=2, cex=1.2, line=1.5, las=0)
mtext("Riqueza insetos", side=4, cex=1.2, line=1.5, las=0,col="blue")

lines(x=c(0,3000),y=c(10,10), lty=1, lwd=1)
lines(c(0,3000),c(100, 100), lty=2 , lwd=2)
lines(c(0,3000),c(51,51), lty=3 , lwd=3)
lines(c(0,3000),c(20, 20), lty=4 , lwd=1)



### ++++ informaçõeses

ppt=c(134.3,64.5,68.3,66.6,0.6,72.1,51.2,138.0,121.4,126.1,255.9,217.0,123.1,65.1,59.5,21.6,191.7,28.1, 134.9,141.2)

mat_mar<-read.table("graf.final.txt", header=T)
class(mat_mar)

par(mfrow=c(1,1))
par(las=2,bty="u",tck=0.02,mar=c(5,3,4,4), mgp=c(2,1,0))
plot(ppt~as.vector(c(1:20)),ann=F,axes=F, col="white", ylim=c(-1,300), xlab="",ylab="",main= "")
polygon(x=c(1:20,20:1),y=c(ppt,rep(-10,20)),col="gray90",border="gray90")
axis(4, at=c(0,50,100,150,200,250,300), lwd=1, las=1,cex=0.8)
par(new=T)
barplot(as.matrix(mat_mar),ylab="indivíduos", args.legend=list(x="topright",bty="n"), xlab="", main= list("M. incanus",font=3), col=c("gray20","gray60", "gray80"),density=c(195,190,80),angle=c(180,90,45), axes=TRUE,axis.lty=1, ylim=c(0,16),cex.names=0.8,legend.text=c("jovens", "subadulto", "adulto"))
mtext("chuva (mm)",side=4, las=3, line=3)

###

plot(1:10,ann=F,axes=F,col="white")
rect(xleft=1, ybottom=2, xright=10, ytop=10, col="darkgreen")
polygon(x=c(2,5.5,9,9,5.5,2),y=c(6,2.5,6,6,9.5,6),col="yellow")
points(5.5,6,cex=10,pch=16,col="blue")



#### salvando os gráficos
?jpeg
jpeg("reprod_incanus.jpg", width = 22, height = 16, units = "cm", quality =2000, res= 500)
par(mfrow=c(1,1))
par(las=2,bty="u",tck=0.02,mar=c(5,3,4,4), mgp=c(2,1,0))
plot(ppt~as.vector(c(1:20)),ann=F,axes=F, col="white", ylim=c(-1,300), xlab="",ylab="",main= "")
polygon(x=c(1:20,20:1),y=c(ppt,rep(-10,20)),col="gray90",border="gray90")
axis(4, at=c(0,50,100,150,200,250,300), lwd=1, las=1,cex=0.8)
par(new=T)
barplot(as.matrix(mat_mar),ylab="indivíduos", args.legend=list(x="topright",bty="n"), xlab="", main= list("M. incanus",font=3), col=c("gray20","gray60", "gray80"),density=c(195,190,80),angle=c(180,90,45), axes=TRUE,axis.lty=1, ylim=c(0,16),cex.names=0.8,legend.text=c("jovens", "subadulto", "adulto"))
mtext("chuva (mm)",side=4, las=3, line=3)
dev.off()


###############################

# explorando objetos
barplot(riqueza)
barplot(sort(riqueza,decreasing=T))

table(sexo,dieta)
barplot(table(sexo,dieta), main="sexo X dieta")
barplot(table(sexo,dieta), main="sexo X dieta",horiz=TRUE)
barplot(table(sexo,dieta), main="sexo X dieta",horiz=TRUE,angle = c(45, 135), density = 20)

library(datasets)
head(OrchardSprays) #dados de material de pulverização de pomares para repelir abelhas,  rowpos:	 numeric	 Row of the design,colpos	 numeric:	 Column of the design (tratamento 8x8), decrease:	 numeric	 Response, treatment: A--> nível mais alto de adubo de cal--> H menor nível

hist(OrchardSprays$decrease)
boxplot(OrchardSprays$decrease, col="gray",ylim=c(0,70))
boxplot(OrchardSprays$decrease~OrchardSprays$treatment)

boxplot(decrease ~ treatment, data = OrchardSprays, log = "y", col="light grey")
boxplot(decrease ~ treatment, data = OrchardSprays, log = "y", col="light grey", boxwex=0.5)#muda a largura do box
boxplot(decrease ~ treatment, data = OrchardSprays, log = "y", col="light grey", boxwex=0.5,border="blue")


plot.default(OrchardSprays$decrease~OrchardSprays$treatment)



### histogramas
hist(CO2$uptake,prob=T,col="gray")
hist(CO2$uptake,prob=T,col="gray",border="black")
hist(CO2$uptake,prob=T,col="gray",border="black",density=30)
hist(CO2$uptake,prob=T,col="gray",border="black",density=30,angle=150)
hist(CO2$uptake,prob=T,col="gray",border="black",density=30,angle=150,breaks=20)


#reescalonado, de forma que as barras somem 1
hist(CO2$uptake,prob=T,col="gray")
lines(density(CO2$uptake),col="blue",lwd=2 )


head(brightness)
hist(brightness,col="gray")
rug(jitter(brightness))
hist(brightness,prob=T) #reescalonado, de forma que as barras somem 1
lines(density(brightness),col="blue" )


plot(density(brightness),col="blue")
curve(expr = dnorm(x,mean=mean(brightness),sd=sd(brightness)),add=T, col="red")

### explorando informações gráficas de modelos

lm.SR <- lm(sr ~ pop15 + pop75 + dpi + ddpi,data = LifeCycleSavings)
plot(lm.SR)  #produz 4 gráficos: "Residuals vs Fitted", "Normal Q-Q plot", "Scale-Location Plot", "Cook's distance plot"


#um teste de normalidade
qqnorm(brightness)
qqline(brightness)

Z <- rnorm(40,10)
qqnorm(Z)
qqline(Z)

W<-rpois(40,10)
qqnorm(W)
qqline(W)


K<-rexp(40)
qqnorm(K)
qqline(K)


#######################
### mostrar função que otimiza criação do gráfico


