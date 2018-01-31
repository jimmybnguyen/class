# Motivaing question:
# Is there an observable difference in baby weight for smokers / non-smokers?

# Install/library the `openintro package
# install.packages('openintro')
library(openintro)
<<<<<<< HEAD
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

=======

# You should now be able to `View` the `births` dataset

# What are the mean birth weights for smokers/non-smokers
by.smoker <- births %>% 
            group_by(smoke) %>% 
            summarize(mean.weight = mean(weight))


# Store smokers/non-smokers in separate variables for easier access
smokers <- births %>% filter(smoke == "smoker") %>% select(weight)
non.smokers <- births %>% filter(smoke == "nonsmoker") %>% select(weight)

# Make an overlapping histogram of the birth weights of smokers/non-smokers
hist(non.smokers$weight, col=rgb(0,1,0,0.3))
hist(smokers$weight, col=rgb(0,0,1,0.3), add=T)

# Pre-t-test conceptaul question: is this data paired?

# Implement a t-test to assess the significance of this difference
t.test(smokers, non.smokers)

# Now, let's calculate the t value and confidence intervals manually
diff.means <- mean(smokers$weight) - mean(non.smokers$weight)
se <- sqrt(
  (sd(smokers$weight)^2/length(smokers$weight)) +
    (sd(non.smokers$weight)^2/length(non.smokers$weight))
)

t.score <- diff.means/se

# Compute CIs using t threshold
t <- 2.009 # from t table
ci.lower <- diff.means - t * se
ci.upper <- diff.means + t * se

>>>>>>> eeb74e56fdf96ec83a4662b8481dccc2fda3c997


