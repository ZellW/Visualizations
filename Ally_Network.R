if(!require(easypackages)){install.packages("easypackages")}
library(easypackages)
packages("dplyr", "tidyr", "ggplot2", "scalles", "GGally", "geomnet", "ggnetwork",
         "network", "sna", "igraph", prompt = FALSE)

file1 <- read.csv("Visualizations/data/ADSC_ManagementHierarchy2.csv", header = F, col.names = c("name1", "name2"))
file2 <- read.csv("Visualizations/data/ADSC_ManagementHierarchyVertices.csv", header = T)

MMnet <- fortify(as.edgedf(file1), file2)

ggplot(data = MMnet, aes(from_id = from_id, to_id = to_id)) +
     geom_net(aes(colour = role), layout.alg = "kamadakawai", 
              size = 2, labelon = TRUE, vjust = -0.6, ecolour = "grey60",
              directed =FALSE, fontsize = 3, ealpha = 0.5, fiteach = T) +
     # scale_colour_manual(values = c("#FF69B4", "#0099ff")) +
     xlim(c(-0.05, 1.05)) +
     theme_net() +
     theme(legend.position = "bottom")


