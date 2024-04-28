# Exemplo 1

# limpando o ambiente
rm(list = ls())

# carregando os pacotes necessários
library (corrplot)

# dados da livraria
X<-matrix(c(42,52,48,58,2,3,2,3), nrow=4, ncol=2, byrow=FALSE)
X
# vetor de médias
Xbarra<-apply(X, 2, mean)
Xbarra

# matriz de covariâncias
S<-cov(X)
S

# matriz de correlação
R<-cor(X)
R

# matriz de correlação  
corrplot(R, method = "circle")
          