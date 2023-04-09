### number of exams
# https://acervolima.com/modifique-o-eixo-a-legenda-e-os-rotulos-do-grafico-usando-ggplot2-em-r/

library(tidyverse)
library(ggplot2)

df1 <- read.csv(file = "/home/diolinux/Documentos/number-of-exam.csv"  , header = TRUE, sep = ",")

grafico <- df1 %>%
  ggplot(aes(x = reorder(Month,ordem), y = Number.of.exams, label = Number.of.exams)) + # fill adiciona cores ao 2o fator: gender
  geom_bar(stat = "identity", fill="lightblue", color = "black") +
  geom_label(position = position_stack(vjust = 1)) +
  scale_y_continuous(breaks = seq(0, 20000, 2000)) +
  theme_classic() +
  labs(x = "Month",
       y = "Number of exams")
grafico
grafico + theme(axis.title.x = element_text(size = 20), axis.title.y = element_text(size = 20), axis.text = element_text(size = 15))

######### testes positivos 

# https://www.ufrgs.br/wiki-r/index.php?title=Gr%C3%A1fico_de_pontos_e_linhas
# https://pt.stackoverflow.com/questions/530493/como-inserir-uma-linha-vertical-em-um-gr%C3%A1fico-de-barras-ou-pontos

library(tidyverse)
library(ggplot2)

df <- read.csv(file = "/home/diolinux/Documentos/positive-test.csv"  , header = TRUE, sep = ";")

grafico <-df %>%
  ggplot(aes(x = reorder(Month,ordem), y = Positive.tests...., label = Positive.tests...., group = 1 )) +
  geom_line(color="red",size=0.70)+
  geom_point() +
  theme_classic() +
  geom_hline(yintercept = 50, linetype = "dashed") +
  labs(x = "Month",
       y = "Positive tests (%)")  
  
grafico

grafico+ylim(0,100)+
  theme(axis.title.x = element_text(size = 20), axis.title.y = element_text(size = 20), axis.text = element_text(size = 15)) 
 


