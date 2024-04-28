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
(eigen_notas<- notas_pca$sdev^2)            # Eigenvalues are the sdev^2
names(eigen_notas) <- paste("PC",1:3,sep="")
eigen_notas
sumlambdas <- sum(eigen_notas)
propvar <- eigen_notas/sumlambdas
cumvar_notas <- cumsum(propvar)
matlambdas <- rbind(eigen_notas,propvar,cumvar_notas)
rownames(matlambdas) <- c("Eigenvalues","Prop. variance","Cum. prop. variance")
# Apresentando a tabela com os autovalores e suas respectivas contribuições para a variância total. 
round(matlambdas,4)

# apresentando os autovetores
notas_pca$rotation

# The print method below is the same as  euroemp_pca$sdev and 
# euroemp_pca$rotation printed together
print(notas_pca)     # apresentando os XX 
# escores amostrais para os componentes
notas_pca$x

detach(notas)
# Fim do script