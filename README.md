# BSAN 450 - Group Assignment 1 (Spring 2025)
---

## Assignment Overview:
### Problem 1: Predicting Automobile Accident Rate
#### Data File: `highway.csv`
- **Dependent Variable:** `Rate` (accidents per million miles)
- **Independent Variables:**
  - `Len`: length of the segment in miles
  - `Adt`: average daily traffic count (thousands)
  - `Trks`: truck volume (% of total traffic)
  - `Slim`: speed limit (mph)
  - `Lwid`: lane width (feet)
  - `Shld`: width of outer shoulder (feet)
  - `Itg`: freeway type interchanges per mile
  - `Sigs`: signalized interchanges per mile
  - `Acpt`: access points per mile
  - `Lane`: total lanes in both directions
  - `Fai`: federal interstate indicator (1 = Yes, 0 = No)
  - `Pa`: principal arterial indicator (1 = Yes, 0 = No)
  - `Ma`: major arterial indicator (1 = Yes, 0 = No)

#### Tasks:
1. **Best Subset Selection:** Determine the best set of independent variables to predict `Rate`.
2. **Ridge Regression:** Develop a model using Ridge Regression.
3. **LASSO Regression:** Determine a model using LASSO.
4. **Model Evaluation:** Conduct 10-fold cross-validation on all three models.
   - Identify which model has the lowest cross-validated mean square error.
   - Perform diagnostic checks and provide comments on the best model.

---

### Problem 2: Predicting Automobile Gas Consumption
#### Data File: `gasconsumption.csv`
- **Dependent Variable:** `GPM` (gallons used per 100 miles)
- **Independent Variables:**
  - `WT`: weight of the car (1000 pounds)
  - `DIS`: engine displacement (cubic inches)
  - `NC`: number of cylinders

#### Tasks:
1. **Exploratory Analysis:**
   - Read the data into R Studio.
   - Plot scatter plots of `GPM` vs. each independent variable.
   - Comment on the relationships observed in the scatter plots.
2. **Multiple Regression Model:**
   - Estimate a multiple regression model using `WT`, `DIS`, and `NC`.
   - Print the model summary and interpret results.
3. **Hypothesis Testing:**
   - Test the null hypothesis: \( H_0: \beta_1 = \beta_2 = \beta_3 = 0 \) vs. \( H_A \): not all coefficients are zero.
   - Interpret the results.
4. **Bootstrap Estimation for NC Coefficient:**
   - Use Bootstrap to estimate the standard error and 90% confidence interval for \( \beta_3 \) (NC coefficient).
   - Provide properly formatted R code.
   - Report the standard error estimate and confidence interval.
   - Determine if \( \beta_3 \) is statistically different from 0 at a 10% significance level.

---

## Guidelines & Requirements
- **Programming Language:** R
- **Libraries to Use (if needed):** `glmnet`, `MASS`, `caret`, `ggplot2`, `boot`
- **Code Documentation:** Ensure your R scripts are well-commented.
- **Report Format:** Include plots, analysis, justifications, and interpretations.

---

## Getting Started
1. Clone this repository:
   ```bash
   git clone https://github.com/YOUR_GITHUB_USERNAME/BSAN450_GroupAssignment1.git
   ```
2. Navigate to the directory:
   ```bash
   cd BSAN450_GroupAssignment1
   ```
3. Open R Studio and load the data files:
   ```r
   highway <- read.csv("highway.csv")
   gasconsumption <- read.csv("gasconsumption.csv")
   ```
4. Follow the problem breakdown above to implement the required tasks.

---

## License
This assignment is for academic purposes ONLY. Do not distribute solutions publicly.
