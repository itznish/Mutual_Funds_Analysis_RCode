# Getting data into R
mf_exp_ratio <- read.csv("F:/BI_MATERIAL/R_Workspace/datafiles/mf_data.csv")

# REMOVING NULL VALUES AND NULL RECORDS
mf_exp_ratio <- mf_exp_ratio[!(is.na(mf_exp_ratio$Exp..Ratio...)|mf_exp_ratio$Exp..Ratio...== " "),]
View(mf_exp_ratio)

# ORDERING BY INCREASING EXPENSE RATIO
mf_exp_ratio_sorted <- mf_exp_ratio[order(mf_exp_ratio$Exp..Ratio...),]
View(mf_exp_ratio_sorted)

# SCATTERPLOTS
library(ggplot2)
qplot(mf_exp_ratio_sorted$Scheme,mf_exp_ratio_sorted$Exp..Ratio...)

qplot(mf_exp_ratio_sorted$NAV.Rs..,mf_exp_ratio_sorted$Exp..Ratio...,col="blue")

# PLOT WITH REGRESSION LINE
ggplot(mf_exp_ratio_sorted, aes(x=mf_exp_ratio_sorted$NAV.Rs.., y=mf_exp_ratio_sorted$Exp..Ratio...)) 
+ geom_point(shape=1) 
+ geom_smooth(method=lm)


mf_km <- kmeans(mf_exp_ratio_sorted$Exp..Ratio...,2,nstart = 10)
plot(x=mf_exp_ratio_sorted$NAV.Rs..,y=mf_exp_ratio_sorted$Exp..Ratio..., col=mf_km$cluster)
mf_km <- kmeans(mf_exp_ratio_sorted$Exp..Ratio...,4,nstart = 10)
plot(x=mf_exp_ratio_sorted$NAV.Rs..,y=mf_exp_ratio_sorted$Exp..Ratio..., col=mf_km$cluster)
mf_km <- kmeans(mf_exp_ratio_sorted$Exp..Ratio...,4,nstart = 20)
plot(x=mf_exp_ratio_sorted$NAV.Rs..,y=mf_exp_ratio_sorted$Exp..Ratio..., col=mf_km$cluster)
