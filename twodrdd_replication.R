#script demonstrating how to use our twodrdd code

rm(list=ls())
getwd()

library(tidyverse)
library(devtools)

install_github("lily-an1/twodrdd")
library(twodrdd)

# This data mimics our simulation's Model 4 data 
example <- gen_dat_sim(sim=4, rho=0.2, cut1=0.5, cut2=0.5, seed=90904,
                       n=1000, s=2)

# The data generating function centers ratings around their cuts, so the 
# cut parameters to use in the analysis function are 0's.
cut1 <- example$parameters$observed$cut1
cut2 <- example$parameters$observed$cut2

# If using other data whose running variables are not already centered,
# include their cutoff values here so they will be centered in the function.
results <- analysis(example$data, cut1 = cut1, cut2 = cut2, 
                    include_OLS = F,
                    include_BINDING = T, 
                    include_FRONTIER = T,
                    include_GP = F, 
                    include_GP_RES = T, 
                    include_loess = T)
results

