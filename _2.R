#####################################
# CREATING FIGURES FOR MANUSCRIPT #
#####################################size = 2.5, nudge_x = 1.2, direction = "y", hjust = 0, box.padding = 0.5)
pie_3
## Save pie 3
ggsave("../../figures/Pie_3.pdf", pie_3, width = 6, height = 4, dpi = 300)
# Creating the pie chart
pie_3 <- ggplot(df_Sp_PCR, aes(x = "", y = proportion, fill = Category)) +
geom_bar(stat = "identity", width = 1, color = "black", size = 0.5) +
labs(fill = "Species PCR result") +
coord_polar(theta = "y", start = 0) +
theme_void() +
scale_fill_manual(values = rev(RColorBrewer::brewer.pal(n = length(unique(df_Sp_PCR$Category)), name = "Blues"))) +
theme(panel.background = element_rect(fill = "white", color = NA),
plot.background = element_rect(fill = "white", color = NA)) +
geom_text_repel(data = df_Sp_PCR, aes(y = ypos, label = paste0(round(proportion, 1), "%", " (n=", counts, ")")),
size = 2.5, nudge_x = 1.2, direction = "y", hjust = 0, box.padding = 0.5, width = 0.5)
# Creating the pie chart
pie_3 <- ggplot(df_Sp_PCR, aes(x = "", y = proportion, fill = Category)) +
geom_bar(stat = "identity", width = 1, color = "black", size = 0.5) +
labs(fill = "Species PCR result") +
coord_polar(theta = "y", start = 0) +
theme_void() +
scale_fill_manual(values = rev(RColorBrewer::brewer.pal(n = length(unique(df_Sp_PCR$Category)), name = "Blues"))) +
theme(panel.background = element_rect(fill = "white", color = NA),
plot.background = element_rect(fill = "white", color = NA)) +
geom_text_repel(data = df_Sp_PCR, aes(y = ypos, label = paste0(round(proportion, 1), "%", " (n=", counts, ")")),
size = 2.5, nudge_x = 1.2, direction = "y", hjust = 0, box.padding = 0.5, size = 0.2)
# Creating the pie chart
pie_3 <- ggplot(df_Sp_PCR, aes(x = "", y = proportion, fill = Category)) +
geom_bar(stat = "identity", width = 1, color = "black", size = 0.2) +
labs(fill = "Species PCR result") +
coord_polar(theta = "y", start = 0) +
theme_void() +
scale_fill_manual(values = rev(RColorBrewer::brewer.pal(n = length(unique(df_Sp_PCR$Category)), name = "Blues"))) +
theme(panel.background = element_rect(fill = "white", color = NA),
plot.background = element_rect(fill = "white", color = NA)) +
geom_text_repel(data = df_Sp_PCR, aes(y = ypos, label = paste0(round(proportion, 1), "%", " (n=", counts, ")")),
size = 2.5, nudge_x = 1.2, direction = "y", hjust = 0, box.padding = 0.5)
pie_3
# Creating the pie chart
pie_3 <- ggplot(df_Sp_PCR, aes(x = "", y = proportion, fill = Category)) +
geom_bar(stat = "identity", width = 1, color = "black", size = 0.5) +
labs(fill = "Species PCR result") +
coord_polar(theta = "y", start = 0) +
theme_void() +
scale_fill_manual(values = rev(RColorBrewer::brewer.pal(n = length(unique(df_Sp_PCR$Category)), name = "Blues"))) +
theme(panel.background = element_rect(fill = "white", color = NA),
plot.background = element_rect(fill = "white", color = NA)) +
geom_text_repel(data = df_Sp_PCR, aes(y = ypos, size = 0.3, label = paste0(round(proportion, 1), "%", " (n=", counts, ")")),
size = 2.5, nudge_x = 1.2, direction = "y", hjust = 0, box.padding = 0.5)
pie_3
# Creating the pie chart
pie_3 <- ggplot(df_Sp_PCR, aes(x = "", y = proportion, fill = Category)) +
geom_bar(stat = "identity", width = 1, color = "black", size = 0.5) +
labs(fill = "Species PCR result") +
coord_polar(theta = "y", start = 0) +
theme_void() +
scale_fill_manual(values = rev(RColorBrewer::brewer.pal(n = length(unique(df_Sp_PCR$Category)), name = "Blues"))) +
theme(panel.background = element_rect(fill = "white", color = NA),
plot.background = element_rect(fill = "white", color = NA)) +
geom_text_repel(data = df_Sp_PCR, aes(y = ypos, size = 0.2, label = paste0(round(proportion, 1), "%", " (n=", counts, ")")),
size = 2.5, nudge_x = 1.2, direction = "y", hjust = 0, box.padding = 0.5)
pie_3
# Creating the pie chart
pie_3 <- ggplot(df_Sp_PCR, aes(x = "", y = proportion, fill = Category)) +
geom_bar(stat = "identity", width = 1, color = "black", size = 0.5) +
labs(fill = "Species PCR result") +
coord_polar(theta = "y", start = 0) +
theme_void() +
scale_fill_manual(values = rev(RColorBrewer::brewer.pal(n = length(unique(df_Sp_PCR$Category)), name = "Blues"))) +
theme(panel.background = element_rect(fill = "white", color = NA),
plot.background = element_rect(fill = "white", color = NA)) +
geom_segment(aes(x = 1.5, y = ypos, xend = 1.8, yend = ypos), color = "black", size = 0.3, data = df_Sp_PCR) +
geom_text_repel(data = df_Sp_PCR, aes(y = ypos, size = 0.2, label = paste0(round(proportion, 1), "%", " (n=", counts, ")")),
size = 2.5, nudge_x = 1.2, direction = "y", hjust = 0, box.padding = 0.5)
pie_3
# Creating the pie chart
pie_3 <- ggplot(df_Sp_PCR, aes(x = "", y = proportion, fill = Category)) +
geom_bar(stat = "identity", width = 1, color = "black", size = 0.5) +
labs(fill = "Species PCR result") +
coord_polar(theta = "y", start = 0) +
theme_void() +
scale_fill_manual(values = rev(RColorBrewer::brewer.pal(n = length(unique(df_Sp_PCR$Category)), name = "Blues"))) +
theme(panel.background = element_rect(fill = "white", color = NA),
plot.background = element_rect(fill = "white", color = NA)) +
geom_segment(aes(x = 1.5, y = ypos, xend = 1.8, yend = ypos), color = "black", size = 0.3, data = df_Sp_PCR)
pie_3
# Calculate positions for labels outside the pie chart
label_positions <- df_Sp_PCR$ypos
# Creating the pie chart
pie_3 <- ggplot(df_Sp_PCR, aes(x = "", y = proportion, fill = Category)) +
geom_bar(stat = "identity", width = 1, color = "black", size = 0.5) +
labs(fill = "Species PCR result") +
coord_polar(theta = "y", start = 0) +
theme_void() +
scale_fill_manual(values = rev(RColorBrewer::brewer.pal(n = length(unique(df_Sp_PCR$Category)), name = "Blues"))) +
theme(panel.background = element_rect(fill = "white", color = NA),
plot.background = element_rect(fill = "white", color = NA)) +
geom_segment(aes(x = 1.5, y = ypos, xend = 1.8, yend = ypos), color = "black", size = 0.3, data = df_Sp_PCR)
# Creating the pie chart
pie_3 <- ggplot(df_Sp_PCR, aes(x = "", y = proportion, fill = Category)) +
geom_bar(stat = "identity", width = 1, color = "black", size = 0.5) +
labs(fill = "Species PCR result") +
coord_polar(theta = "y", start = 0) +
theme_void() +
scale_fill_manual(values = rev(RColorBrewer::brewer.pal(n = length(unique(df_Sp_PCR$Category)), name = "Blues"))) +
theme(panel.background = element_rect(fill = "white", color = NA),
plot.background = element_rect(fill = "white", color = NA)) +
geom_segment(aes(x = 1.5, y = ypos, xend = 1.8, yend = ypos), color = "black", size = 0.3, data = df_Sp_PCR)
pie_3
# Creating the pie chart
pie_3 <- ggplot(df_Sp_PCR, aes(x = "", y = proportion, fill = Category)) +
geom_bar(stat = "identity", width = 1, color = "black", size = 0.5) +
labs(fill = "Species PCR result") +
coord_polar(theta = "y", start = 0) +
theme_void() +
scale_fill_manual(values = rev(RColorBrewer::brewer.pal(n = length(unique(df_Sp_PCR$Category)), name = "Blues"))) +
theme(panel.background = element_rect(fill = "white", color = NA),
plot.background = element_rect(fill = "white", color = NA)) +
geom_text_repel(aes(y = ypos, label = paste0(round(proportion, 1), "%", " (n=", counts, ")")),
size = 3, nudge_x = 1.2, direction = "y", hjust = 0, box.padding = 0.5,
data = df_Sp_PCR) +
geom_segment(aes(x = 1.5, y = ypos, xend = 1.8, yend = ypos), color = "black", size = 0.3, data = df_Sp_PCR)+
+
geom_text(aes(x = 1.8, y = label_positions, label = paste0(round(proportion, 1), "%", " (n=", counts, ")")), size = 3)
# Creating the pie chart
pie_3 <- ggplot(df_Sp_PCR, aes(x = "", y = proportion, fill = Category)) +
geom_bar(stat = "identity", width = 1, color = "black", size = 0.5) +
labs(fill = "Species PCR result") +
coord_polar(theta = "y", start = 0) +
theme_void() +
scale_fill_manual(values = rev(RColorBrewer::brewer.pal(n = length(unique(df_Sp_PCR$Category)), name = "Blues"))) +
theme(panel.background = element_rect(fill = "white", color = NA),
plot.background = element_rect(fill = "white", color = NA)) +
geom_text_repel(aes(y = ypos, label = paste0(round(proportion, 1), "%", " (n=", counts, ")")),
size = 3, nudge_x = 1.2, direction = "y", hjust = 0, box.padding = 0.5,
data = df_Sp_PCR) +
geom_segment(aes(x = 1.5, y = ypos, xend = 1.8, yend = ypos), color = "black", size = 0.3, data = df_Sp_PCR)+
geom_text(aes(x = 1.8, y = label_positions, label = paste0(round(proportion, 1), "%", " (n=", counts, ")")), size = 3)
pie_3
## Save pie 3
ggsave("../../figures/Pie_3.pdf", pie_3, width = 6, height = 4, dpi = 300)
# Creating the pie chart
pie_3 <- ggplot(df_Sp_PCR, aes(x = "", y = proportion, fill = Category)) +
geom_bar(stat = "identity", width = 1, color = "black", size = 0.5) +
labs(fill = "Species PCR result") +
coord_polar(theta = "y", start = 0) +
theme_void() +
scale_fill_manual(values = rev(RColorBrewer::brewer.pal(n = length(unique(df_Sp_PCR$Category)), name = "Blues"))) +
theme(panel.background = element_rect(fill = "white", color = NA),
plot.background = element_rect(fill = "white", color = NA)) +
# geom_text_repel(aes(y = ypos, label = paste0(round(proportion, 1), "%", " (n=", counts, ")")),
# size = 3, nudge_x = 1.2, direction = "y", hjust = 0, box.padding = 0.5,
# data = df_Sp_PCR) +
geom_segment(aes(x = 1.5, y = ypos, xend = 1.8, yend = ypos), color = "black", size = 0.3, data = df_Sp_PCR)+
geom_text(aes(x = 1.8, y = label_positions, label = paste0(round(proportion, 1), "%", " (n=", counts, ")")), size = 3)
pie_3
## Save pie 3
ggsave("../../figures/Pie_3.pdf", pie_3, width = 6, height = 4, dpi = 300)
# Calculate label positions
df_Sp_PCR <- df_Sp_PCR %>%
arrange(desc(Category)) %>%
mutate(ypos = cumsum(proportion) - 0.5 * proportion)
# Calculate positions for labels outside the pie chart
label_positions <- df_Sp_PCR$ypos
# Creating the pie chart
pie_3 <- ggplot(df_Sp_PCR, aes(x = "", y = proportion, fill = Category)) +
geom_bar(stat = "identity", width = 1, color = "black", size = 0.5) +
labs(fill = "Species PCR result") +
coord_polar(theta = "y", start = 0) +
theme_void() +
scale_fill_manual(values = rev(RColorBrewer::brewer.pal(n = length(unique(df_Sp_PCR$Category)), name = "Blues"))) +
theme(panel.background = element_rect(fill = "white", color = NA),
plot.background = element_rect(fill = "white", color = NA)) +
geom_segment(aes(x = 1.5, y = ypos, xend = 1.8, yend = ypos), color = "black", size = 0.3, data = df_Sp_PCR) +
geom_text(aes(x = 1.8, y = label_positions, label = paste0(round(proportion, 1), "%", " (n=", counts, ")")),
size = 3, nudge_x = 0.2, nudge_y = 0.2) # Adjust nudge_x and nudge_y here
# Display the plot
print(pie_3)
## Save pie 3
ggsave("../../figures/Pie_3.pdf", pie_3, width = 6, height = 4, dpi = 300)
# Creating the pie chart
pie_3 <- ggplot(df_Sp_PCR, aes(x = "", y = proportion, fill = Category)) +
geom_bar(stat = "identity", width = 1, color = "black", size = 0.5) +
labs(fill = "Species PCR result") +
coord_polar(theta = "y", start = 0) +
theme_void() +
scale_fill_manual(values = rev(RColorBrewer::brewer.pal(n = length(unique(df_Sp_PCR$Category)), name = "Blues"))) +
theme(panel.background = element_rect(fill = "white", color = NA),
plot.background = element_rect(fill = "white", color = NA)) +
geom_segment(aes(x = 1.5, y = ypos, xend = 1.8, yend = ypos), color = "black", size = 0.5, data = df_Sp_PCR) +
geom_text(aes(x = 1.8, y = label_positions, label = paste0(round(proportion, 1), "%", " (n=", counts, ")")),
size = 2.5, nudge_x = 0.3, nudge_y = 0.3) # Adjust nudge_x and nudge_y here
# Display the plot
print(pie_3)
## Save pie 3
ggsave("../../figures/Pie_3.pdf", pie_3, width = 6, height = 4, dpi = 300)
# Creating the pie chart
pie_3 <- ggplot(df_Sp_PCR, aes(x = "", y = proportion, fill = Category)) +
geom_bar(stat = "identity", width = 1, color = "black", size = 0.5) +
labs(fill = "Species PCR result") +
coord_polar(theta = "y", start = 0) +
theme_void() +
scale_fill_manual(values = rev(RColorBrewer::brewer.pal(n = length(unique(df_Sp_PCR$Category)), name = "Blues"))) +
theme(panel.background = element_rect(fill = "white", color = NA),
plot.background = element_rect(fill = "white", color = NA)) +
geom_segment(aes(x = 1.5, y = ypos, xend = 1.8, yend = ypos), color = "black", size = 0.5, data = df_Sp_PCR) +
geom_text(aes(x = 1.8, y = label_positions, label = paste0(round(proportion, 1), "%", " (n=", counts, ")")),
size = 2.5, nudge_x = 0.3, nudge_y = 0.1) # Adjust nudge_x and nudge_y here
# Display the plot
print(pie_3)
## Save pie 3
ggsave("../../figures/Pie_3.pdf", pie_3, width = 6, height = 4, dpi = 300)
# Creating the pie chart
pie_3 <- ggplot(df_Sp_PCR, aes(x = "", y = proportion, fill = Category)) +
geom_bar(stat = "identity", width = 1, color = "black", size = 0.5) +
labs(fill = "Species PCR result") +
coord_polar(theta = "y", start = 0) +
theme_void() +
scale_fill_manual(values = rev(RColorBrewer::brewer.pal(n = length(unique(df_Sp_PCR$Category)), name = "Blues"))) +
theme(panel.background = element_rect(fill = "white", color = NA),
plot.background = element_rect(fill = "white", color = NA)) +
geom_segment(aes(x = 1.5, y = ypos, xend = 1.8, yend = ypos), color = "black", size = 0.5, data = df_Sp_PCR) +
geom_text(aes(x = 1.8, y = label_positions, label = paste0(round(proportion, 1), "%", " (n=", counts, ")")),
size = 2.5, nudge_x = 0.5, nudge_y = 0.1) # Adjust nudge_x and nudge_y here
# Display the plot
print(pie_3)
# Save pie chart with white background
ggsave("../../figures/Pie_3.png", pie_3, width = 6, height = 4, dpi = 300)
## Save pie 3
ggsave("../../figures/Pie_3.pdf", pie_3, width = 6, height = 4, dpi = 300)
# Creating the pie chart
pie_3 <- ggplot(df_Sp_PCR, aes(x = "", y = proportion, fill = Category)) +
geom_bar(stat = "identity", width = 1, color = "black", size = 0.5) +
labs(fill = "Species PCR result") +
coord_polar(theta = "y", start = 0) +
theme_void() +
scale_fill_manual(values = rev(RColorBrewer::brewer.pal(n = length(unique(df_Sp_PCR$Category)), name = "Blues"))) +
theme(panel.background = element_rect(fill = "white", color = NA),
plot.background = element_rect(fill = "white", color = NA)) +
geom_segment(aes(x = 1.5, y = ypos, xend = 1.8, yend = ypos), color = "black", size = 0.5, data = df_Sp_PCR) +
geom_text(aes(x = 1.8, y = label_positions, label = paste0(round(proportion, 1), "%", " (n=", counts, ")")),
size = 2.5, nudge_x = 1.2, nudge_y = 0.1) # Adjust nudge_x and nudge_y here
# Display the plot
print(pie_3)
# Creating the pie chart
pie_3 <- ggplot(df_Sp_PCR, aes(x = "", y = proportion, fill = Category)) +
geom_bar(stat = "identity", width = 1, color = "black", size = 0.5) +
labs(fill = "Species PCR result") +
coord_polar(theta = "y", start = 0) +
theme_void() +
scale_fill_manual(values = rev(RColorBrewer::brewer.pal(n = length(unique(df_Sp_PCR$Category)), name = "Blues"))) +
theme(panel.background = element_rect(fill = "white", color = NA),
plot.background = element_rect(fill = "white", color = NA)) +
geom_segment(aes(x = 1.5, y = ypos, xend = 1.8, yend = ypos), color = "black", size = 0.5, data = df_Sp_PCR) +
geom_text(aes(x = 1.8, y = label_positions, label = paste0(round(proportion, 1), "%", " (n=", counts, ")")),
size = 2.5, nudge_x = 0.2, nudge_y = 0.1) # Adjust nudge_x and nudge_y here
# Display the plot
print(pie_3)
## Save pie 3
ggsave("../../figures/Pie_3.pdf", pie_3, width = 6, height = 4, dpi = 300)
# Creating the pie chart
pie_3 <- ggplot(df_Sp_PCR, aes(x = "", y = proportion, fill = Category)) +
geom_bar(stat = "identity", width = 1, color = "black", size = 0.5) +
labs(fill = "Species PCR result") +
coord_polar(theta = "y", start = 0) +
theme_void() +
scale_fill_manual(values = rev(RColorBrewer::brewer.pal(n = length(unique(df_Sp_PCR$Category)), name = "Blues"))) +
theme(panel.background = element_rect(fill = "white", color = NA),
plot.background = element_rect(fill = "white", color = NA)) +
geom_segment(aes(x = 1.5, y = ypos, xend = 1.8, yend = ypos), color = "black", size = 0.5, data = df_Sp_PCR) +
geom_text(aes(x = 1.8, y = label_positions, label = paste0(round(proportion, 1), "%", " (n=", counts, ")")),
size = 2.5, nudge_x = 0.2, nudge_y = 0.2) # Adjust nudge_x and nudge_y here
# Display the plot
print(pie_3)
## Save pie 3
ggsave("../../figures/Pie_3.pdf", pie_3, width = 6, height = 4, dpi = 300)
# Creating the pie chart
pie_3 <- ggplot(df_Sp_PCR, aes(x = "", y = proportion, fill = Category)) +
geom_bar(stat = "identity", width = 1, color = "black", size = 0.5) +
labs(fill = "Species PCR result") +
coord_polar(theta = "y", start = 0) +
theme_void() +
scale_fill_manual(values = rev(RColorBrewer::brewer.pal(n = length(unique(df_Sp_PCR$Category)), name = "Blues"))) +
theme(panel.background = element_rect(fill = "white", color = NA),
plot.background = element_rect(fill = "white", color = NA)) +
geom_segment(aes(x = 1.5, y = ypos, xend = 1.7, yend = ypos), color = "black", size = 0.5, data = df_Sp_PCR) +
geom_text(aes(x = 1.8, y = label_positions, label = paste0(round(proportion, 1), "%", " (n=", counts, ")")),
size = 2.5, nudge_x = 0.2, nudge_y = 0.2) # Adjust nudge_x and nudge_y here
# Display the plot
print(pie_3)
# Creating the pie chart
pie_3 <- ggplot(df_Sp_PCR, aes(x = "", y = proportion, fill = Category)) +
geom_bar(stat = "identity", width = 1, color = "black", size = 0.5) +
labs(fill = "Species PCR result") +
coord_polar(theta = "y", start = 0) +
theme_void() +
scale_fill_manual(values = rev(RColorBrewer::brewer.pal(n = length(unique(df_Sp_PCR$Category)), name = "Blues"))) +
theme(panel.background = element_rect(fill = "white", color = NA),
plot.background = element_rect(fill = "white", color = NA)) +
geom_segment(aes(x = 1.5, y = ypos, xend = 2.0, yend = ypos), color = "black", size = 0.5, data = df_Sp_PCR) +
geom_text(aes(x = 1.8, y = label_positions, label = paste0(round(proportion, 1), "%", " (n=", counts, ")")),

