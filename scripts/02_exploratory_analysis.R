############################################################
# STEP 8: FULL EDA
############################################################

ggplot(data, aes(x = Age)) +
  geom_histogram(binwidth = 1) +
  ggtitle("Age Distribution")

ggplot(data, aes(x = Gender)) +
  geom_bar() +
  ggtitle("Gender Distribution")

ggplot(data, aes(x = Course)) +
  geom_bar() +
  ggtitle("Course Distribution") +
  theme(axis.text.x = element_text(angle = 45))

ggplot(data, aes(x = Stress_Level)) +
  geom_histogram(binwidth = 1) +
  ggtitle("Stress Level Distribution")

ggplot(data, aes(x = Depression_Score)) +
  geom_histogram(binwidth = 1) +
  ggtitle("Depression Distribution")

ggplot(data, aes(x = Anxiety_Score)) +
  geom_histogram(binwidth = 1) +
  ggtitle("Anxiety Distribution")

ggplot(data, aes(x = Stress_Level, y = CGPA)) +
  geom_point() +
  geom_smooth(method = "lm") +
  ggtitle("Stress vs CGPA")

ggplot(data, aes(x = Sleep_Quality, y = Depression_Score)) +
  geom_boxplot() +
  ggtitle("Sleep Quality vs Depression")

ggplot(data, aes(x = Financial_Stress, y = Anxiety_Score)) +
  geom_point() +
  ggtitle("Financial Stress vs Anxiety")

numeric_data <- data %>%
  select(
    Stress_Level,
    Depression_Score,
    Anxiety_Score,
    CGPA,
    Semester_Credit_Load
  )

cor_matrix <- cor(numeric_data)

corrplot(cor_matrix, method = "color")