# Data Analysis with Stata
### This project seeks to estimate the Cobb Douglas’ production function for formal firms using the Annual
Survey of Industries for the years 2016 - 2017.

## Data Set(s) Used
### Annual Survey of Industries 2016 - 2017.

## SoftWare Used
### STATA

## The Annual Survey of Industries for the years 2016 - 2017, just like other years, is divided into blocks
with each of them comprising questions relating to the same topic. For instance, block D of the
questionnaire prompted for data relating to working capital and loans. The data for the different blocks
were downloaded separately and then merged together to make an overall consolidated file over the
primary key; Schedule Dispatch Number (DSL No). Before merging, some variables were reshaped as
there were duplicate data in the observations. They were changed from long format to wide to ensure that
no data was being repeated.
After this was completed, the variables were then arranged in alphabetical order for easy lookup when
necessary. Upon review of some literatures that have worked with similar dataset to deduce Cobb
Douglas’ function for firms ( Rationale for Variables + Literature Reviews ), the variables for capital,
labour and output were decided.
For capital, the fixed capital data which were recorded under “C_178” (after merging) were used. The
“J1712” data computing Gross Output were used for our Output variable and the Employees column
(E159) recorded the data used for Labour.
To compute the regression, the logarithms of the chosen variable were generated under new variables so
that we could have a linear graph. Also accounting for control variable, the records for expenses on
research and development were taken. The equation for the regression model is given below:

> logOutput = AlogCapital + BlogLabour + ClogRD + K

with A, B and C being coefficients, logRD being the logarithm of the values of Research and
Development and K being a constant (y-intercept).


## Inference from Data Analysis
> logOutput = 4.576799 + 0.407419logCapital + 0.6425619logLabour + 0.0407316logRD

### This equation infers that, holding all other factors constant, for a unit increase in logCapital, logOutput
increases by a factor of 0.407419. The same logic could be extrapolated to the other variables.
Since our p-value (0.0000) is lesser than the alpha value of 0.05 (as we are working with a 95%
confidence interval), the capital, labour and amount invested in research and development variables affect
the output of a firm.
