# https://rpubs.com/jarrais/GET00183_Topico5
#https://rpubs.com/dscorzoni/ggplot2_barras
# https://www.youtube.com/watch?v=_mvT1kxkx60

library(tidyverse)
library(RColorBrewer)


df <- read.csv(file = "/home/diolinux/Documentos/variantes-para-r.csv"  , header = TRUE, sep = ",")

df %>%
  ggplot(aes(x = reorder(Mês.Ano, -ordem), y = Número.de.amostras, fill = Variante, label = Número.de.amostras)) + # fill adiciona cores ao 2o fator: gender
  geom_bar(stat = "identity") +
  #scale_x_discrete(breaks = seq(0,10,200)) +
  geom_label(position = "stack") + # especificar a posição por ser gráfico empilhado
  coord_flip() 

library(ggplot2)

grafico <- df %>%
  ggplot(aes(x = reorder(Mês.Ano, -ordem), y = Número.de.amostras,  fill = reorder(Variante, Ordem.variante), label = Número.de.amostras)) + # fill adiciona cores ao 2o fator: gender
  geom_bar(stat = "identity") +
  #scale_fill_brewer(palette = "Set1") +
  scale_fill_manual(
    values = c(
      "Alpha" = "brown3",
      "Delta" = "chartreuse1",
      "Other" = "cyan",
      "Gamma" = "yellow",
      "Ômicron BA.1" = "red",
      "Ômicron BA.2 ou BA.3" = "brown1", 
      "Ômicron BA.2 ou BA.3" = "brown2", 
      "Ômicron BA.4 ou BA.5" = "brown3")) +
  geom_label(position = position_stack(vjust = 1)) +
  coord_flip() +
  scale_y_continuous(breaks = seq(0, 200, 50)) +
  theme_classic() +
  labs(x = "Month /Year",
       y = "Number of samples",
       fill = "Variant")
grafico



grafico + 

  theme(legend.position = c(0.80, 0.80),
        legend.text = element_text(size = 15),
        axis.title = element_text(size = 20),
        legend.key.height = unit(30, "pt"),
        legend.title = element_text(), 
        #axis.title.x = element_text(size = 20),
        #axis.title.y = element_text(size = 20), 
        axis.text = element_text(size = 15))
       


display.brewer.all()



### idade 


library(tidyverse)
library(RColorBrewer)
library(ggplot2)


df <- read.csv(file = "/home/diolinux/Documentos/idade-para-r.csv"  , header = TRUE, sep = ",")
head(df)

grafico <- df %>%
  ggplot(aes(x = reorder(Variant, ordem), y = People...., fill = reorder(Age,Ordem.idade), label = People....)) + # fill adiciona cores ao 2o fator: gender
  geom_bar(stat = "identity") +
  theme_classic() +
  labs(x = "Variant",
       y = "Pacients (%)",
       fill = "Age")


grafico 


grafico + 
  
  theme(
        legend.text = element_text(size = 15),
        axis.title = element_text(size = 15),
        legend.key.height = unit(15, "pt"),
        axis.text = element_text(size = 10))




display.brewer.all()

### sexo


library(tidyverse)
library(RColorBrewer)
library(ggplot2)


df <- read.csv(file = "/home/diolinux/Documentos/sexo-para-r.csv"  , header = TRUE, sep = ",")
head(df)

grafico <- df %>%
  ggplot(aes(x = reorder(Variante, ordem), y = result, fill = sex, label = result)) + # fill adiciona cores ao 2o fator: gender
  geom_bar(stat = "identity") +
  geom_hline(yintercept = 50, linetype = "dashed") + 
  theme_classic() +
  labs(x = "Variant",
       y = "Pacients (%)",
       fill = "Age")


grafico 


grafico + 
  
  theme(
    legend.text = element_text(size = 15),
    axis.title = element_text(size = 15),
    legend.key.height = unit(15, "pt"),
    axis.text = element_text(size = 10))


scale_fill_manual(
  values = c(
    "Alpha" = "brown3",
    "Delta" = "chartreuse1",
    "Other" = "cyan",
    "Gamma" = "yellow",
    "Ômicron BA.1" = "red",
    "Ômicron BA.2 ou BA.3" = "brown1", 
    "Ômicron BA.2 ou BA.3" = "brown2", 
    "Ômicron BA.4 ou BA.5" = "brown3")) +
  geom_label(position = position_stack(vjust = 1)) +
  coord_flip() +
  scale_y_continuous(breaks = seq(0, 200, 50)) +
  theme_classic() +
  labs(x = "Month /Year",
       y = "Number of samples",
       fill = "Variant")
grafico



grafico + 
  
  theme(legend.position = c(0.80, 0.80),
        legend.text = element_text(size = 15),
        axis.title = element_text(size = 20),
        legend.key.height = unit(30, "pt"),
        legend.title = element_text(), 
        #axis.title.x = element_text(size = 20),
        #axis.title.y = element_text(size = 20), 
        axis.text = element_text(size = 15))



display.brewer.all()


