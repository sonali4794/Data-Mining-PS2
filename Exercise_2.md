## Problem 1: visualization

![](Exercise_2_files/figure-markdown_strict/unnamed-chunk-1-1.png)

![](Exercise_2_files/figure-markdown_strict/unnamed-chunk-2-1.png)

## Problem 2: Saratoga house prices

<table>
<thead>
<tr class="header">
<th style="text-align: left;"></th>
<th style="text-align: right;">RMSE</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: left;">Medium Model</td>
<td style="text-align: right;">65864.06</td>
</tr>
<tr class="even">
<td style="text-align: left;">Linear Model</td>
<td style="text-align: right;">59705.98</td>
</tr>
<tr class="odd">
<td style="text-align: left;">KNN Model</td>
<td style="text-align: right;">61377.73</td>
</tr>
</tbody>
</table>

Clearly Linear model is doing better than the other two models

Summary of the linear regression model is:

    ## 
    ## Call:
    ## lm(formula = price ~ . - pctCollege - sewer - waterfront - newConstruction, 
    ##     data = ., use.all = FALSE)
    ## 
    ## Residuals:
    ##     Min      1Q  Median      3Q     Max 
    ## -226987  -36375   -5747   28596  453437 
    ## 
    ## Coefficients:
    ##                        Estimate Std. Error t value Pr(>|t|)    
    ## (Intercept)            221507.6     2780.3  79.670  < 2e-16 ***
    ## lotSize                  5827.1     1555.4   3.746 0.000186 ***
    ## age                     -1712.6     1777.1  -0.964 0.335341    
    ## landValue               32590.9     1680.9  19.389  < 2e-16 ***
    ## livingArea              42457.4     3006.1  14.124  < 2e-16 ***
    ## bedrooms                -7656.3     2226.7  -3.438 0.000600 ***
    ## fireplaces                803.6     1736.0   0.463 0.643485    
    ## bathrooms               15516.9     2347.9   6.609 5.23e-11 ***
    ## rooms                    6051.1     2369.6   2.554 0.010753 *  
    ## heatinghot water/steam  -8826.3     4413.3  -2.000 0.045673 *  
    ## heatingelectric          3394.0    13324.3   0.255 0.798971    
    ## fuelelectric           -11240.7    13119.0  -0.857 0.391665    
    ## fueloil                   565.4     5026.1   0.112 0.910450    
    ## centralAirNo           -10482.1     3631.0  -2.887 0.003943 ** 
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Residual standard error: 60400 on 1627 degrees of freedom
    ## Multiple R-squared:  0.6345, Adjusted R-squared:  0.6315 
    ## F-statistic: 217.2 on 13 and 1627 DF,  p-value: < 2.2e-16

Linear model that considers all predictors except pctCollege, sewer,
waterfront, newConstruction. We have used stepwise regression in both
the direction to determine the appropriate set of variables to be
included. Performance of linear and KNN model is very close however, we
go ahead with the linear model. In the regression, fireplaces, age,
heatingelectric, fuelelectric and fueloil have become insignificant.
Lotsize, landvalue, livingarea, bedrooms and bathrooms turn out to be
highly significant in deterring the price. Overall, the model has a
decent value of R-squared of 62%. P-value is also quite low giving us
faith in the model.

## Problem 3: Classification and retrospective sampling

![](Exercise_2_files/figure-markdown_strict/unnamed-chunk-5-1.png)

Summary of logit regression

    ##         (Intercept)            duration              amount         installment 
    ##               -1.01                0.04                0.00                0.32 
    ##                 age         historypoor     historyterrible          purposeedu 
    ##               -0.02               -1.12               -1.86                0.66 
    ## purposegoods/repair       purposenewcar      purposeusedcar       foreigngerman 
    ##               -0.12                0.57               -0.90               -1.34

<table>
<thead>
<tr class="header">
<th style="text-align: left;"></th>
<th style="text-align: right;">predicted_no_default</th>
<th style="text-align: right;">predicted_default</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: left;">actual_no_default</td>
<td style="text-align: right;">151</td>
<td style="text-align: right;">18</td>
</tr>
<tr class="even">
<td style="text-align: left;">actual_default</td>
<td style="text-align: right;">55</td>
<td style="text-align: right;">26</td>
</tr>
</tbody>
</table>

Accuracy of the model based on confusion matrix is 70.8

As per this model having terrible or poor credit history implies that
probability of default will reduce when compared to having good credit
history which is not what we see in real world. The model predicts that
poor history multiplies the odds of defaulting on loans by 0.27 and
terrible credit history changes the odds by a factor of 0.13. However,
this is when compared to the odds of defaulting for someone with good
credit history. One would expect terrible credit history is have worse
impact than poor credit history however the model suggests otherwise.
Although model has 70.4% of accuracy this is undesirable behavior.
Therefore, we will need to make changes to the model. There is a risk of
wrongly classifying some poor creditors as terrible and vice versa. This
is perhaps due to sampling error induced while case controlling. Since
the dataset is biased towards having more defaulted loans which in real
world is rare. The dataset is heavily skewed towards poor (618) and
terrible (293) credit history folks.

