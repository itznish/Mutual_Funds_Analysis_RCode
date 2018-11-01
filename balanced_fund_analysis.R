### BALANCED FUNDS ANALYSIS

getwd()
library(dplyr)
search()

Balanced_funds_data = read.csv("F:\\BI_MATERIAL\\R_Workspace\\datafiles\\Balanced_funds_data.csv")
View(Balanced_funds_data)


str(Balanced_funds_data)


### NEW VARIABLE -  (ALPHA - BETA)

Balanced_funds_data$Alpha_Minus_Beta = Balanced_funds_data$Alpha - Balanced_funds_data$Beta

dim(Balanced_funds_data[(Balanced_funds_data$Beta <= 1.00),])

Bal = Balanced_funds_data[Balanced_funds_data$Alpha > median(Balanced_funds_data$Alpha)
                         & Balanced_funds_data$Alpha_Minus_Beta > median(Balanced_funds_data$Alpha_Minus_Beta)
                       & (Balanced_funds_data$Beta <= 1.00),]


View(Bal %>%
       filter(Fund.Risk.Grade == "Low" | Fund.Risk.Grade == "Below Average") %>%
       arrange(desc(Alpha_Minus_Beta)))




