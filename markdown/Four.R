###
#Question 4
###

# PREPARATION
library(tidyverse)
library(mosaic)
library(rsample)
library(caret)
library(modelr)
library(parallel)
library(foreach)


setwd("~/School/UT/StatLearning/csvfiles")

sclass = read.csv("sclass.csv")

# CLEANING/SEPARATING THE DATASET
sclass350 = sclass %>%
  select(trim, mileage, price) %>%
  filter(trim == "350")

sclass63 = sclass %>%
  select(trim, mileage, price) %>%
  filter(trim == "63 AMG")

##
# TRIM 350 #
##

# SPLITTING TRIM 350'S DATASET FOR KNN
sclass350_split = initial_split(sclass350, prop = 0.80)
sclass350_train = training(sclass350_split)
sclass350_test = testing(sclass350_split)

# FOR DIFFERENT LEVELS OF K, MAKING PREDICTIONS ON THE TESTING SET AND CALCULATING THE RMSE #

# k = 2
knn350_2 = knnreg(price ~ mileage, data = sclass350_train, k = 2)

sclass350_test = sclass350_test %>%
  mutate(k2_price_pred = predict(knn350_2,sclass350_test))

rmse(knn350_2, sclass350_test)

# k = 10
knn350_10 = knnreg(price ~ mileage, data = sclass350_train, k = 10)

sclass350_test = sclass350_test %>%
  mutate(k10_price_pred = predict(knn350_10,sclass350_test))

rmse(knn350_10, sclass350_test)

# k = 25
knn350_25 = knnreg(price ~ mileage, data = sclass350_train, k = 25)

sclass350_test = sclass350_test %>%
  mutate(k25_price_pred = predict(knn350_25,sclass350_test))

rmse(knn350_25, sclass350_test)

# k = 100
knn350_100 = knnreg(price ~ mileage, data = sclass350_train, k = 100)

sclass350_test = sclass350_test %>%
  mutate(k100_price_pred = predict(knn350_100,sclass350_test))

rmse(knn350_100, sclass350_test)

# k = 300
knn350_300 = knnreg(price ~ mileage, data = sclass350_train, k = 300)

sclass350_test = sclass350_test %>%
  mutate(k300_price_pred = predict(knn350_300,sclass350_test))

rmse(knn350_300, sclass350_test)


# PLOTTING RMSE VS K FOR TRIM 350

rmse_350 = foreach(i = 1:150, .combine='c') %do%{
  knnmod = knnreg(price ~ mileage, data=(sclass350_train), k=i)
  modelr::rmse(knnmod, data=sclass350_test)
}

xval = c(1:150)

rmse_k1 = data.frame(rmse_350, xval)

ggplot(rmse_k1) +
  geom_line(aes(x=xval, y=rmse_350)) +
  labs(title = "Trim 350's RMSE Based on the Value of k", y = "RMSE", x = "Number of k-nearest Neighbors")

# FINDING THE OPTIMAL VALUE OF k AND STORING IT

kx350 = rmse_k1 %>%
  arrange(rmse_350) %>%
  head(1) %>%
  select(xval)

k350optimal = kx350[1,1]

k350optimal

# PLOTTING THIS MODEL:

knn350_optimal = knnreg(price ~ mileage, data = sclass350_train, k = k350optimal)

sclass350_test = sclass350_test %>%
  mutate(koptimal_price_pred = predict(knn350_optimal, sclass350_test))

p_test1 = ggplot(sclass350_test) +
  geom_point(aes(x = mileage, y = price))

p_test1 + geom_line(aes(x = mileage, y = koptimal_price_pred), color = "red") +
  labs(title = "How Trim 350's price depends on mileage", x = "Mileage", y = "Price")

##
# TRIM 63 AMG #
##

# SPLITTING TRIM 63 AMG'S DATASET FOR KNN
sclass63_split = initial_split(sclass63, prop = 0.80)
sclass63_train = training(sclass63_split)
sclass63_test = testing(sclass63_split)

# FOR DIFFERENT LEVELS OF K, MAKING PREDICTIONS ON THE TESTING SET AND CALCULATING THE RMSE #

# k = 2
knn63_2 = knnreg(price ~ mileage, data = sclass63_train, k = 2)

sclass63_test = sclass63_test %>%
  mutate(k2_price_pred = predict(knn63_2, sclass63_test))

rmse(knn63_2, sclass63_test)

# k = 10
knn63_10 = knnreg(price ~ mileage, data = sclass63_train, k = 10)

sclass63_test = sclass63_test %>%
  mutate(k10_price_pred = predict(knn63_10,sclass63_test))

rmse(knn63_10, sclass63_test)

# k = 25
knn63_25 = knnreg(price ~ mileage, data = sclass63_train, k = 25)

sclass63_test = sclass63_test %>%
  mutate(k25_price_pred = predict(knn63_25,sclass63_test))

rmse(knn63_25, sclass63_test)

# k = 100
knn63_100 = knnreg(price ~ mileage, data = sclass63_train, k = 100)

sclass63_test = sclass63_test %>%
  mutate(k100_price_pred = predict(knn63_100, sclass63_test))

rmse(knn63_100, sclass63_test)

# k = 300
knn63_300 = knnreg(price ~ mileage, data = sclass63_train, k = 300)

sclass63_test = sclass63_test %>%
  mutate(k300_price_pred = predict(knn63_300, sclass63_test))

rmse(knn63_300, sclass63_test)


# PLOTTING RMSE VS K FOR TRIM 63 AMG

rmse_63 = foreach(j = 1:300, .combine='c') %do%{
  knnmod2 = knnreg(price ~ mileage, data=(sclass63_train), k=j)
  modelr::rmse(knnmod2, data=sclass63_test)
}

xval2 = c(1:300)

rmse_k2 = data.frame(rmse_63, xval2)

ggplot(rmse_k2) +
  geom_line(aes(x=xval2, y=rmse_63)) +
  labs(title = "Trim 63 AMG's RMSE Based on the Value of k", y = "RMSE", x = "Number of k-nearest Neighbors")

# FINDING THE OPTIMAL VALUE OF k AND STORING IT

kx63 = rmse_k2 %>%
  arrange(rmse_63) %>%
  head(1) %>%
  select(xval2)

k63optimal = kx63[1,1]

k63optimal

# PLOTTING THIS MODEL:

knn63_optimal = knnreg(price ~ mileage, data = sclass63_train, k = k63optimal)

sclass63_test = sclass63_test %>%
  mutate(koptimal_price_pred = predict(knn63_optimal, sclass63_test))

p_test2 = ggplot(sclass63_test) +
  geom_point(aes(x = mileage, y = price))

p_test2 + geom_line(aes(x = mileage, y = koptimal_price_pred), color = "red") +
  labs(title = "How Trim 63 AMG's price depends on mileage", x = "Mileage", y = "Price")

##
# Discussion
##

# It would appear that, with repeated trials, Trim 63 AMG's optimal value of k is generally higher.  This is due to Trim 63's larger sample size. Generally, higher values of k will reduce the variation of our model but at the cost of greater bias.  With larger sample sizes, we can afford to use larger values of k as these values will have a lesser effect on the model's bias.