## Problem 4: Children and hotel reservations

![](Exercise_2_files/figure-markdown_strict/unnamed-chunk-7-1.png)

<table>
<thead>
<tr class="header">
<th style="text-align: left;"></th>
<th style="text-align: right;">Area under ROC Curves</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: left;">Baseline 1</td>
<td style="text-align: right;">0.6846554</td>
</tr>
<tr class="even">
<td style="text-align: left;">Baseline 2</td>
<td style="text-align: right;">0.8747346</td>
</tr>
<tr class="odd">
<td style="text-align: left;">Best Linear Model</td>
<td style="text-align: right;">0.8710116</td>
</tr>
<tr class="even">
<td style="text-align: left;">Stepwise linear Model</td>
<td style="text-align: right;">0.8620339</td>
</tr>
</tbody>
</table>

Baseline 2 (logit) is the best model as per AUC values

ROC curve for prediction on validation data across thresholds.
![](Exercise_2_files/figure-markdown_strict/unnamed-chunk-8-1.png)

Table summarizing the expected (predicted whether the booking will be
with a child) and actual bookings in validation data using the baseline
2 model.

<table>
<thead>
<tr class="header">
<th style="text-align: left;"></th>
<th style="text-align: left;">Expected bookings</th>
<th style="text-align: left;">Actual bookings</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: left;">Fold01</td>
<td style="text-align: left;">23</td>
<td style="text-align: left;">19</td>
</tr>
<tr class="even">
<td style="text-align: left;">Fold02</td>
<td style="text-align: left;">17</td>
<td style="text-align: left;">16</td>
</tr>
<tr class="odd">
<td style="text-align: left;">Fold03</td>
<td style="text-align: left;">20</td>
<td style="text-align: left;">14</td>
</tr>
<tr class="even">
<td style="text-align: left;">Fold04</td>
<td style="text-align: left;">24</td>
<td style="text-align: left;">31</td>
</tr>
<tr class="odd">
<td style="text-align: left;">Fold05</td>
<td style="text-align: left;">20</td>
<td style="text-align: left;">20</td>
</tr>
<tr class="even">
<td style="text-align: left;">Fold06</td>
<td style="text-align: left;">21</td>
<td style="text-align: left;">19</td>
</tr>
<tr class="odd">
<td style="text-align: left;">Fold07</td>
<td style="text-align: left;">24</td>
<td style="text-align: left;">24</td>
</tr>
<tr class="even">
<td style="text-align: left;">Fold08</td>
<td style="text-align: left;">19</td>
<td style="text-align: left;">18</td>
</tr>
<tr class="odd">
<td style="text-align: left;">Fold09</td>
<td style="text-align: left;">21</td>
<td style="text-align: left;">19</td>
</tr>
<tr class="even">
<td style="text-align: left;">Fold10</td>
<td style="text-align: left;">20</td>
<td style="text-align: left;">16</td>
</tr>
<tr class="odd">
<td style="text-align: left;">Fold11</td>
<td style="text-align: left;">21</td>
<td style="text-align: left;">27</td>
</tr>
<tr class="even">
<td style="text-align: left;">Fold12</td>
<td style="text-align: left;">23</td>
<td style="text-align: left;">19</td>
</tr>
<tr class="odd">
<td style="text-align: left;">Fold13</td>
<td style="text-align: left;">17</td>
<td style="text-align: left;">23</td>
</tr>
<tr class="even">
<td style="text-align: left;">Fold14</td>
<td style="text-align: left;">23</td>
<td style="text-align: left;">24</td>
</tr>
<tr class="odd">
<td style="text-align: left;">Fold15</td>
<td style="text-align: left;">17</td>
<td style="text-align: left;">15</td>
</tr>
<tr class="even">
<td style="text-align: left;">Fold16</td>
<td style="text-align: left;">18</td>
<td style="text-align: left;">23</td>
</tr>
<tr class="odd">
<td style="text-align: left;">Fold17</td>
<td style="text-align: left;">23</td>
<td style="text-align: left;">22</td>
</tr>
<tr class="even">
<td style="text-align: left;">Fold18</td>
<td style="text-align: left;">28</td>
<td style="text-align: left;">23</td>
</tr>
<tr class="odd">
<td style="text-align: left;">Fold19</td>
<td style="text-align: left;">18</td>
<td style="text-align: left;">13</td>
</tr>
<tr class="even">
<td style="text-align: left;">Fold20</td>
<td style="text-align: left;">21</td>
<td style="text-align: left;">17</td>
</tr>
<tr class="odd">
<td style="text-align: left;"></td>
<td style="text-align: left;">418</td>
<td style="text-align: left;">402</td>
</tr>
</tbody>
</table>

The model has done pretty well in predicting the classifier children in
the validation data.
