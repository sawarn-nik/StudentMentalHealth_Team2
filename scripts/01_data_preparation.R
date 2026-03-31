############################################################
# STEP 1: LOAD LIBRARIES
############################################################

library(tidyverse)
library(caret)
library(corrplot)
library(cluster)
library(arules)
library(arulesViz)
library(rpart)
library(e1071)
library(caTools)
library(reshape2)
library(readxl)

############################################################
# STEP 2: EXTRACT DATA
############################################################

data <- read_excel("C:/Users/sirap/OneDrive/Desktop/Sem-6/Data Mining/students_mental_health_survey.xlsx")

head(data)
str(data)
summary(data)
colnames(data)

############################################################
# STEP 3: DATA CLEANING
############################################################

data <- distinct(data)

colSums(is.na(data))

missing_values <- colSums(is.na(data))

barplot(
  missing_values,
  main = "Missing Values in Dataset",
  ylab = "Count"
)

numeric_cols <- sapply(data, is.numeric)

for (col in names(data[numeric_cols])) {
  data[[col]][is.na(data[[col]])] <- median(data[[col]], na.rm = TRUE)
}

categorical_cols <- c(
  "Gender",
  "Course",
  "Sleep_Quality",
  "Physical_Activity",
  "Diet_Quality",
  "Family_History",
  "Chronic_Illness"
)

data[categorical_cols] <- lapply(data[categorical_cols], as.factor)

############################################################
# STEP 4: NOISE REMOVAL (OUTLIERS)
############################################################

remove_outliers <- function(df, column) {

  boxplot(
    df[[column]],
    main = paste("Outliers in", column)
  )

  Q1 <- quantile(df[[column]], 0.25)
  Q3 <- quantile(df[[column]], 0.75)
  IQR_val <- Q3 - Q1

  lower <- Q1 - 1.5 * IQR_val
  upper <- Q3 + 1.5 * IQR_val

  outlier_values <- df[[column]][
    df[[column]] < lower |
      df[[column]] > upper
  ]

  cat("\nOutlier values in", column, ":\n")
  print(outlier_values)

  cat("Number of outliers:", length(outlier_values), "\n")

  cleaned_df <- df %>%
    filter(
      df[[column]] >= lower &
        df[[column]] <= upper
    )

  return(cleaned_df)
}

data <- remove_outliers(data, "Stress_Level")
data <- remove_outliers(data, "Depression_Score")
data <- remove_outliers(data, "Anxiety_Score")

############################################################
# STEP 5: SMOOTHING + DISCRETIZATION
############################################################

data$Stress_Category <- cut(
  data$Stress_Level,
  breaks = c(0, 2, 4, 5),
  labels = c("Low", "Medium", "High")
)

data$Depression_Category <- cut(
  data$Depression_Score,
  breaks = c(0, 2, 4, 5),
  labels = c("Low", "Medium", "High")
)

############################################################
# STEP 6: FEATURE ENGINEERING
############################################################

data$Risk_Category <- ifelse(
  data$Stress_Level >= 3 &
    data$Depression_Score >= 3 &
    data$Anxiety_Score >= 3,
  "High",
  ifelse(
    data$Stress_Level >= 2 |
      data$Depression_Score >= 2 |
      data$Anxiety_Score >= 2,
    "Medium",
    "Low"
  )
)

data$Risk_Category <- as.factor(data$Risk_Category)

table(data$Risk_Category)

############################################################
# STEP 7: SAMPLING
############################################################

set.seed(123)
sample_data <- sample_frac(data, 0.8)