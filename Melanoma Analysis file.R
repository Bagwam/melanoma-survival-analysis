library(tidyverse)
library(dplyr)
library(readr)
library(tidyverse)
melanoma <- read.csv("C:/Users/User/Downloads/melanoma.csv")
view(melanoma)
colnames(melanoma) <- c("id","time since operation", "status", "sex", "age","year", "thickness", "ulcer")
view(melanoma)
melanoma <- melanoma %>% select(-id)
view(melanoma)
attach(melanoma)
melanoma <- melanoma %>%
  mutate(status = recode_factor(status, "1" = "Died from melanoma", "2" = "Still alive", "3" = "Died other causes"))
view(melanoma)
melanoma <- melanoma %>%
  mutate(sex = recode_factor(sex, "1" = "male", "0" = "female"))
melanoma <- melanoma %>%
  mutate(ulcer = recode_factor(ulcer, "1" = "present", "0" = "absent"))
view(melanoma)
table(`time since operation`)
table(year)
table(ulcer)
table(status)
table(thickness)
table(age)
table(sex)
summary(melanoma)

str(melanoma)

par(mfrow=c(2,2))
hist(melanoma$`time since operation`, main="Time since operation")
hist(melanoma$thickness,main = "thickness")    
hist(melanoma$age)
hist(melanoma$year)

ggplot(melanoma, aes(status)) +
  geom_bar(colour = "black", fill = "blue3", width = 0.2) + theme_dark() +
  labs(title = "Status of patients", x = NULL, y = "Patient count")
ggplot(melanoma, aes(ulcer)) +
  geom_bar(colour = "black", fill = "blue3", width = 0.2) + theme_dark() +
  labs(title = "Indicator of ulceration", x = NULL, y = "Patient count")
ggplot(melanoma, aes(sex)) +
  geom_bar(colour = "black", fill = "blue3", width = 0.2) + theme_dark() +
  labs(title = "Patients sex", x = NULL, y = "Patient count")
ggplot(melanoma, aes(thickness)) +
  geom_boxplot(colour = "black", fill = "blue3", width = 0.2) + theme_dark() +
  labs(title = "Patients sex", x = NULL, y = "Patient count")

boxplot(melanoma$`time since operation`)
boxplot(melanoma$status)
boxplot(melanoma$age)
boxplot(melanoma$year)
boxplot(melanoma$thickness, main = "Tumour thickness")

attach(melanoma)
cor(`time since operation`, thickness, method = "pearson")
plot(`time since operation`, thickness, main = "scatterplot", col = "blue3", pch=15)

my_model=lm(formula = thickness~`time since operation`)
my_model

summary(my_model)
LinReg <- lm(thickness ~ `time since operation`)
abline(LinReg, col = "black", lwd = 4)
LinReg
summary(LinReg)

cor(as.numeric(melanoma$'time since operation'), as.numeric(melanoma$age), method = "pearson")
plot(as.numeric(melanoma$`time since operation`), as.numeric(melanoma$age), main = "scatterplot", col = "blue3", pch=15,
     xlab = "time since operation",
     ylab = "age")
LinReg <- lm(melanoma$age ~ melanoma$`time since operation`)
abline(LinReg, col = "black", lwd = 4)
LinReg            
summary(LinReg)             

cor(as.numeric(melanoma$thickness), as.numeric(melanoma$age), method = "pearson")
plot(as.numeric(melanoma$thickness), as.numeric(melanoma$age), main = "scatterplot", col = "blue3", pch=15,
     xlab = "thickness",
     ylab = "age")
LinReg <- lm(melanoma$age ~ melanoma$thickness)
abline(LinReg, col = "black", lwd = 4)
LinReg
summary(LinReg)
head(melanoma)
melanoma <- as_tibble(melanoma)
qplot(x = sex, y = `time since operation`,
      geom = "boxplot", data = melanoma,
      xlab = "sex",
      ylab = "survival time",
      fill = I("blue3"))


qplot(x = sex, y = thickness,
      geom = "boxplot", data = melanoma,
      xlab = "sex",
      ylab = "Tumour thickness",
      fill = I("blue3"))


qplot(x = sex, y = age,
      geom = "boxplot", data = melanoma,
      xlab = "sex",
      ylab = "Patient's age",
      fill = I("blue3"))

male <- filter(melanoma, sex=='male')
female <- filter(melanoma, sex=='female')

age_t_test <- t.test(age~sex, data = melanoma)
age_t_test

thickness_t_test <- t.test(thickness ~ sex, data = melanoma)
thickness_t_test

time_since_operation_t_test <- t.test(`time since operation` ~ sex, data = melanoma)
time_since_operation_t_test

chisq.test(melanoma$`time since operation`, melanoma$sex)
chisq.test(melanoma$thickness, melanoma$sex)
chisq.test(melanoma$age, melanoma$sex)

attach(melanoma)


p_time <- ggplot(data = melanoma, aes(sample = `time since operation`))
p_time + stat_qq() + stat_qq_line()
p_time + stat_qq(colour = "blue3") + stat_qq_line(colour = "red4") + facet_grid(. ~ sex) + xlab("theoretical") + ylab("Survival time in days")

p_age <- ggplot(data = melanoma, aes(sample = age))
p_age + stat_qq() + stat_qq_line()
p_age + stat_qq(colour = "blue3") + stat_qq_line(colour = "red4") + facet_grid(. ~ sex) + xlab("theoretical") + ylab("Patients age")

p_thickness <- ggplot(data = melanoma, aes(sample = thickness))
p_thickness + stat_qq() + stat_qq_line()
p_thickness + stat_qq(colour = "blue3") + stat_qq_line(colour = "red4") + facet_grid(. ~ sex) + xlab("theoretical") + ylab("Tumour thickness in mm")
