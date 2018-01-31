# Motivaing question:
# Is there an observable difference in baby weight for smokers / non-smokers?

# Install/library the `openintro package
# install.packages('openintro')
library(openintro)
library(dplyr)

# You should now be able to `View` the `births` dataset
View(births)

# What are the mean birth weights for smokers/non-smokers
means <- births %>%
          group_by(smoke) %>%
          summarise(mean.weight = mean(weight))

# Store smokers/non-smokers in separate variables for easier access
smokers <- births %>% filter(smoke == "smoker") %>% select(weight)
non.smokers <- births %>% filter(smoke != "smoker") %>% select(weight)

# Make an overlapping histogram of the birth weights of smokers/non-smokers
hist(non.smokers$weight, col=rgb(0,0,1, .2))
hist(smokers$weight, add=TRUE, col=rgb(0,1,0, .2))

# Pre-t-test conceptaul question: is this data paired?
diff.means <- mean(non.smokers$weight) - mean(smokers$weight)
se <- sqrt(
  sd(non.smokers$weight)^2 / nrow(non.smokers) +
  sd(smokers$weight)^2 / nrow(smokers)
)

# Let's calculate the t value and confidence intervals manually
#t.score <- diff.means/se
t <- 2.009

# Compute CIs using t threshold
ci.lower <- diff.means - t * se
ci.upper <- diff.means + t * se

# Implement a t-test to confirm our results
t.test(non.smokers, smokers)



