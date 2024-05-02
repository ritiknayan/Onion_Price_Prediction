# Onion_price_predictor
Onion price predictor

# Introduction:
This project is made to predict onion prices with the help of python libraries and resources to be contributed in Artificial Intelligence field. We took data from data.world and data.gov.in for analysis of prices per gallon across various Indian States. This project can be implemented to various vegetables in future, But we took onion as specific vegetable as in recent years variation of Onion prices in our city "Bhopal" was variating alot.
So we came up with an idea that what if we make a project for onion price prediction, so that onions can be imported from other states which has lowest prices with harvesting months and price data. And in adverse condition like drought happen, how much storage can be kept for following months. Keeping in mind which state is producing and which is not.

# Getting Started :
This project shows variation of Onion price across various states in various months and predicts price accordingly.

## Prerequisites :
First thing first , we import our libraries and dataset and then we see the head of the data to know how the data looks like and to see the percentile’s and other key statistics.

imported data via xml files too(import xml.etree.ElementTree as et):
XML is an inherently hierarchical data format, and the most natural way to represent it is with a tree. ET has two classes for this purpose - ElementTree represents the whole XML document as a tree, and Element represents a single node in this tree. Interactions with the whole document (reading and writing to/from files) are usually done on the ElementTree level. Interactions with a single XML element and its sub-elements are done on the Element level.

## Steps Followed :
Stored data in Dataframes(pandas library) as it is better in terms of I/O speed, consumed memory and disk space.

For plotting graphs, we imported matplotlib.pyplot and for colors in it matplotlib.colors, as using colors we can visualize things efficiently and those who are not from technical background can easily relate to the data being represented.

LabelEncoder is a utility class to help normalize labels such that they contain only values between 0 and n_classes-1 and It can also be used to transform non-numerical labels (as long as they are hashable and comparable) to numerical labels. We used this to assign State codes to every state in observation.

seaborn.boxplot draws a box plot to show distributions with respect to categories. Here first visual representation is of State vs Price.

Then we plotted variation of prices with harvesting month and droughts at months across states with sns.FacetGrid as it allows us  to Multi-plot grid for plotting conditional relationships

Same was done with producing states data with the help of Facet.grid.
We then represented variety of onions across states with different colors.

# Running the tests :
We used multiple regression with the help of python to maximize efficiency. Following is the details and description of the regressions.

## Breakdown Into end to end tests and their Analysis :
For prediction of Onion Prices we used Linear Regression. It attempts to model the relationship between two variables by fitting a linear equation to observed data. One variable is considered to be an explanatory variable, and the other is considered to be a dependent variable.For example, a modeler might want to relate the weights of individuals to their heights using a linear regression model.
Before attempting to fit a linear model to observed data, a modeler should first determine whether or not there is a relationship between the variables of interest. This does not necessarily imply that one variable causes the other (for example, higher SAT scores do not cause higher college grades), but that there is some significant association between the two variables.
A scatterplot can be a helpful tool in determining the strength of the relationship between two variables. If there appears to be no association between the proposed explanatory and dependent variables (i.e., the scatterplot does not indicate any increasing or decreasing trends), then fitting a linear regression model to the data probably will not provide a useful model.
A valuable numerical measure of association between two variables is the correlation coefficient, which is a value between -1 and 1 indicating the strength of the association of the observed data for the two variables.

### Linear Regression Test :
A linear regression line has an equation of the form Y = a + bX, where X is the explanatory variable and Y is the dependent variable. The slope of the line is b, and a is the intercept (the value of y when x = 0).

### Lasso Regression Test :
Then applied Lasso regression cause og=f its following characteristics:
Lasso regression is a type of linear regression that uses shrinkage. Shrinkage is where data values are shrunk towards a central point, like the mean. The lasso procedure encourages simple, sparse models (i.e. models with fewer parameters). This particular type of regression is well-suited for models showing high levels of muticollinearity or when you want to automate certain parts of model selection, like variable selection/parameter elimination.

### Vector Regression Test :
Support Vector Regression cases is that presenting the solution by means of small subset of training points gives enormous computational advantages. Using the epsilon intensive loss function we ensure existence of the global minimum and at the same time optimization of reliable generalization bound.

# Conclusion :
An MLP can be viewed as a logistic regression classifier where the input is first transformed using a learnt non-linear transformation \Phi. This transformation projects the input data into a space where it becomes linearly separable. This intermediate layer is referred to as a hidden layer. A single hidden layer is sufficient to make MLPs a universal approximator. However we will see later on that there are substantial benefits to using many such hidden layers, i.e. the very premise of deep learning. 
                           
                                       The output of MLP is 0.9271665800675106 ie. 92.7% efficiency.

We tried to minimize error and maximize efficiency and tried to contribute in real life problems.
All advices are welcome.




