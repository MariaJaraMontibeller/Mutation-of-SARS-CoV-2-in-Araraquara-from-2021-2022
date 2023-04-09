# https://www.geeksforgeeks.org/combine-bar-and-line-chart-in-ggplot2-in-r/

# https://pt.stackoverflow.com/questions/277801/plotar-2-graficos-em-um-e-eixos-y-com-escalas-diferentes

library(gtable)
library(ggplot2)
library(grid)
library(extrafont)
library(tidyverse)perf <- read.csv(file = "/home/diolinux/Documentos/grafico-misto.csv"  , header = TRUE, sep = ";")
head(perf)
# Plotting Multiple Charts
library(ggplot2)

p <- ggplot(perf)  + 
  geom_bar(aes(x = reorder(Month,ordem), y = Number.of.exams),stat="identity", fill="lightblue", color = "black")+
  geom_line(aes(x=Month, y=100*Positive.tests...., group = 1),stat="identity",color="red",size=0.70)+
  labs(x="Month",y="Number of exams") +
  theme_classic() +
  geom_hline(yintercept = 5000, linetype = "dashed") + 
  scale_y_continuous (sec.axis=sec_axis(~.*0.01,name="Positive tests (%)", breaks = c(0,50,100)))

p

p2 <- p+ theme( axis.title.x = element_text(size = 20), axis.title.y = element_text(size = 20), axis.text = element_text(size = 15)) 
p2           
