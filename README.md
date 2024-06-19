# The Consequences of Bullying Victimization on Health and Psychosocial Outcomes - Reduced-form analyses

This codes is to perform a set of reduced-form regressions (standard ordinary least squares (OLS) and logistic regressions) to 
provide preliminary evidence and discuss problems of measurement errors and endogeneity in this conventional approach 
that motivate my emperical strategy.

I conduct OLS and logistic analyses and 100 bootstrap replications of the entire estimation process to calculate standard errors 
and report the results in Latex format.

1. The file "Estimate_RF.m" conducts OLS and logistic regressions.

2. The file  "Output.m" creates the tables of the results from 100 bootstrap replications. This file calls the function "RFallcoefficients.m" and "RFviccoefficients.m"

3. The files "Outcome_Coefficientsrfall.m" and "Outcome_Coefficientsrfvic.m" create latex tables.

4. You need to change the directories to your own specifications in order to run the files.

5. Data: Young Lives.mat is the cleaned dataset created from the Young Lives surveys - a 20-year longitudinal study of childhood poverty and transitions to adulthood that
tracks two cohorts of children from four countries: Ethiopia, India, Peru and Viet Nam.
