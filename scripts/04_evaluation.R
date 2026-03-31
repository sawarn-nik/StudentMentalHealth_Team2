############################################################
# STEP 12: CLASSIFICATION
############################################################

set.seed(123)

split <- sample.split(data$Risk_Category, SplitRatio = 0.7)

train <- subset(data, split == TRUE)
test <- subset(data, split == FALSE)

dt_model <- rpart(
  Risk_Category ~ Stress_Level +
    Depression_Score +
    Anxiety_Score +
    CGPA +
    Semester_Credit_Load,
  data = train,
  method = "class"
)

pred_dt <- predict(dt_model, test, type = "class")

cm <- confusionMatrix(pred_dt, test$Risk_Category)

cm

plot(dt_model)
text(dt_model)

mosaicplot(cm$table,
           main = "Confusion Matrix")

nb_model <- naiveBayes(Risk_Category ~ ., data = train)

pred_nb <- predict(nb_model, test)

confusionMatrix(pred_nb, test$Risk_Category)

svm_train <- train %>%
  select(
    Stress_Level,
    Depression_Score,
    Anxiety_Score,
    CGPA,
    Semester_Credit_Load,
    Risk_Category
  )

svm_test <- test %>%
  select(
    Stress_Level,
    Depression_Score,
    Anxiety_Score,
    CGPA,
    Semester_Credit_Load,
    Risk_Category
  )

svm_model <- svm(
  Risk_Category ~ .,
  data = svm_train
)

pred_svm <- predict(
  svm_model,
  svm_test[, -6]
)

confusionMatrix(pred_svm, svm_test$Risk_Category)