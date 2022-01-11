#install.packages("basedosdados")
#library("basedosdados")
# Defina o seu projeto no Google Cloud
set_billing_id("datacdnaep")
# Para carregar o dado direto no R
query <- "SELECT * FROM `basedosdados.br_inep_censo_escolar.matricula` WHERE (id_municipio='2904605') AND (ano>2008);"

 read_sql(query,page_size = 10000)
 
 download(query,
          path = 'data/dados.csv',
          page_size = 10000)


 library(dplyr)
 
 dados %>% group_by(ano) %>% summarise(Numero_TEA = sum(as.numeric(autismo),na.rm=TRUE))
 
 dados %>% group_by(ano) %>% summarise(MATRICULADOS = n_distinct(id_matricula))
 
 dados %>% group_by(ano) %>% summarise(TEA_perc = sum(as.numeric(autismo),na.rm=TRUE)*100/n_distinct(id_matricula))
 