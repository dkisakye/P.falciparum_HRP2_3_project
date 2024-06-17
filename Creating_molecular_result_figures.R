
#####################################
# CREATING FIGURES FOR MANUSCRIPT #
#####################################

## Clean the environment
rm(list = ls(all =TRUE))


## Load packages
library(ggplot2)
library(tidyverse)
library(ggrepel)
library(forcats)
library(RColorBrewer)


#####################################
####### varATS data ################
#####################################

category_varATS = c("varATS -", "varATS + (≤ 1 p/µL)", "varATS + (> 1 p/µL)")
counts_varATS <- c(44, 32, 90)  

# Create a dataframe
df_varATS <- data.frame(
 category = category_varATS,
  counts = counts_varATS,
  proportion = round(counts_varATS / sum(counts_varATS) * 100, 1) 
) 


##### Figures for varATS data #####

# Reorder the levels of the category variable based on proportion

df_varATS$category <- reorder(df_varATS$category, df_varATS$proportion, decreasing = TRUE)

colors <-c("#c51b8a", "#003366", "#2b8cbe")

# Stacked Bar plot

plot_1 <- ggplot(df_varATS, aes(x = "n = 166", y = proportion, fill = category)) +
  geom_bar(stat = "identity", position = "stack", color = "black", size = 0.2) +
  labs(y = "Proportion (%)", fill = "varATS result") +
  geom_text(aes(label = paste0(proportion, "%", " (n=", counts, ")")),
            position = position_stack(vjust = 0.5), size = 3, color = "white") +
  xlab(NULL) +
  theme_classic() +
  scale_fill_manual(values = colors)

plot_1

# save
# ggsave(ggsave("../../figures/Barplots/plot_1_varATS_stacked_bar_plot.pdf", plot_1, width = 6, height = 4, dpi = 300))

# Pie chart for varATS data

pie_1 <- ggplot(df_varATS, aes(x = "", y = proportion, fill = category)) +
  geom_bar(stat = "identity", width = 1, color = "black", size = 0.5) +
  labs(fill = "varATS Result") +
  geom_text(aes(label = paste0(round(proportion, 1), "%", " (n=", counts, ")")),
            position = position_stack(vjust = 0.6), size = 2.2, color = "white") +
  coord_polar(theta = "y", start = 0) +
  theme_void() +
  scale_fill_manual( values = colors) 

pie_1

# save
# ggsave("../../figures/Pie_charts/Pie_1_varATS_results.png", pie_1, width = 6, height = 4, dpi = 300)
# ggsave("../../figures/Pie_charts/Pie_1_varATS_results.pdf", pie_1, width = 6, height = 4, dpi = 300)


#####################################
####### Digital PCR data ############
#####################################

category_dPCR <-c("Low quality DNA", "Pfhrp2+/pfhrp3+",
             "Pfhrp2+/pfhrp3-", "Pfhrp2-/pfhrp3+",
             "Pfhrp2-/pfhrp3-")
counts_dPCR <- c(13, 76, 1, 0, 0)

df_digital_PCR <-data.frame(
  category = category_dPCR,
  counts = counts_dPCR,
  proportion = round(counts_dPCR / sum(counts_dPCR) * 100, 1) 
  )

df_digital_PCR <-filter(df_digital_PCR,
                        counts > 0)

##### Figures for digital PCR data #####

# Reorder the levels of the category variable based on proportion

df_digital_PCR$category <- reorder(df_digital_PCR$category, df_digital_PCR$proportion, decreasing = TRUE)

# Assign pink shades based on the reordered levels

pink_shades <- c("#c51b8a", "#fa9fb5", "#feebe2" )

# Bar Plot 2 for Digital PCR data 

plot_2 <- ggplot(df_digital_PCR, aes(x = category, y = proportion, fill = category)) +
  geom_bar(stat = "identity", color = "black", size = 0.5) +
  labs(y = "Proportion (%)") +
  theme_classic() +
  scale_fill_manual(values = pink_shades) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1),
        panel.background = element_rect(fill = "transparent", color = NA),
        plot.background = element_rect(fill = "transparent", color = NA),
        legend.position = "none") +
  geom_text(aes(label = paste0(round(proportion, 1), "%")), vjust = -0.5, size = 2.5) +
  xlab(NULL)

plot_2

# save
# ggsave("../../figures/Barplots/Plot_2_dPCR_results.pdf", plot_2, width = 6, height = 4, dpi = 300)


