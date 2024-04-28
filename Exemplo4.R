# Exemplo 4

# limpando o ambiente
rm(list = ls())

# carregando os pacotes necessários
library(psych)

# carregando o conjunto de dados
euroemp <- read.csv("Euroemp.csv", header=TRUE, row.names=1)
attach(euroemp) # anexando as variáveis no ambiente do R

# Applying "principal" from package psych
# Aplicando a análise fatorial por componentes principais sem rotação
af_sem_rotacao <- principal(euroemp[-1], nfactors=4, rotate="none")
af_sem_rotacao                  # apresentando os resultados 
round(af_sem_rotacao$values, 3) # Autovalores    
af_sem_rotacao$loadings         # Cargas Fatoriais
for (i in c(1,3,2,4)) { print(af_sem_rotacao$loadings[[1,i]])}   # Cargas com mais dígitos
af_sem_rotacao$communality      # Comunalidades
# Escores fatoriais sem rotacionamento
af_sem_rotacao$scores      

# Análise Fatorial com rotação Varimax
af_com_rotacao <- principal(euroemp[-1], nfactors=4, rotate="varimax")
af_com_rotacao                  # apresentando os resultados 
round(af_com_rotacao$values, 3) # Autovalores    
af_com_rotacao$loadings         # Cargas Fatoriais
for (i in c(1,3,2,4)) { print(af_com_rotacao$loadings[[1,i]])}   # Cargas com mais dígitos
af_com_rotacao$communality      # Comunalidades
# Escores fatoriais sem rotacionamento
af_com_rotacao$scores   

detach(euroemp) # dexanexando as variáveis do ambiente R
#
# Fim do script
