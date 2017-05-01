
#vamos retomar alguns objetos da outra aula
########### operadores #########
area <- c(303, 379, 961, 332, 47, 122, 11, 53, 2749)
riqueza<- c(3,10,20,7,4,8,3,5,23)
tamanho<-c("M","M","G","M","P","P","P","P","G")
sites <- c("area 1", "area 2","area 3", "area 4", "area 5", "area 6", "area 7","area 8", "area 9") 
sexo <- rep(c("F","M"),each=3, times=2)
dieta<- rep(c("H","G","O"),each=2,times=2)



# plots

Z <- rnorm(20)
plot(Z, type="p")
plot(Z, type="l")
plot(Z, type="b")
plot(Z, type="h")



### os plots!!!!
plot(riqueza~area)
plot(riqueza,area)
  #Cartesiana - plot(x,y)  é diferente de Formula - plot(y~x)
  #Ambas as formas são corretas, mas como a grande maioria das análises feitas são no formato y~x, em vez de x,y, acaba ficando mais fácil usar y~x.





plot(riqueza~area)
plot(riqueza~area,pch=16)
plot(riqueza~area,pch=16, las=1)
plot(riqueza~area,pch=16, las=1, bty="l")
plot(riqueza~area,pch=16, las=1, bty="l", tcl=0.3)
plot(riqueza~area,pch=16, las=1, bty="l", tcl=0.3, col="blue")
plot(riqueza~area,pch=16, las=1, bty="l", tcl=0.3, col="blue", main="A")
plot(riqueza~area,pch=16, las=1, bty="l", tcl=0.3, col="blue", main="A",xlab="Área")

legend("top","riqueza",pch=16,col="blue")

plot(riqueza~area,pch=16, las=1, bty="l", tcl=0.3, col="blue", main="A",xlab="Área ha")
legend("bottomright","riqueza",pch=16,col="blue")



plot(riqueza~area,pch=16, las=1, bty="l", tcl=0.3, col=rainbow(10), main="A",xlab="Área ha")


plot(riqueza~area,pch=16, las=1, bty="l", tcl=0.3, col="blue", main="A",xlab="Área (ha)")
legend("bottomright","riqueza",pch=16,col="blue")


plot(riqueza~area,pch=16, las=1, bty="l", tcl=0.3, col="blue", main="A",xlab="Área ha",ylab="Riqueza de espécies de\nroedores e marsupiais")
legend("bottomright","riqueza",pch=16,col="blue")

#### alterando o mar
par(mar=c(5,6.7,2,1)) #vetor numérico (bottom,left,top,right)
plot(riqueza~area, pch=16, las=1, bty="l", tcl=0.3, xlab="Área (ha)", ylab="Riqueza de espécies de\nroedores e marsupiais")

par(mar=c(5,6.7,2,1), cex.axis=1.5, cex.lab=2, family="serif")
plot(riqueza~area, pch=16, las=1, bty="l", tcl=0.3, xlab="Área (ha)", ylab="Riqueza de espécies de\nroedores e marsupiais",cex=2)
     

par(mar=c(5,6.7,2,1),cex.axis=1.5,cex.lab=2,family="serif",las=1,tcl=0.3,mgp=c(3,0.3,0)) #mgp: distância para os eixos (título, eixo y, eixo x), default é c(3,1,0)
plot(riqueza~area, xlab="Área (ha)", ylab="Riqueza de espécies de\nroedores e marsupiais", cex=2, pch=16, bty="l",main="A")

#mudando os eixos
par(mar=c(5,6.7,2,1),cex.axis=1.5,cex.lab=2,family="serif",las=1,tcl=0.3,mgp=c(3,0.3,0)) 
plot(riqueza~area, xlab="Área (ha)", ylab="Riqueza de espécies de\nroedores e marsupiais", cex=2, pch=16, bty="l", xaxp=c(0,3000,4), ylim= c(10,50))



#vamos voltar ao gráfico com melhor visualização e inserir outros dados

par(mar=c(5,6.7,2,1),cex.axis=1.2,cex.lab=1.2,cex.main=1.5,family="serif",las=1,tcl=0.3,mgp=c(3,0.3,0)) 
plot(riqueza~area, xlab="Área (ha)", ylab="Riqueza de espécies de\nroedores e marsupiais", cex=2, pch=16, bty="l",main="A")


z <-c(50,42,33,29,17,15,10,8,9)
par(mar=c(5,6,2,2),cex.axis=1.2,cex.lab=1.2,cex.main=1.5,family="serif",las=1,tcl=0.3,mgp=c(3,0.3,0)) 
plot(riqueza~area, xlab="Área (ha)", ylab="Riqueza de espécies de\n roedores e marsupiais", cex=1.2, pch=16, bty="u")
par(new=TRUE)
plot(z~area,  ann=F,axes=F, cex=1,2, pch=17,col="blue") 
axis(4)

      #AXIS e JITTER
    plot.default(CO2$uptake~CO2$Treatment)

    plot.default(CO2$uptake~jitter(as.numeric(CO2$Treatment)),xaxt="n",xlim=c(0.5,2.5), xlab="",ylab="uptake",bty="l")
    axis(1, at = 1:2, labels =c ("chilled", "nonchilled"),las=1, cex.axis=1.2)
    
    
