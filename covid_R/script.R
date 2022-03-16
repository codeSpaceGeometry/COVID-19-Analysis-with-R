rm(list=ls()) # removes all variables stored previously
library(Hmisc) # import

data <- read.csv("C:/Users/12154/Desktop/covid_R/COVID19_line_list_data.csv")
describe(data) # Hmisc command

#cleaned up death column
data$death_dummy <- as.integer(data$death != 0)
#death rate
sum(data$death_dummy) / nrow(data)

#Age
#claim: people who die are older
dead = subset(data, death_dummy == 1)

alive = subset(data, death_dummy == 0)

#finds mean below, ignoring every unknown entry

mean(dead$age, na.rm = TRUE)

mean(alive$age, na.rm = TRUE)

#is this statistically significant?

t.test(alive$age, dead$age, alternative = "two.sided",
       conf.level = 0.95)
#normally, if p-value < 0.05, we reject the null hypothesis
#here, p-value ~ 0 (2.2e-16), so we reject the null.
#conclude statistical significance

#gender
men = subset(data, gender == "male")

women = subset(data, gender == "female")

mean(men$death_dummy, na.rm = TRUE) #8.4%

mean(women$death_dummy, na.rm = TRUE)#3.7%

t.test(men$death_dummy, women$death_dummy, alternative = "two.sided",
       conf.level = 0.95)
#p-value = 0.002 < 0.05, so statiscal significance occurs.
#significant

#t-Sne
describe(data)




