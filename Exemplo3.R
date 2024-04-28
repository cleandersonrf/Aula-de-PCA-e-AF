# Exemplo 3

# limpando o ambiente
rm(list = ls())

# carregando os pacotes necessários

euroemp <- read.csv("Euroemp.csv",header=TRUE, row.names=1)
attach(euroemp) # anexando as variáveis no ambiente do R
# Correlações entre os nove grupos de indústrias
cor(euroemp[-1])

# realizando a análise de componentes principais a partir da função "prcomp"
euroemp_pca <- prcomp(euroemp[,-1],scale=TRUE)
summary(euroemp_pca) # apresentando os resultados

# Calculando uma tabela contendo os autovalores e as pocentagens de variação explicadas
(eigen_euroemp <- euroemp_pca$sdev^2)            # Eigenvalues are the sdev^2
names(eigen_euroemp) <- paste("PC",1:9,sep="")
eigen_euroemp
sumlambdas <- sum(eigen_euroemp)
propvar <- eigen_euroemp/sumlambdas
cumvar_euroemp <- cumsum(propvar)
matlambdas <- rbind(eigen_euroemp,propvar,cumvar_euroemp)
rownames(matlambdas) <- c("Eigenvalues","Prop. variance","Cum. prop. variance")
# Apresentando a tabela com os autovalores e suas respectivas contribuições para a variância total. 
round(matlambdas,4)

# apresentando os autovetores
euroemp_pca$rotation

# The print method below is the same as  euroemp_pca$sdev and 
# euroemp_pca$rotation printed together
print(euroemp_pca)     # apresentando os XX 
# escores amostrais para os componentes
euroemp_pca$x

# Identificando os escores por país
eurotyp_pca <- data.frame(euroemp_pca$x)
eurotyp_pca

# realizando o gráfico dos escores para o primeiro e segundo componente
# This plot is similar to Figure 6.2
plot(eurotyp_pca$PC1, eurotyp_pca$PC2, type="n", 
     xlab="PC1", ylab="PC2", main="")
text(eurotyp_pca$PC1, eurotyp_pca$PC2,labels=rownames(euroemp), cex=0.5)
abline(h=0)
abline(v=0)
#
detach(euroemp)
# End of script