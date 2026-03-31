############################################################
# STEP 9: DATA REDUCTION (PCA)
############################################################

scaled_data <- scale(data[, c(
  "Stress_Level",
  "Depression_Score",
  "Anxiety_Score",
  "CGPA",
  "Semester_Credit_Load"
)])

pca_model <- prcomp(scaled_data, center = TRUE, scale. = TRUE)

summary(pca_model)

plot(pca_model, type = "l")
biplot(pca_model)

############################################################
# STEP 13: CLUSTERING
############################################################

cluster_data <- scale(data[, c(
  "Stress_Level",
  "Depression_Score",
  "Anxiety_Score"
)])

set.seed(123)

kmeans_model <- kmeans(cluster_data, centers = 3)

plot(
  cluster_data,
  col = kmeans_model$cluster,
  pch = 19,
  main = "KMeans Clustering"
)

hc <- hclust(dist(cluster_data))

plot(hc, main = "Hierarchical Clustering Dendrogram")

############################################################
# STEP 14: ASSOCIATION RULE MINING
############################################################

data_ar <- data %>%
  mutate(
    High_Stress = ifelse(Stress_Level >= 3, "Yes", "No"),
    Poor_Sleep = ifelse(Sleep_Quality == "Poor", "Yes", "No"),
    High_Depression = ifelse(Depression_Score >= 3, "Yes", "No")
  ) %>%
  select(
    High_Stress,
    Poor_Sleep,
    High_Depression
  )

transactions <- as(data_ar, "transactions")

rules <- apriori(
  transactions,
  parameter = list(
    supp = 0.2,
    conf = 0.6
  )
)

inspect(rules)

plot(rules)