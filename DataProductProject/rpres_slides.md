Body Fat Measurements for Males
========================================================
date: 18 August 2017
autosize: true

Introduction
========================================================

[Body Fat Measurements for  Males](https://pllsg.shinyapps.io/DataProductProject/) is a web-based interactive data product.

This presentation provides an overview on how this application has been built and explains the use of its two widgets :-

- Body Fat Predictor
- BMI (Body Mass Index) Calculator



Application Background
========================================================

<small>
The application was built with the aid of the following :-

**Tools/Environments Used**  
. Shiny, a web application framework for R  
. RStudio, an integrated development environment (IDE) for R  
. shinyapps.io, a cloud-based web hosting platform  

**Data**  
For building the prediction model on body fat estimation, the dataset __*"fat"*__ from __*UsingR*__ library was used. It comprises physical measurements of 252 males, including their body fat percentages.

**Prediction Model on Body Fat**  
This has been built as a simplified linear regression model using the abdomen circumferences and the associated body fat percentages of the 252 males. 
</small>


Body Fat Predictor
========================================================

<small>
This function allows the user to specify an abdomen circumference value and have the application utilise the in-built prediction model to come up with the estimated body fat percentage for the given abdomen size.

**Interactive Features**  

- plot on the right panel has interactive data points representing abdomen circumference against body fat, with colour differentiation on the weight
- slider on the left side panel for specifying abdomen circumference
- predicted body fat % is displayed accordingly on the left
- predicted data point is shown on the regression line in the plot 
</small>


BMI Calculator
========================================================

<small>
This function provides the user with the computed BMI given the specified values of height and weight.   

BMI (Body Mass Index) is a measure of body fat based on height and weight. It is measured using the standard formula of __*$weight(kg) / height^{2}(m^{2})$*__. For instance, a person with height of __*1.8m*__ and weight of __*75kg*__ would have a BMI of __*23.1*__.

**Interactive Features**  

- sliders on the left side panel for specifying height and weight
- computed BMI value displayed accordingly on the left
- BMI gauge on the right panel providing the visual representation of the computed BMI value
</small>

