library(dplyr)
library(ggplot2)

df <- read.csv('facebook.tsv', sep = '\t') #file in computer so change the dir

df %>%
  ggplot(aes(x = dob_day)) +
  geom_bar() +
  facet_wrap(~ dob_month)

df %>%
  filter(gender != 'NA') %>%
  ggplot(aes(x = friend_count)) +
  geom_histogram(binwidth = 33) +
  facet_grid(.~ gender) +
  coord_cartesian(xlim = c(0,1000)) +
  scale_x_continuous(breaks = seq(0,1000,200))


# skewed to the right (mean > median); needs more symmetrical
df %>%
  filter(gender != 'NA') %>%
  ggplot(aes(x = friend_count)) +
  geom_histogram(binwidth = 33) +
  facet_grid(.~ gender) +
  coord_cartesian(xlim = c(0,1000)) +
  scale_x_continuous(breaks = seq(0,1000,200))

# log transform
df %>%
  filter(gender != 'NA') %>%
  ggplot(aes(x = friend_count)) +
  geom_histogram() +
  scale_x_log10() +
  xlab('Number of Friends (log)')

# square root
df %>%
  filter(gender != 'NA') %>%
  ggplot(aes(x = sqrt(friend_count))) +
  geom_histogram() 

#or better
df %>%
  filter(gender != 'NA') %>%
  ggplot(aes(x = friend_count)) +
  geom_histogram() +
  scale_x_sqrt()

# boxplot

df %>%
  filter(!is.na(gender)) %>%
  ggplot(aes(x = gender, y = friend_count)) +
  geom_boxplot() +
  coord_cartesian(ylim = c(0,1000))

# scatterplot

df %>%
  ggplot(aes(x = age, y = friend_count)) +
  geom_point()

# avoid overplotting
df %>%
  ggplot(aes(x = age, y = friend_count)) +
  geom_point(size = .3, alpha = .05)

#create a sense of continuity on x-axis by adding jitter
df %>%
  ggplot(aes(x = age, y = friend_count)) +
  geom_jitter(size = .3, alpha = .05)