# Pie Chart 2 for Digital PCR data 

# Calculate label positions for digital PCR data pie chart
df_digital_PCR<- df_digital_PCR %>%
  arrange(desc(category)) %>%
  mutate(ypos = cumsum(proportion) - 0.5 * proportion)

# Calculate positions for labels outside the pie chart
label_positions <- df_digital_PCR$ypos

# Create the pie chart 
pie_2 <- ggplot(df_digital_PCR, aes(x = "", y = proportion, fill = category)) +
  geom_bar(stat = "identity", width = 1, color = "black", size = 0.5) +
  labs(fill = "Digital PCR Result") +
  coord_polar(theta = "y", start = 0) +
  theme_void() +
  scale_fill_manual(values = pink_shades) +
  geom_segment(aes(x = 1.5, y = ypos, xend = 1.9, yend = ypos), color = "black", size = 0.3, data = df_digital_PCR) +
  geom_text(aes(x = 2, y = label_positions, label = paste0(round(proportion, 1), "%", " (n=", counts, ")")),
            size = 3, nudge_x = 0.2, nudge_y = 0.2)
pie_2

#save
# ggsave("../../figures/Pie_charts/Pie_2_digital_PCR_results.pdf",width = 6, height = 4, dpi = 300 )


#####################################
####### Species PCR data ############
#####################################

category_Sp_PCR <-c("Negative", "P. ovale", "P. malariae", 
                    "P. falciparum", "P. vivax", "P. falciparum/P. malariae",
                    "P. falciparum/P. malariae/P. ovale")
counts_Sp_PCR <-c(31, 16, 13, 8, 0, 6, 2)

df_Sp_PCR <-data.frame(
  category = category_Sp_PCR,
  counts = counts_Sp_PCR,
  proportion = round(counts_Sp_PCR / sum(counts_Sp_PCR) * 100, 1) )

df_Sp_PCR <- filter(df_Sp_PCR, counts > 0)

# Reorder the levels of the category variable based on proportion

df_Sp_PCR$category <- reorder(df_Sp_PCR$category, df_Sp_PCR$proportion, decreasing = TRUE)

##### Figures for Species PCR data #####

# Barplot

plot_3 <-ggplot(df_Sp_PCR, aes(x = category, y = proportion, fill = category)) +
  geom_bar(stat = "identity", color = "black", size = 0.5) +
  labs(y = "Proportion (%)") +
  theme_classic() +
  scale_fill_manual(values = rev(brewer.pal(n = length(unique(df_Sp_PCR$category)), name = "Blues")))  +
  theme(axis.text.x = element_text(angle = 45, hjust = 1),
        panel.background = element_rect(fill = "transparent", color = NA),
        plot.background = element_rect(fill = "transparent", color = NA),
        legend.position = "none") +
  geom_text(aes(label = paste0(round(proportion, 1), "%")), vjust = -0.5, size = 2.5) +
  xlab(NULL)

plot_3

# save
# ggsave("../../figures/Barplots/Plot_3_Sp_PCR.pdf", plot_3, width = 6, height = 4, dpi = 300)

# Pie Chart for Species PCR 

# Calculate label positions for Sp_PCR pie chart
df_Sp_PCR <- df_Sp_PCR %>%
  arrange(desc(category)) %>%
  mutate(ypos = cumsum(proportion) - 0.5 * proportion)

# Calculate positions for labels outside the pie chart
label_positions <- df_Sp_PCR$ypos

# Create the pie chart for Sp_PCR
pie_3 <- ggplot(df_Sp_PCR, aes(x = "", y = proportion, fill = category)) +
  geom_bar(stat = "identity", width = 1, color = "black", size = 0.5) +
  labs(fill = "Species PCR result") +
  coord_polar(theta = "y", start = 0) +
  theme_void() +
  scale_fill_manual(values = rev(brewer.pal(n = length(unique(df_Sp_PCR$category)), name = "Blues"))) +
  geom_segment(aes(x = 1.5, y = ypos, xend = 1.9, yend = ypos), color = "black", size = 0.3, data = df_Sp_PCR) +
  geom_text(aes(x = 2, y = label_positions, label = paste0(round(proportion, 1), "%", " (n=", counts, ")")),
            size = 3, nudge_x = 0.2, nudge_y = 0.2)
pie_3

#Save
# ggsave("../../figures/Pie_charts/Pie_chart_3_Sp_PCR.pdf", pie_3, width = 6, height = 4, dpi = 300)

