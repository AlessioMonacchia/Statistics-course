# 2) importing datasets
species <- read.csv("data/mite.csv")
env_var <- read.delim("data/mite_env.txt", sep = "")

# dim() is used to count number of observations, species, and environmental variables
str(species)
str(env_var)

# 3) call the package vegan and use "?" to access datasets documentation
library(vegan)
?mite

# Shrub levels: none, few, many, change them into 1, 2, 3
library(stringr)
env_var$Shrub = str_replace_all(env_var$Shrub,"None","1")
env_var$Shrub = str_replace_all(env_var$Shrub,"Few","2")
env_var$Shrub = str_replace_all(env_var$Shrub,"Many","3")

# convert 3 column types from characters to factors
env_var$Substrate <- factor(env_var$Substrate,
                        levels = c("Sphagn1", "Sphagn2", "Sphagn3", "Sphagn4", "Litter", "Barepeat", "Interface"),
                        ordered = T)

env_var$Shrub <- factor(env_var$Shrub,
                        levels = c("1", "2", "3"),
                        ordered = T)

env_var$Topo <- factor(env_var$Topo,
                        levels = c("Blanket", "Hummock"))
                        
# 4a) calculate summary statistics for environmental variables
summary(env_var)

# remove rows with NAs
is.na.data.frame(env_var)
index_na <- which(is.na(env_var), arr.ind = T)
index_na <- index_na[ ,1]
env_var <- env_var[-index_na, ]

# remove same rows from species dataset
species <- species[-index_na, ]

# 4b) export tables as .txt files
write.table(env_var, file = "output/env_var.txt", sep = " ", dec = ".")
write.table(species, file = "output/species.txt", sep = " ", dec = ".")

# 5) histograms for continuous numerical variables and barplots for categorical variables
library(ggplot2)
plot_Sub <- ggplot(data = env_var, aes(Substrate, fill = Substrate)) +
  geom_bar(show.legend = F) +
  labs(title = "Barplot for Substrate", x = "Substrate", y = "Count")
plot_Sh <- ggplot(data = env_var, aes(Shrub, fill = Shrub)) +
  geom_bar(show.legend = F) +
  labs(title = "Barplot for Shrub", x = "Shrub", y = "Count")
plot_To <- ggplot(data = env_var, aes(Topo, fill = Topo)) +
  geom_bar(show.legend = F) +
  labs(title = "Barplot for Topography", x = "Topography", y = "Count")


plot_SD <- ggplot(data = env_var, aes(SubsDens)) +
  geom_histogram(breaks=seq(20, 90, by=10), 
                 col = "red",
                 fill = "orange") +
  labs(title = "Histogram for substrate density", 
       x = "Substrate Density",
       y = "Count")
plot_Wa <- ggplot(data = env_var, aes(WatrCont)) +
  geom_histogram(breaks=seq(130, 830, by=100), 
                 col = "blue",
                 fill = "dark blue") +
  labs(title = "Histogram for water content Density", 
       x = "WC Density",
       y = "Count")

# Export at least one graph in the output subfolder as pdf

pdf("output/Plot_1.pdf")
plot_Sub
dev.off()

# 6a) Convert comunity matrix into presence-absence matrix
species <- decostand(species, method = "pa")

# 6b) export presence-absence matrix as in .csv format
write.csv(species, file = "output/species.csv")

# 7a) Calculate species richness then add to environmental variables as new column
env_var$sr <- specnumber(species)

# 7b) check which are max, min and average species richness in dataset
summary(env_var$sr)

# 7c) how does species richness distribute in respect with topo variable with a boxplot
p <- ggplot(data = env_var, aes(x = Topo, y = sr, fill = Topo)) +
  geom_boxplot() +
  labs(title = "Boxplot of species richness distribution in respect to topography",
       x = "Topography",
       y = "Species Richness") +
  geom_point()
pl <- p + scale_fill_discrete(name = "Legend")
pl

# 8) Plot the distribution of species richness in respect with the available 
# numeric environmental variables
plot(env_var$sr, env_var$SubsDens,
     main = "Correlation plot",
     xlab = "Species richness",
     ylab = "Substrate density")

plot(env_var$sr, env_var$WatrCont,
     main = "Correlation plot",
     xlab = "Species richness",
     ylab = "Water content") 

# more sophisticate correlation plot made with corrplot package
library(corrplot)

new_data <- env_var[,c(1:2,6)]

correlation <- cor(new_data)

corrplot(correlation, order = 'AOE',
         col = COL2('RdBu', 10),
         addCoef.col = "black",
         title = "Correlation Plot",
         diag = F,
         mar=c(0,0,1,0)) # margins


# test species richness correlation with numerical variables (Substrate, Water content)
cor.test(env_var$sr, env_var$SubsDens)
cor.test(env_var$sr, env_var$WatrCont)

# for each numerical variable significantly correlated, run a regression analysis
cor_an <- lm(sr ~ WatrCont, data = env_var)
summary(cor_an)

# correlation plot with ggplot2 package
ggplot(env_var, aes(x = WatrCont, y = sr)) + 
  geom_point() +
  stat_smooth(method = "lm", col = "red") +
  labs(title = "Linear model plot",
       x = "Water content",
       y = "Species richness")