#### 2 gráficos
local=rep(c("A","B"),each=2, times=3)
area <- c(303, 379, 961, 332, 47, 122, 11, 53, 2749,3000,475,30)
riqueza<- c(3,10,20,7,4,8,3,5,25,29,12,3) 
z <-c(50,42,33,29,25,19,17,15,10,11,8,9)


par(mfrow=c(2,1))
par(mar=c(3,5,2,2),cex.axis=1.2,cex.lab=1.2,cex.main=1.5,family="serif",las=1,tcl=0.3,mgp=c(2,0.3,0)) 
plot(riqueza~area, xlab="Área (ha)", ylab="Riqueza de espécies de\n roedores e marsupiais", cex=1.2, pch=16, bty="u")
par(new=TRUE)
plot(z~area,  ann=F,axes=F, cex=1,2, pch=17,col="blue") 
axis(4)

par(mar=c(2,5,1,2))
boxplot(riqueza~local)


######### opções
mtplot <- matrix(1:9, ncol=3, nrow=3, byrow=TRUE)
layout(mtplot)
layout.show(9)
mtplot <- matrix(1:9, ncol=3, nrow=3, byrow=TRUE)
layout(mtplot, widths=c(0.1, 0.6, 0.4), heights=c(1,4,1))
layout.show(9)
######



#inserindo texto
par(mfrow=c(2,1))
par(mar=c(3,4.5,2,3),cex.axis=1.2,cex.lab=1.2,cex.main=1.5,family="serif",las=1,tcl=0.3,mgp=c(2,0.3,0)) 
plot(riqueza~area, xlab="Área (ha)", ylab="Riqueza de espécies de\n roedores e marsupiais", cex=1.2, pch=16, bty="u")
par(new=TRUE)
plot(z~area,  ann=F,axes=F, cex=1,2, pch=17,col="blue") 
axis(4)
mtext("Riqueza insetos", side=4, cex=1.2, line=1.5, las=0,col="blue")

par(mar=c(3,5,2,2))
boxplot(riqueza~local,names= c("", ""))
mtext(c("RJ", "SP"),side= 1,cex=1.3,line=0.3,at=c(1,2))
mtext("Riqueza", side=2, cex=1.2, line=1.5, las=0)
mtext("Cidade", side=1, cex=1.2, line=1.5)

text(1.7,28, "@", cex=1.8)
locator()

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
par(mfrow=c(1,1))
par(mar=c(3,4.5,2,3),cex.axis=1.2,cex.lab=1.2,cex.main=1.5,family="serif",las=1,tcl=0.3,mgp=c(2,0.3,0)) 
plot(riqueza~area, xlab="Área (ha)", ylab="", cex=1.2, pch=16, bty="u",ylim=c(-30,30),yaxt="n")
axis(2,at=c(0,10,20,30))
par(new=TRUE)
plot(z~area,  cex=1,2, pch=17,col="blue",ylim=c(5,100),ann=F,axes=F) 
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
arrows(area,upper,area,lower,length=.05,angle=90,code=3)
axis(2,at=c(0,10,20,30))
par(new=TRUE)
plot(z~area,  cex=1,2, pch=17,col="blue",ylim=c(5,100),ann=F,axes=F)
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
lines(c(0,3000),c(30, 30), lty=4 , lwd=4)



### ++++ informações

ppt=c(134.3,64.5,68.3,66.6,0.6,72.1,51.2,138.0,121.4,126.1,255.9,217.0,123.1,65.1,59.5,21.6,191.7,28.1, 134.9,141.2)

setwd("C:/Users/Camila/Dropbox/back up")
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
points(5.5,6,cex=20,pch=16,col="blue")



#### salvando os gráficos
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
barplot(table(sexo,dieta), main="sexo X dieta")



library(datasets)
head(CO2)

hist(CO2$uptake)
boxplot(CO2$uptake)
boxplot(CO2$uptake~CO2$Treatment)

plot(CO2$uptake~CO2$Treatment)

plot.default(CO2$uptake~CO2$Treatment)
plot.default(CO2$uptake~jitter(as.numeric(CO2$Treatment)),xaxt="n",xlim=c(0.5,2.5), xlab="",ylab="uptake",bty="l")
axis(1, at = 1:2, labels =c ("chilled", "nonchilled"),las=1, cex.axis=1.2)

hist(CO2$uptake,prob=T,col="gray") #reescalonado, de forma que as barras somem 1
lines(density(CO2$uptake),col="blue",lwd=2 )


library(UsingR)
head(brightness)
hist(brightness,col="gray")
rug(jitter(brightness))
hist(brightness,prob=T) #reescalonado, de forma que as barras somem 1
lines(density(brightness),col="blue" )


plot(density(brightness),col="blue")
curve(expr = dnorm(x,mean=mean(brightness),sd=sd(brightness)),add=T, col="red")


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

