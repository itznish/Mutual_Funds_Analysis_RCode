## LARGE CAP MUTUAL FUND ANALYSIS

#GETTING DATA INTO R [SAMPLE 10 ROWS]

mf_large_cap <- read.csv("F:\\BI_MATERIAL\\R_Workspace\\datafiles\\large_cap_MF_Analysis.csv",stringsAsFactors = F,nrows = 10)
str(mf_large_cap)
View(mf_large_cap)

#REMOVING NON ESSENTIAL COLUMNS

mf_large_cap$Return.1d. <- NULL
mf_large_cap$Return.1w. <- NULL
mf_large_cap$Return.1m. <- NULL

View(mf_large_cap)


#CLEANING

#SCHEME NAME

temp_split <- unlist(strsplit(mf_large_cap$Scheme,split = "-"))
temp_split

mf_large_cap$scheme.name <- cat(temp_split[1:3],unlist(strsplit(temp_split[4],split = " ")))

#FUND MANAGER
mf_large_cap$scheme.manager <- cat(unlist(strsplit(temp_split[4],split = " "))[3:4])

#SCHEME TYPE
mf_large_cap$scheme.type <- cat(unlist(strsplit(temp_split[4],split = " "))[6])


temp111 <- sapply(strsplit(mf_large_cap$Return, split='%', fixed=TRUE), function(v) (v[1]))
temp111 <- as.numeric(temp111)
temp111
