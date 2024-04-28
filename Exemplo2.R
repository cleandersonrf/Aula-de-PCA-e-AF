# Exemplo 2

# limpando o ambiente
rm(list = ls())

# carregando os pacotes necessários

notas <- read.csv("notas2.csv", header=TRUE, row.names=1)
notas

attach(notas) # anexando as variáveis no ambiente do R
# Correlações entre os nove grupos de indústrias
cor(notas)

# realizando a análise de componentes principais a partir da função "prcomp"
notas_pca <- prcomp(notas,scale=TRUE)
summary(notas_pca) # apresentando os resultados

# Calculando uma tabela contendo os autovalores e as pocentagens de variação explicadas
(autovalores_notas<- notas_pca$sdev^2)            # autovalores são sdev^2
names(autovalores_notas) <- paste("PC",1:3,sep="")
autovalores_notas
sumlambdas <- sum(autovalores_notas)
propvar <- autovalores_notas/sumlambdas
cumvar_notas <- cumsum(propvar)
matlambdas <- rbind(autovalores_notas,propvar,cumvar_notas)
rownames(matlambdas) <- c("Autovalores","Prop. variancia","Prop acum. variancia")
# Apresentando a tabela com os autovalores e suas respectivas contribuições para a variância total. 
round(matlambdas,4)

# apresentando os autovetores
notas_pca$rotation

# The print method below is the same as  euroemp_pca$sdev and 
# euroemp_pca$rotation printed together
print(notas_pca)     # apresentando os XX 
# escores amostrais para os componentes
notas_pca$x

# biplot
plot(notas_pca$rotation[,1], notas_pca$rotation[,2], type="n", 
     xlab="PC1", ylab="PC2", main="",
     xlim = c(-4,4),
     ylim = c(-2,2))
text(notas_pca$x[,1], notas_pca$x[,2],
     labels=rownames(notas), cex=0.5)
abline(h=0)
abline(v=0)

detach(notas)
# Fim do script