## Problem 1: visualization

First Plot
![](Exercise_2_files/figure-markdown_strict/unnamed-chunk-1-1.png)
Second Plot
![](Exercise_2_files/figure-markdown_strict/unnamed-chunk-2-1.png)

## Problem 2: Saratoga house prices

<table>
<thead>
<tr class="header">
<th style="text-align: left;"></th>
<th style="text-align: right;">Model</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: left;">Medium Model</td>
<td style="text-align: right;">65644.39</td>
</tr>
<tr class="even">
<td style="text-align: left;">Linear Model</td>
<td style="text-align: right;">59317.49</td>
</tr>
<tr class="odd">
<td style="text-align: left;">KNN Model</td>
<td style="text-align: right;">60982.90</td>
</tr>
</tbody>
</table>

Summary of the linear regression model is:

    ## 
    ## Call:
    ## lm(formula = price ~ . - pctCollege - sewer - waterfront - newConstruction, 
    ##     data = ., use.all = FALSE)
    ## 
    ## Residuals:
    ##     Min      1Q  Median      3Q     Max 
    ## -227103  -35986   -6154   27528  455031 
    ## 
    ## Coefficients:
    ##                        Estimate Std. Error t value Pr(>|t|)    
    ## (Intercept)              221442       2775  79.797  < 2e-16 ***
    ## lotSize                    5344       1551   3.444 0.000587 ***
    ## age                       -1369       1782  -0.768 0.442328    
    ## landValue                 31669       1701  18.617  < 2e-16 ***
    ## livingArea                42062       2987  14.080  < 2e-16 ***
    ## bedrooms                  -7394       2226  -3.321 0.000915 ***
    ## fireplaces                 1774       1720   1.032 0.302318    
    ## bathrooms                 15041       2318   6.488 1.15e-10 ***
    ## rooms                      5821       2353   2.474 0.013478 *  
    ## heatinghot water/steam    -9704       4382  -2.214 0.026937 *  
    ## heatingelectric            1465      12679   0.116 0.908040    
    ## fuelelectric              -8394      12462  -0.674 0.500686    
    ## fueloil                    1079       4963   0.217 0.827910    
    ## centralAirNo             -10335       3610  -2.863 0.004254 ** 
    ## ---
    ## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
    ## 
    ## Residual standard error: 59900 on 1627 degrees of freedom
    ## Multiple R-squared:  0.6275, Adjusted R-squared:  0.6245 
    ## F-statistic: 210.8 on 13 and 1627 DF,  p-value: < 2.2e-16

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

    ##         (Intercept)            duration              amount         installment 
    ##               -1.01                0.03                0.00                0.24 
    ##                 age         historypoor     historyterrible          purposeedu 
    ##               -0.02               -0.90               -1.60                0.66 
    ## purposegoods/repair       purposenewcar      purposeusedcar       foreigngerman 
    ##                0.01                0.82               -0.77               -0.83

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
<td style="text-align: right;">162</td>
<td style="text-align: right;">17</td>
</tr>
<tr class="even">
<td style="text-align: left;">actual_default</td>
<td style="text-align: right;">45</td>
<td style="text-align: right;">26</td>
</tr>
</tbody>
</table>

Accuracy of the model based on confusion matrix is 75.2

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

    ##    yhat
    ## y      0    1
    ##   0 4442 3828
    ##   1  199  531

    ## [1] 55.25556

    ##    yhat
    ## y      0    1
    ##   0 8155  115
    ##   1  463  267

    ## [1] 93.57778

    ##    yhat
    ## y      0    1
    ##   0 8147  123
    ##   1  459  271

    ## [1] 93.53333

    ##    nvmax      RMSE   Rsquared       MAE      RMSESD  RsquaredSD       MAESD
    ## 1      1 0.2605441 0.08457550 0.1427579 0.009668689 0.017717416 0.005111970
    ## 2      2 0.2537805 0.13128107 0.1340426 0.010025075 0.027957091 0.005056890
    ## 3      3 0.2471871 0.17607793 0.1223947 0.011076131 0.045957825 0.005370674
    ## 4      4 0.2670219 0.03678131 0.1424885 0.013874233 0.072689986 0.012159539
    ## 5      5 0.2445366 0.19131950 0.1224767 0.018600958 0.104803832 0.014608781
    ## 6      6 0.2376209 0.23849014 0.1164694 0.011209965 0.045234961 0.005569110
    ## 7      7 0.2359414 0.24924835 0.1160634 0.010999084 0.046528082 0.005319879
    ## 8      8 0.2355586 0.25163152 0.1162096 0.010843565 0.046559378 0.005351713
    ## 9      9 0.2350399 0.25491777 0.1166189 0.010804627 0.046846306 0.005393699
    ## 10    10 0.2347581 0.25669671 0.1172467 0.010777439 0.046463380 0.005398974
    ## 11    11 0.2344455 0.25868586 0.1174285 0.010713012 0.046174424 0.005366014
    ## 12    12 0.2606907 0.07823362 0.1391268 0.014899688 0.109651238 0.011210192
    ## 13    13 0.2340176 0.26141457 0.1189634 0.010701066 0.046513743 0.005385791
    ## 14    14 0.2357326 0.25057838 0.1207207 0.015305377 0.066797883 0.008909557
    ## 15    15 0.2335263 0.26450307 0.1198103 0.010583096 0.046518243 0.005474302
    ## 16    16 0.2665173 0.04167051 0.1437268 0.009699130 0.007884505 0.005006778
    ## 17    17 0.2333651 0.26549278 0.1204022 0.010532628 0.046118238 0.005455878
    ## 18    18 0.2331836 0.26665481 0.1204088 0.010579794 0.046527711 0.005509631
    ## 19    19 0.2332294 0.26637114 0.1204136 0.010538571 0.046536032 0.005487677
    ## 20    20 0.2331968 0.26659166 0.1204480 0.010516650 0.045913274 0.005513237
    ## 21    21 0.2331820 0.26667931 0.1205287 0.010497361 0.045730849 0.005508090

    ##    nvmax
    ## 21    21

    ## Subset selection object
    ## 840 Variables  (and intercept)
    ##                                    Forced in Forced out
    ## hotelResort_Hotel                      FALSE      FALSE
    ## lead_time                              FALSE      FALSE
    ## stays_in_weekend_nights                FALSE      FALSE
    ## stays_in_week_nights                   FALSE      FALSE
    ## adults                                 FALSE      FALSE
    ## mealFB                                 FALSE      FALSE
    ## mealHB                                 FALSE      FALSE
    ## mealSC                                 FALSE      FALSE
    ## mealUndefined                          FALSE      FALSE
    ## market_segmentComplementary            FALSE      FALSE
    ## market_segmentCorporate                FALSE      FALSE
    ## market_segmentDirect                   FALSE      FALSE
    ## market_segmentGroups                   FALSE      FALSE
    ## market_segmentOffline_TA/TO            FALSE      FALSE
    ## market_segmentOnline_TA                FALSE      FALSE
    ## distribution_channelDirect             FALSE      FALSE
    ## distribution_channelGDS                FALSE      FALSE
    ## distribution_channelTA/TO              FALSE      FALSE
    ## is_repeated_guest                      FALSE      FALSE
    ## previous_cancellations                 FALSE      FALSE
    ## previous_bookings_not_canceled         FALSE      FALSE
    ## reserved_room_typeB                    FALSE      FALSE
    ## reserved_room_typeC                    FALSE      FALSE
    ## reserved_room_typeD                    FALSE      FALSE
    ## reserved_room_typeE                    FALSE      FALSE
    ## reserved_room_typeF                    FALSE      FALSE
    ## reserved_room_typeG                    FALSE      FALSE
    ## reserved_room_typeH                    FALSE      FALSE
    ## reserved_room_typeL                    FALSE      FALSE
    ## assigned_room_typeB                    FALSE      FALSE
    ## assigned_room_typeC                    FALSE      FALSE
    ## assigned_room_typeD                    FALSE      FALSE
    ## assigned_room_typeE                    FALSE      FALSE
    ## assigned_room_typeF                    FALSE      FALSE
    ## assigned_room_typeG                    FALSE      FALSE
    ## assigned_room_typeH                    FALSE      FALSE
    ## assigned_room_typeI                    FALSE      FALSE
    ## assigned_room_typeK                    FALSE      FALSE
    ## booking_changes                        FALSE      FALSE
    ## deposit_typeNon_Refund                 FALSE      FALSE
    ## deposit_typeRefundable                 FALSE      FALSE
    ## days_in_waiting_list                   FALSE      FALSE
    ## customer_typeGroup                     FALSE      FALSE
    ## customer_typeTransient                 FALSE      FALSE
    ## customer_typeTransient-Party           FALSE      FALSE
    ## average_daily_rate                     FALSE      FALSE
    ## required_car_parking_spacesparking     FALSE      FALSE
    ## total_of_special_requests              FALSE      FALSE
    ## arrival_date2015-07-02                 FALSE      FALSE
    ## arrival_date2015-07-03                 FALSE      FALSE
    ## arrival_date2015-07-04                 FALSE      FALSE
    ## arrival_date2015-07-05                 FALSE      FALSE
    ## arrival_date2015-07-06                 FALSE      FALSE
    ## arrival_date2015-07-07                 FALSE      FALSE
    ## arrival_date2015-07-08                 FALSE      FALSE
    ## arrival_date2015-07-09                 FALSE      FALSE
    ## arrival_date2015-07-10                 FALSE      FALSE
    ## arrival_date2015-07-11                 FALSE      FALSE
    ## arrival_date2015-07-12                 FALSE      FALSE
    ## arrival_date2015-07-13                 FALSE      FALSE
    ## arrival_date2015-07-14                 FALSE      FALSE
    ## arrival_date2015-07-15                 FALSE      FALSE
    ## arrival_date2015-07-16                 FALSE      FALSE
    ## arrival_date2015-07-17                 FALSE      FALSE
    ## arrival_date2015-07-18                 FALSE      FALSE
    ## arrival_date2015-07-19                 FALSE      FALSE
    ## arrival_date2015-07-20                 FALSE      FALSE
    ## arrival_date2015-07-21                 FALSE      FALSE
    ## arrival_date2015-07-22                 FALSE      FALSE
    ## arrival_date2015-07-23                 FALSE      FALSE
    ## arrival_date2015-07-24                 FALSE      FALSE
    ## arrival_date2015-07-25                 FALSE      FALSE
    ## arrival_date2015-07-26                 FALSE      FALSE
    ## arrival_date2015-07-27                 FALSE      FALSE
    ## arrival_date2015-07-28                 FALSE      FALSE
    ## arrival_date2015-07-29                 FALSE      FALSE
    ## arrival_date2015-07-30                 FALSE      FALSE
    ## arrival_date2015-07-31                 FALSE      FALSE
    ## arrival_date2015-08-01                 FALSE      FALSE
    ## arrival_date2015-08-02                 FALSE      FALSE
    ## arrival_date2015-08-03                 FALSE      FALSE
    ## arrival_date2015-08-04                 FALSE      FALSE
    ## arrival_date2015-08-05                 FALSE      FALSE
    ## arrival_date2015-08-06                 FALSE      FALSE
    ## arrival_date2015-08-07                 FALSE      FALSE
    ## arrival_date2015-08-08                 FALSE      FALSE
    ## arrival_date2015-08-09                 FALSE      FALSE
    ## arrival_date2015-08-10                 FALSE      FALSE
    ## arrival_date2015-08-11                 FALSE      FALSE
    ## arrival_date2015-08-12                 FALSE      FALSE
    ## arrival_date2015-08-13                 FALSE      FALSE
    ## arrival_date2015-08-14                 FALSE      FALSE
    ## arrival_date2015-08-15                 FALSE      FALSE
    ## arrival_date2015-08-16                 FALSE      FALSE
    ## arrival_date2015-08-17                 FALSE      FALSE
    ## arrival_date2015-08-18                 FALSE      FALSE
    ## arrival_date2015-08-19                 FALSE      FALSE
    ## arrival_date2015-08-20                 FALSE      FALSE
    ## arrival_date2015-08-21                 FALSE      FALSE
    ## arrival_date2015-08-22                 FALSE      FALSE
    ## arrival_date2015-08-23                 FALSE      FALSE
    ## arrival_date2015-08-24                 FALSE      FALSE
    ## arrival_date2015-08-25                 FALSE      FALSE
    ## arrival_date2015-08-26                 FALSE      FALSE
    ## arrival_date2015-08-27                 FALSE      FALSE
    ## arrival_date2015-08-28                 FALSE      FALSE
    ## arrival_date2015-08-29                 FALSE      FALSE
    ## arrival_date2015-08-30                 FALSE      FALSE
    ## arrival_date2015-08-31                 FALSE      FALSE
    ## arrival_date2015-09-01                 FALSE      FALSE
    ## arrival_date2015-09-02                 FALSE      FALSE
    ## arrival_date2015-09-03                 FALSE      FALSE
    ## arrival_date2015-09-04                 FALSE      FALSE
    ## arrival_date2015-09-05                 FALSE      FALSE
    ## arrival_date2015-09-06                 FALSE      FALSE
    ## arrival_date2015-09-07                 FALSE      FALSE
    ## arrival_date2015-09-08                 FALSE      FALSE
    ## arrival_date2015-09-09                 FALSE      FALSE
    ## arrival_date2015-09-10                 FALSE      FALSE
    ## arrival_date2015-09-11                 FALSE      FALSE
    ## arrival_date2015-09-12                 FALSE      FALSE
    ## arrival_date2015-09-13                 FALSE      FALSE
    ## arrival_date2015-09-14                 FALSE      FALSE
    ## arrival_date2015-09-15                 FALSE      FALSE
    ## arrival_date2015-09-16                 FALSE      FALSE
    ## arrival_date2015-09-17                 FALSE      FALSE
    ## arrival_date2015-09-18                 FALSE      FALSE
    ## arrival_date2015-09-19                 FALSE      FALSE
    ## arrival_date2015-09-20                 FALSE      FALSE
    ## arrival_date2015-09-21                 FALSE      FALSE
    ## arrival_date2015-09-22                 FALSE      FALSE
    ## arrival_date2015-09-23                 FALSE      FALSE
    ## arrival_date2015-09-24                 FALSE      FALSE
    ## arrival_date2015-09-25                 FALSE      FALSE
    ## arrival_date2015-09-26                 FALSE      FALSE
    ## arrival_date2015-09-27                 FALSE      FALSE
    ## arrival_date2015-09-28                 FALSE      FALSE
    ## arrival_date2015-09-29                 FALSE      FALSE
    ## arrival_date2015-09-30                 FALSE      FALSE
    ## arrival_date2015-10-01                 FALSE      FALSE
    ## arrival_date2015-10-02                 FALSE      FALSE
    ## arrival_date2015-10-03                 FALSE      FALSE
    ## arrival_date2015-10-04                 FALSE      FALSE
    ## arrival_date2015-10-05                 FALSE      FALSE
    ## arrival_date2015-10-06                 FALSE      FALSE
    ## arrival_date2015-10-07                 FALSE      FALSE
    ## arrival_date2015-10-08                 FALSE      FALSE
    ## arrival_date2015-10-09                 FALSE      FALSE
    ## arrival_date2015-10-10                 FALSE      FALSE
    ## arrival_date2015-10-11                 FALSE      FALSE
    ## arrival_date2015-10-12                 FALSE      FALSE
    ## arrival_date2015-10-13                 FALSE      FALSE
    ## arrival_date2015-10-14                 FALSE      FALSE
    ## arrival_date2015-10-15                 FALSE      FALSE
    ## arrival_date2015-10-16                 FALSE      FALSE
    ## arrival_date2015-10-17                 FALSE      FALSE
    ## arrival_date2015-10-18                 FALSE      FALSE
    ## arrival_date2015-10-19                 FALSE      FALSE
    ## arrival_date2015-10-20                 FALSE      FALSE
    ## arrival_date2015-10-21                 FALSE      FALSE
    ## arrival_date2015-10-22                 FALSE      FALSE
    ## arrival_date2015-10-23                 FALSE      FALSE
    ## arrival_date2015-10-24                 FALSE      FALSE
    ## arrival_date2015-10-25                 FALSE      FALSE
    ## arrival_date2015-10-26                 FALSE      FALSE
    ## arrival_date2015-10-27                 FALSE      FALSE
    ## arrival_date2015-10-28                 FALSE      FALSE
    ## arrival_date2015-10-29                 FALSE      FALSE
    ## arrival_date2015-10-30                 FALSE      FALSE
    ## arrival_date2015-10-31                 FALSE      FALSE
    ## arrival_date2015-11-01                 FALSE      FALSE
    ## arrival_date2015-11-02                 FALSE      FALSE
    ## arrival_date2015-11-03                 FALSE      FALSE
    ## arrival_date2015-11-04                 FALSE      FALSE
    ## arrival_date2015-11-05                 FALSE      FALSE
    ## arrival_date2015-11-06                 FALSE      FALSE
    ## arrival_date2015-11-07                 FALSE      FALSE
    ## arrival_date2015-11-08                 FALSE      FALSE
    ## arrival_date2015-11-09                 FALSE      FALSE
    ## arrival_date2015-11-10                 FALSE      FALSE
    ## arrival_date2015-11-11                 FALSE      FALSE
    ## arrival_date2015-11-12                 FALSE      FALSE
    ## arrival_date2015-11-13                 FALSE      FALSE
    ## arrival_date2015-11-14                 FALSE      FALSE
    ## arrival_date2015-11-15                 FALSE      FALSE
    ## arrival_date2015-11-16                 FALSE      FALSE
    ## arrival_date2015-11-17                 FALSE      FALSE
    ## arrival_date2015-11-18                 FALSE      FALSE
    ## arrival_date2015-11-19                 FALSE      FALSE
    ## arrival_date2015-11-20                 FALSE      FALSE
    ## arrival_date2015-11-21                 FALSE      FALSE
    ## arrival_date2015-11-22                 FALSE      FALSE
    ## arrival_date2015-11-23                 FALSE      FALSE
    ## arrival_date2015-11-24                 FALSE      FALSE
    ## arrival_date2015-11-25                 FALSE      FALSE
    ## arrival_date2015-11-26                 FALSE      FALSE
    ## arrival_date2015-11-27                 FALSE      FALSE
    ## arrival_date2015-11-28                 FALSE      FALSE
    ## arrival_date2015-11-29                 FALSE      FALSE
    ## arrival_date2015-11-30                 FALSE      FALSE
    ## arrival_date2015-12-01                 FALSE      FALSE
    ## arrival_date2015-12-02                 FALSE      FALSE
    ## arrival_date2015-12-03                 FALSE      FALSE
    ## arrival_date2015-12-04                 FALSE      FALSE
    ## arrival_date2015-12-05                 FALSE      FALSE
    ## arrival_date2015-12-06                 FALSE      FALSE
    ## arrival_date2015-12-07                 FALSE      FALSE
    ## arrival_date2015-12-08                 FALSE      FALSE
    ## arrival_date2015-12-09                 FALSE      FALSE
    ## arrival_date2015-12-10                 FALSE      FALSE
    ## arrival_date2015-12-11                 FALSE      FALSE
    ## arrival_date2015-12-12                 FALSE      FALSE
    ## arrival_date2015-12-13                 FALSE      FALSE
    ## arrival_date2015-12-14                 FALSE      FALSE
    ## arrival_date2015-12-15                 FALSE      FALSE
    ## arrival_date2015-12-16                 FALSE      FALSE
    ## arrival_date2015-12-17                 FALSE      FALSE
    ## arrival_date2015-12-18                 FALSE      FALSE
    ## arrival_date2015-12-19                 FALSE      FALSE
    ## arrival_date2015-12-20                 FALSE      FALSE
    ## arrival_date2015-12-21                 FALSE      FALSE
    ## arrival_date2015-12-22                 FALSE      FALSE
    ## arrival_date2015-12-23                 FALSE      FALSE
    ## arrival_date2015-12-24                 FALSE      FALSE
    ## arrival_date2015-12-25                 FALSE      FALSE
    ## arrival_date2015-12-26                 FALSE      FALSE
    ## arrival_date2015-12-27                 FALSE      FALSE
    ## arrival_date2015-12-28                 FALSE      FALSE
    ## arrival_date2015-12-29                 FALSE      FALSE
    ## arrival_date2015-12-30                 FALSE      FALSE
    ## arrival_date2015-12-31                 FALSE      FALSE
    ## arrival_date2016-01-01                 FALSE      FALSE
    ## arrival_date2016-01-02                 FALSE      FALSE
    ## arrival_date2016-01-03                 FALSE      FALSE
    ## arrival_date2016-01-04                 FALSE      FALSE
    ## arrival_date2016-01-05                 FALSE      FALSE
    ## arrival_date2016-01-06                 FALSE      FALSE
    ## arrival_date2016-01-07                 FALSE      FALSE
    ## arrival_date2016-01-08                 FALSE      FALSE
    ## arrival_date2016-01-09                 FALSE      FALSE
    ## arrival_date2016-01-10                 FALSE      FALSE
    ## arrival_date2016-01-11                 FALSE      FALSE
    ## arrival_date2016-01-12                 FALSE      FALSE
    ## arrival_date2016-01-13                 FALSE      FALSE
    ## arrival_date2016-01-14                 FALSE      FALSE
    ## arrival_date2016-01-15                 FALSE      FALSE
    ## arrival_date2016-01-16                 FALSE      FALSE
    ## arrival_date2016-01-17                 FALSE      FALSE
    ## arrival_date2016-01-18                 FALSE      FALSE
    ## arrival_date2016-01-19                 FALSE      FALSE
    ## arrival_date2016-01-20                 FALSE      FALSE
    ## arrival_date2016-01-21                 FALSE      FALSE
    ## arrival_date2016-01-22                 FALSE      FALSE
    ## arrival_date2016-01-23                 FALSE      FALSE
    ## arrival_date2016-01-24                 FALSE      FALSE
    ## arrival_date2016-01-25                 FALSE      FALSE
    ## arrival_date2016-01-26                 FALSE      FALSE
    ## arrival_date2016-01-27                 FALSE      FALSE
    ## arrival_date2016-01-28                 FALSE      FALSE
    ## arrival_date2016-01-29                 FALSE      FALSE
    ## arrival_date2016-01-30                 FALSE      FALSE
    ## arrival_date2016-01-31                 FALSE      FALSE
    ## arrival_date2016-02-01                 FALSE      FALSE
    ## arrival_date2016-02-02                 FALSE      FALSE
    ## arrival_date2016-02-03                 FALSE      FALSE
    ## arrival_date2016-02-04                 FALSE      FALSE
    ## arrival_date2016-02-05                 FALSE      FALSE
    ## arrival_date2016-02-06                 FALSE      FALSE
    ## arrival_date2016-02-07                 FALSE      FALSE
    ## arrival_date2016-02-08                 FALSE      FALSE
    ## arrival_date2016-02-09                 FALSE      FALSE
    ## arrival_date2016-02-10                 FALSE      FALSE
    ## arrival_date2016-02-11                 FALSE      FALSE
    ## arrival_date2016-02-12                 FALSE      FALSE
    ## arrival_date2016-02-13                 FALSE      FALSE
    ## arrival_date2016-02-14                 FALSE      FALSE
    ## arrival_date2016-02-15                 FALSE      FALSE
    ## arrival_date2016-02-16                 FALSE      FALSE
    ## arrival_date2016-02-17                 FALSE      FALSE
    ## arrival_date2016-02-18                 FALSE      FALSE
    ## arrival_date2016-02-19                 FALSE      FALSE
    ## arrival_date2016-02-20                 FALSE      FALSE
    ## arrival_date2016-02-21                 FALSE      FALSE
    ## arrival_date2016-02-22                 FALSE      FALSE
    ## arrival_date2016-02-23                 FALSE      FALSE
    ## arrival_date2016-02-24                 FALSE      FALSE
    ## arrival_date2016-02-25                 FALSE      FALSE
    ## arrival_date2016-02-26                 FALSE      FALSE
    ## arrival_date2016-02-27                 FALSE      FALSE
    ## arrival_date2016-02-28                 FALSE      FALSE
    ## arrival_date2016-02-29                 FALSE      FALSE
    ## arrival_date2016-03-01                 FALSE      FALSE
    ## arrival_date2016-03-02                 FALSE      FALSE
    ## arrival_date2016-03-03                 FALSE      FALSE
    ## arrival_date2016-03-04                 FALSE      FALSE
    ## arrival_date2016-03-05                 FALSE      FALSE
    ## arrival_date2016-03-06                 FALSE      FALSE
    ## arrival_date2016-03-07                 FALSE      FALSE
    ## arrival_date2016-03-08                 FALSE      FALSE
    ## arrival_date2016-03-09                 FALSE      FALSE
    ## arrival_date2016-03-10                 FALSE      FALSE
    ## arrival_date2016-03-11                 FALSE      FALSE
    ## arrival_date2016-03-12                 FALSE      FALSE
    ## arrival_date2016-03-13                 FALSE      FALSE
    ## arrival_date2016-03-14                 FALSE      FALSE
    ## arrival_date2016-03-15                 FALSE      FALSE
    ## arrival_date2016-03-16                 FALSE      FALSE
    ## arrival_date2016-03-17                 FALSE      FALSE
    ## arrival_date2016-03-18                 FALSE      FALSE
    ## arrival_date2016-03-19                 FALSE      FALSE
    ## arrival_date2016-03-20                 FALSE      FALSE
    ## arrival_date2016-03-21                 FALSE      FALSE
    ## arrival_date2016-03-22                 FALSE      FALSE
    ## arrival_date2016-03-23                 FALSE      FALSE
    ## arrival_date2016-03-24                 FALSE      FALSE
    ## arrival_date2016-03-25                 FALSE      FALSE
    ## arrival_date2016-03-26                 FALSE      FALSE
    ## arrival_date2016-03-27                 FALSE      FALSE
    ## arrival_date2016-03-28                 FALSE      FALSE
    ## arrival_date2016-03-29                 FALSE      FALSE
    ## arrival_date2016-03-30                 FALSE      FALSE
    ## arrival_date2016-03-31                 FALSE      FALSE
    ## arrival_date2016-04-01                 FALSE      FALSE
    ## arrival_date2016-04-02                 FALSE      FALSE
    ## arrival_date2016-04-03                 FALSE      FALSE
    ## arrival_date2016-04-04                 FALSE      FALSE
    ## arrival_date2016-04-05                 FALSE      FALSE
    ## arrival_date2016-04-06                 FALSE      FALSE
    ## arrival_date2016-04-07                 FALSE      FALSE
    ## arrival_date2016-04-08                 FALSE      FALSE
    ## arrival_date2016-04-09                 FALSE      FALSE
    ## arrival_date2016-04-10                 FALSE      FALSE
    ## arrival_date2016-04-11                 FALSE      FALSE
    ## arrival_date2016-04-12                 FALSE      FALSE
    ## arrival_date2016-04-13                 FALSE      FALSE
    ## arrival_date2016-04-14                 FALSE      FALSE
    ## arrival_date2016-04-15                 FALSE      FALSE
    ## arrival_date2016-04-16                 FALSE      FALSE
    ## arrival_date2016-04-17                 FALSE      FALSE
    ## arrival_date2016-04-18                 FALSE      FALSE
    ## arrival_date2016-04-19                 FALSE      FALSE
    ## arrival_date2016-04-20                 FALSE      FALSE
    ## arrival_date2016-04-21                 FALSE      FALSE
    ## arrival_date2016-04-22                 FALSE      FALSE
    ## arrival_date2016-04-23                 FALSE      FALSE
    ## arrival_date2016-04-24                 FALSE      FALSE
    ## arrival_date2016-04-25                 FALSE      FALSE
    ## arrival_date2016-04-26                 FALSE      FALSE
    ## arrival_date2016-04-27                 FALSE      FALSE
    ## arrival_date2016-04-28                 FALSE      FALSE
    ## arrival_date2016-04-29                 FALSE      FALSE
    ## arrival_date2016-04-30                 FALSE      FALSE
    ## arrival_date2016-05-01                 FALSE      FALSE
    ## arrival_date2016-05-02                 FALSE      FALSE
    ## arrival_date2016-05-03                 FALSE      FALSE
    ## arrival_date2016-05-04                 FALSE      FALSE
    ## arrival_date2016-05-05                 FALSE      FALSE
    ## arrival_date2016-05-06                 FALSE      FALSE
    ## arrival_date2016-05-07                 FALSE      FALSE
    ## arrival_date2016-05-08                 FALSE      FALSE
    ## arrival_date2016-05-09                 FALSE      FALSE
    ## arrival_date2016-05-10                 FALSE      FALSE
    ## arrival_date2016-05-11                 FALSE      FALSE
    ## arrival_date2016-05-12                 FALSE      FALSE
    ## arrival_date2016-05-13                 FALSE      FALSE
    ## arrival_date2016-05-14                 FALSE      FALSE
    ## arrival_date2016-05-15                 FALSE      FALSE
    ## arrival_date2016-05-16                 FALSE      FALSE
    ## arrival_date2016-05-17                 FALSE      FALSE
    ## arrival_date2016-05-18                 FALSE      FALSE
    ## arrival_date2016-05-19                 FALSE      FALSE
    ## arrival_date2016-05-20                 FALSE      FALSE
    ## arrival_date2016-05-21                 FALSE      FALSE
    ## arrival_date2016-05-22                 FALSE      FALSE
    ## arrival_date2016-05-23                 FALSE      FALSE
    ## arrival_date2016-05-24                 FALSE      FALSE
    ## arrival_date2016-05-25                 FALSE      FALSE
    ## arrival_date2016-05-26                 FALSE      FALSE
    ## arrival_date2016-05-27                 FALSE      FALSE
    ## arrival_date2016-05-28                 FALSE      FALSE
    ## arrival_date2016-05-29                 FALSE      FALSE
    ## arrival_date2016-05-30                 FALSE      FALSE
    ## arrival_date2016-05-31                 FALSE      FALSE
    ## arrival_date2016-06-01                 FALSE      FALSE
    ## arrival_date2016-06-02                 FALSE      FALSE
    ## arrival_date2016-06-03                 FALSE      FALSE
    ## arrival_date2016-06-04                 FALSE      FALSE
    ## arrival_date2016-06-05                 FALSE      FALSE
    ## arrival_date2016-06-06                 FALSE      FALSE
    ## arrival_date2016-06-07                 FALSE      FALSE
    ## arrival_date2016-06-08                 FALSE      FALSE
    ## arrival_date2016-06-09                 FALSE      FALSE
    ## arrival_date2016-06-10                 FALSE      FALSE
    ## arrival_date2016-06-11                 FALSE      FALSE
    ## arrival_date2016-06-12                 FALSE      FALSE
    ## arrival_date2016-06-13                 FALSE      FALSE
    ## arrival_date2016-06-14                 FALSE      FALSE
    ## arrival_date2016-06-15                 FALSE      FALSE
    ## arrival_date2016-06-16                 FALSE      FALSE
    ## arrival_date2016-06-17                 FALSE      FALSE
    ## arrival_date2016-06-18                 FALSE      FALSE
    ## arrival_date2016-06-19                 FALSE      FALSE
    ## arrival_date2016-06-20                 FALSE      FALSE
    ## arrival_date2016-06-21                 FALSE      FALSE
    ## arrival_date2016-06-22                 FALSE      FALSE
    ## arrival_date2016-06-23                 FALSE      FALSE
    ## arrival_date2016-06-24                 FALSE      FALSE
    ## arrival_date2016-06-25                 FALSE      FALSE
    ## arrival_date2016-06-26                 FALSE      FALSE
    ## arrival_date2016-06-27                 FALSE      FALSE
    ## arrival_date2016-06-28                 FALSE      FALSE
    ## arrival_date2016-06-29                 FALSE      FALSE
    ## arrival_date2016-06-30                 FALSE      FALSE
    ## arrival_date2016-07-01                 FALSE      FALSE
    ## arrival_date2016-07-02                 FALSE      FALSE
    ## arrival_date2016-07-03                 FALSE      FALSE
    ## arrival_date2016-07-04                 FALSE      FALSE
    ## arrival_date2016-07-05                 FALSE      FALSE
    ## arrival_date2016-07-06                 FALSE      FALSE
    ## arrival_date2016-07-07                 FALSE      FALSE
    ## arrival_date2016-07-08                 FALSE      FALSE
    ## arrival_date2016-07-09                 FALSE      FALSE
    ## arrival_date2016-07-10                 FALSE      FALSE
    ## arrival_date2016-07-11                 FALSE      FALSE
    ## arrival_date2016-07-12                 FALSE      FALSE
    ## arrival_date2016-07-13                 FALSE      FALSE
    ## arrival_date2016-07-14                 FALSE      FALSE
    ## arrival_date2016-07-15                 FALSE      FALSE
    ## arrival_date2016-07-16                 FALSE      FALSE
    ## arrival_date2016-07-17                 FALSE      FALSE
    ## arrival_date2016-07-18                 FALSE      FALSE
    ## arrival_date2016-07-19                 FALSE      FALSE
    ## arrival_date2016-07-20                 FALSE      FALSE
    ## arrival_date2016-07-21                 FALSE      FALSE
    ## arrival_date2016-07-22                 FALSE      FALSE
    ## arrival_date2016-07-23                 FALSE      FALSE
    ## arrival_date2016-07-24                 FALSE      FALSE
    ## arrival_date2016-07-25                 FALSE      FALSE
    ## arrival_date2016-07-26                 FALSE      FALSE
    ## arrival_date2016-07-27                 FALSE      FALSE
    ## arrival_date2016-07-28                 FALSE      FALSE
    ## arrival_date2016-07-29                 FALSE      FALSE
    ## arrival_date2016-07-30                 FALSE      FALSE
    ## arrival_date2016-07-31                 FALSE      FALSE
    ## arrival_date2016-08-01                 FALSE      FALSE
    ## arrival_date2016-08-02                 FALSE      FALSE
    ## arrival_date2016-08-03                 FALSE      FALSE
    ## arrival_date2016-08-04                 FALSE      FALSE
    ## arrival_date2016-08-05                 FALSE      FALSE
    ## arrival_date2016-08-06                 FALSE      FALSE
    ## arrival_date2016-08-07                 FALSE      FALSE
    ## arrival_date2016-08-08                 FALSE      FALSE
    ## arrival_date2016-08-09                 FALSE      FALSE
    ## arrival_date2016-08-10                 FALSE      FALSE
    ## arrival_date2016-08-11                 FALSE      FALSE
    ## arrival_date2016-08-12                 FALSE      FALSE
    ## arrival_date2016-08-13                 FALSE      FALSE
    ## arrival_date2016-08-14                 FALSE      FALSE
    ## arrival_date2016-08-15                 FALSE      FALSE
    ## arrival_date2016-08-16                 FALSE      FALSE
    ## arrival_date2016-08-17                 FALSE      FALSE
    ## arrival_date2016-08-18                 FALSE      FALSE
    ## arrival_date2016-08-19                 FALSE      FALSE
    ## arrival_date2016-08-20                 FALSE      FALSE
    ## arrival_date2016-08-21                 FALSE      FALSE
    ## arrival_date2016-08-22                 FALSE      FALSE
    ## arrival_date2016-08-23                 FALSE      FALSE
    ## arrival_date2016-08-24                 FALSE      FALSE
    ## arrival_date2016-08-25                 FALSE      FALSE
    ## arrival_date2016-08-26                 FALSE      FALSE
    ## arrival_date2016-08-27                 FALSE      FALSE
    ## arrival_date2016-08-28                 FALSE      FALSE
    ## arrival_date2016-08-29                 FALSE      FALSE
    ## arrival_date2016-08-30                 FALSE      FALSE
    ## arrival_date2016-08-31                 FALSE      FALSE
    ## arrival_date2016-09-01                 FALSE      FALSE
    ## arrival_date2016-09-02                 FALSE      FALSE
    ## arrival_date2016-09-03                 FALSE      FALSE
    ## arrival_date2016-09-04                 FALSE      FALSE
    ## arrival_date2016-09-05                 FALSE      FALSE
    ## arrival_date2016-09-06                 FALSE      FALSE
    ## arrival_date2016-09-07                 FALSE      FALSE
    ## arrival_date2016-09-08                 FALSE      FALSE
    ## arrival_date2016-09-09                 FALSE      FALSE
    ## arrival_date2016-09-10                 FALSE      FALSE
    ## arrival_date2016-09-11                 FALSE      FALSE
    ## arrival_date2016-09-12                 FALSE      FALSE
    ## arrival_date2016-09-13                 FALSE      FALSE
    ## arrival_date2016-09-14                 FALSE      FALSE
    ## arrival_date2016-09-15                 FALSE      FALSE
    ## arrival_date2016-09-16                 FALSE      FALSE
    ## arrival_date2016-09-17                 FALSE      FALSE
    ## arrival_date2016-09-18                 FALSE      FALSE
    ## arrival_date2016-09-19                 FALSE      FALSE
    ## arrival_date2016-09-20                 FALSE      FALSE
    ## arrival_date2016-09-21                 FALSE      FALSE
    ## arrival_date2016-09-22                 FALSE      FALSE
    ## arrival_date2016-09-23                 FALSE      FALSE
    ## arrival_date2016-09-24                 FALSE      FALSE
    ## arrival_date2016-09-25                 FALSE      FALSE
    ## arrival_date2016-09-26                 FALSE      FALSE
    ## arrival_date2016-09-27                 FALSE      FALSE
    ## arrival_date2016-09-28                 FALSE      FALSE
    ## arrival_date2016-09-29                 FALSE      FALSE
    ## arrival_date2016-09-30                 FALSE      FALSE
    ## arrival_date2016-10-01                 FALSE      FALSE
    ## arrival_date2016-10-02                 FALSE      FALSE
    ## arrival_date2016-10-03                 FALSE      FALSE
    ## arrival_date2016-10-04                 FALSE      FALSE
    ## arrival_date2016-10-05                 FALSE      FALSE
    ## arrival_date2016-10-06                 FALSE      FALSE
    ## arrival_date2016-10-07                 FALSE      FALSE
    ## arrival_date2016-10-08                 FALSE      FALSE
    ## arrival_date2016-10-09                 FALSE      FALSE
    ## arrival_date2016-10-10                 FALSE      FALSE
    ## arrival_date2016-10-11                 FALSE      FALSE
    ## arrival_date2016-10-12                 FALSE      FALSE
    ## arrival_date2016-10-13                 FALSE      FALSE
    ## arrival_date2016-10-14                 FALSE      FALSE
    ## arrival_date2016-10-15                 FALSE      FALSE
    ## arrival_date2016-10-16                 FALSE      FALSE
    ## arrival_date2016-10-17                 FALSE      FALSE
    ## arrival_date2016-10-18                 FALSE      FALSE
    ## arrival_date2016-10-19                 FALSE      FALSE
    ## arrival_date2016-10-20                 FALSE      FALSE
    ## arrival_date2016-10-21                 FALSE      FALSE
    ## arrival_date2016-10-22                 FALSE      FALSE
    ## arrival_date2016-10-23                 FALSE      FALSE
    ## arrival_date2016-10-24                 FALSE      FALSE
    ## arrival_date2016-10-25                 FALSE      FALSE
    ## arrival_date2016-10-26                 FALSE      FALSE
    ## arrival_date2016-10-27                 FALSE      FALSE
    ## arrival_date2016-10-28                 FALSE      FALSE
    ## arrival_date2016-10-29                 FALSE      FALSE
    ## arrival_date2016-10-30                 FALSE      FALSE
    ## arrival_date2016-10-31                 FALSE      FALSE
    ## arrival_date2016-11-01                 FALSE      FALSE
    ## arrival_date2016-11-02                 FALSE      FALSE
    ## arrival_date2016-11-03                 FALSE      FALSE
    ## arrival_date2016-11-04                 FALSE      FALSE
    ## arrival_date2016-11-05                 FALSE      FALSE
    ## arrival_date2016-11-06                 FALSE      FALSE
    ## arrival_date2016-11-07                 FALSE      FALSE
    ## arrival_date2016-11-08                 FALSE      FALSE
    ## arrival_date2016-11-09                 FALSE      FALSE
    ## arrival_date2016-11-10                 FALSE      FALSE
    ## arrival_date2016-11-11                 FALSE      FALSE
    ## arrival_date2016-11-12                 FALSE      FALSE
    ## arrival_date2016-11-13                 FALSE      FALSE
    ## arrival_date2016-11-14                 FALSE      FALSE
    ## arrival_date2016-11-15                 FALSE      FALSE
    ## arrival_date2016-11-16                 FALSE      FALSE
    ## arrival_date2016-11-17                 FALSE      FALSE
    ## arrival_date2016-11-18                 FALSE      FALSE
    ## arrival_date2016-11-19                 FALSE      FALSE
    ## arrival_date2016-11-20                 FALSE      FALSE
    ## arrival_date2016-11-21                 FALSE      FALSE
    ## arrival_date2016-11-22                 FALSE      FALSE
    ## arrival_date2016-11-23                 FALSE      FALSE
    ## arrival_date2016-11-24                 FALSE      FALSE
    ## arrival_date2016-11-25                 FALSE      FALSE
    ## arrival_date2016-11-26                 FALSE      FALSE
    ## arrival_date2016-11-27                 FALSE      FALSE
    ## arrival_date2016-11-28                 FALSE      FALSE
    ## arrival_date2016-11-29                 FALSE      FALSE
    ## arrival_date2016-11-30                 FALSE      FALSE
    ## arrival_date2016-12-01                 FALSE      FALSE
    ## arrival_date2016-12-02                 FALSE      FALSE
    ## arrival_date2016-12-03                 FALSE      FALSE
    ## arrival_date2016-12-04                 FALSE      FALSE
    ## arrival_date2016-12-05                 FALSE      FALSE
    ## arrival_date2016-12-06                 FALSE      FALSE
    ## arrival_date2016-12-07                 FALSE      FALSE
    ## arrival_date2016-12-08                 FALSE      FALSE
    ## arrival_date2016-12-09                 FALSE      FALSE
    ## arrival_date2016-12-10                 FALSE      FALSE
    ## arrival_date2016-12-11                 FALSE      FALSE
    ## arrival_date2016-12-12                 FALSE      FALSE
    ## arrival_date2016-12-13                 FALSE      FALSE
    ## arrival_date2016-12-14                 FALSE      FALSE
    ## arrival_date2016-12-15                 FALSE      FALSE
    ## arrival_date2016-12-16                 FALSE      FALSE
    ## arrival_date2016-12-17                 FALSE      FALSE
    ## arrival_date2016-12-18                 FALSE      FALSE
    ## arrival_date2016-12-19                 FALSE      FALSE
    ## arrival_date2016-12-20                 FALSE      FALSE
    ## arrival_date2016-12-21                 FALSE      FALSE
    ## arrival_date2016-12-22                 FALSE      FALSE
    ## arrival_date2016-12-23                 FALSE      FALSE
    ## arrival_date2016-12-24                 FALSE      FALSE
    ## arrival_date2016-12-25                 FALSE      FALSE
    ## arrival_date2016-12-26                 FALSE      FALSE
    ## arrival_date2016-12-27                 FALSE      FALSE
    ## arrival_date2016-12-28                 FALSE      FALSE
    ## arrival_date2016-12-29                 FALSE      FALSE
    ## arrival_date2016-12-30                 FALSE      FALSE
    ## arrival_date2016-12-31                 FALSE      FALSE
    ## arrival_date2017-01-01                 FALSE      FALSE
    ## arrival_date2017-01-02                 FALSE      FALSE
    ## arrival_date2017-01-03                 FALSE      FALSE
    ## arrival_date2017-01-04                 FALSE      FALSE
    ## arrival_date2017-01-05                 FALSE      FALSE
    ## arrival_date2017-01-06                 FALSE      FALSE
    ## arrival_date2017-01-07                 FALSE      FALSE
    ## arrival_date2017-01-08                 FALSE      FALSE
    ## arrival_date2017-01-09                 FALSE      FALSE
    ## arrival_date2017-01-10                 FALSE      FALSE
    ## arrival_date2017-01-11                 FALSE      FALSE
    ## arrival_date2017-01-12                 FALSE      FALSE
    ## arrival_date2017-01-13                 FALSE      FALSE
    ## arrival_date2017-01-14                 FALSE      FALSE
    ## arrival_date2017-01-15                 FALSE      FALSE
    ## arrival_date2017-01-16                 FALSE      FALSE
    ## arrival_date2017-01-17                 FALSE      FALSE
    ## arrival_date2017-01-18                 FALSE      FALSE
    ## arrival_date2017-01-19                 FALSE      FALSE
    ## arrival_date2017-01-20                 FALSE      FALSE
    ## arrival_date2017-01-21                 FALSE      FALSE
    ## arrival_date2017-01-22                 FALSE      FALSE
    ## arrival_date2017-01-23                 FALSE      FALSE
    ## arrival_date2017-01-24                 FALSE      FALSE
    ## arrival_date2017-01-25                 FALSE      FALSE
    ## arrival_date2017-01-26                 FALSE      FALSE
    ## arrival_date2017-01-27                 FALSE      FALSE
    ## arrival_date2017-01-28                 FALSE      FALSE
    ## arrival_date2017-01-29                 FALSE      FALSE
    ## arrival_date2017-01-30                 FALSE      FALSE
    ## arrival_date2017-01-31                 FALSE      FALSE
    ## arrival_date2017-02-01                 FALSE      FALSE
    ## arrival_date2017-02-02                 FALSE      FALSE
    ## arrival_date2017-02-03                 FALSE      FALSE
    ## arrival_date2017-02-04                 FALSE      FALSE
    ## arrival_date2017-02-05                 FALSE      FALSE
    ## arrival_date2017-02-06                 FALSE      FALSE
    ## arrival_date2017-02-07                 FALSE      FALSE
    ## arrival_date2017-02-08                 FALSE      FALSE
    ## arrival_date2017-02-09                 FALSE      FALSE
    ## arrival_date2017-02-10                 FALSE      FALSE
    ## arrival_date2017-02-11                 FALSE      FALSE
    ## arrival_date2017-02-12                 FALSE      FALSE
    ## arrival_date2017-02-13                 FALSE      FALSE
    ## arrival_date2017-02-14                 FALSE      FALSE
    ## arrival_date2017-02-15                 FALSE      FALSE
    ## arrival_date2017-02-16                 FALSE      FALSE
    ## arrival_date2017-02-17                 FALSE      FALSE
    ## arrival_date2017-02-18                 FALSE      FALSE
    ## arrival_date2017-02-19                 FALSE      FALSE
    ## arrival_date2017-02-20                 FALSE      FALSE
    ## arrival_date2017-02-21                 FALSE      FALSE
    ## arrival_date2017-02-22                 FALSE      FALSE
    ## arrival_date2017-02-23                 FALSE      FALSE
    ## arrival_date2017-02-24                 FALSE      FALSE
    ## arrival_date2017-02-25                 FALSE      FALSE
    ## arrival_date2017-02-26                 FALSE      FALSE
    ## arrival_date2017-02-27                 FALSE      FALSE
    ## arrival_date2017-02-28                 FALSE      FALSE
    ## arrival_date2017-03-01                 FALSE      FALSE
    ## arrival_date2017-03-02                 FALSE      FALSE
    ## arrival_date2017-03-03                 FALSE      FALSE
    ## arrival_date2017-03-04                 FALSE      FALSE
    ## arrival_date2017-03-05                 FALSE      FALSE
    ## arrival_date2017-03-06                 FALSE      FALSE
    ## arrival_date2017-03-07                 FALSE      FALSE
    ## arrival_date2017-03-08                 FALSE      FALSE
    ## arrival_date2017-03-09                 FALSE      FALSE
    ## arrival_date2017-03-10                 FALSE      FALSE
    ## arrival_date2017-03-11                 FALSE      FALSE
    ## arrival_date2017-03-12                 FALSE      FALSE
    ## arrival_date2017-03-13                 FALSE      FALSE
    ## arrival_date2017-03-14                 FALSE      FALSE
    ## arrival_date2017-03-15                 FALSE      FALSE
    ## arrival_date2017-03-16                 FALSE      FALSE
    ## arrival_date2017-03-17                 FALSE      FALSE
    ## arrival_date2017-03-18                 FALSE      FALSE
    ## arrival_date2017-03-19                 FALSE      FALSE
    ## arrival_date2017-03-20                 FALSE      FALSE
    ## arrival_date2017-03-21                 FALSE      FALSE
    ## arrival_date2017-03-22                 FALSE      FALSE
    ## arrival_date2017-03-23                 FALSE      FALSE
    ## arrival_date2017-03-24                 FALSE      FALSE
    ## arrival_date2017-03-25                 FALSE      FALSE
    ## arrival_date2017-03-26                 FALSE      FALSE
    ## arrival_date2017-03-27                 FALSE      FALSE
    ## arrival_date2017-03-28                 FALSE      FALSE
    ## arrival_date2017-03-29                 FALSE      FALSE
    ## arrival_date2017-03-30                 FALSE      FALSE
    ## arrival_date2017-03-31                 FALSE      FALSE
    ## arrival_date2017-04-01                 FALSE      FALSE
    ## arrival_date2017-04-02                 FALSE      FALSE
    ## arrival_date2017-04-03                 FALSE      FALSE
    ## arrival_date2017-04-04                 FALSE      FALSE
    ## arrival_date2017-04-05                 FALSE      FALSE
    ## arrival_date2017-04-06                 FALSE      FALSE
    ## arrival_date2017-04-07                 FALSE      FALSE
    ## arrival_date2017-04-08                 FALSE      FALSE
    ## arrival_date2017-04-09                 FALSE      FALSE
    ## arrival_date2017-04-10                 FALSE      FALSE
    ## arrival_date2017-04-11                 FALSE      FALSE
    ## arrival_date2017-04-12                 FALSE      FALSE
    ## arrival_date2017-04-13                 FALSE      FALSE
    ## arrival_date2017-04-14                 FALSE      FALSE
    ## arrival_date2017-04-15                 FALSE      FALSE
    ## arrival_date2017-04-16                 FALSE      FALSE
    ## arrival_date2017-04-17                 FALSE      FALSE
    ## arrival_date2017-04-18                 FALSE      FALSE
    ## arrival_date2017-04-19                 FALSE      FALSE
    ## arrival_date2017-04-20                 FALSE      FALSE
    ## arrival_date2017-04-21                 FALSE      FALSE
    ## arrival_date2017-04-22                 FALSE      FALSE
    ## arrival_date2017-04-23                 FALSE      FALSE
    ## arrival_date2017-04-24                 FALSE      FALSE
    ## arrival_date2017-04-25                 FALSE      FALSE
    ## arrival_date2017-04-26                 FALSE      FALSE
    ## arrival_date2017-04-27                 FALSE      FALSE
    ## arrival_date2017-04-28                 FALSE      FALSE
    ## arrival_date2017-04-29                 FALSE      FALSE
    ## arrival_date2017-04-30                 FALSE      FALSE
    ## arrival_date2017-05-01                 FALSE      FALSE
    ## arrival_date2017-05-02                 FALSE      FALSE
    ## arrival_date2017-05-03                 FALSE      FALSE
    ## arrival_date2017-05-04                 FALSE      FALSE
    ## arrival_date2017-05-05                 FALSE      FALSE
    ## arrival_date2017-05-06                 FALSE      FALSE
    ## arrival_date2017-05-07                 FALSE      FALSE
    ## arrival_date2017-05-08                 FALSE      FALSE
    ## arrival_date2017-05-09                 FALSE      FALSE
    ## arrival_date2017-05-10                 FALSE      FALSE
    ## arrival_date2017-05-11                 FALSE      FALSE
    ## arrival_date2017-05-12                 FALSE      FALSE
    ## arrival_date2017-05-13                 FALSE      FALSE
    ## arrival_date2017-05-14                 FALSE      FALSE
    ## arrival_date2017-05-15                 FALSE      FALSE
    ## arrival_date2017-05-16                 FALSE      FALSE
    ## arrival_date2017-05-17                 FALSE      FALSE
    ## arrival_date2017-05-18                 FALSE      FALSE
    ## arrival_date2017-05-19                 FALSE      FALSE
    ## arrival_date2017-05-20                 FALSE      FALSE
    ## arrival_date2017-05-21                 FALSE      FALSE
    ## arrival_date2017-05-22                 FALSE      FALSE
    ## arrival_date2017-05-23                 FALSE      FALSE
    ## arrival_date2017-05-24                 FALSE      FALSE
    ## arrival_date2017-05-25                 FALSE      FALSE
    ## arrival_date2017-05-26                 FALSE      FALSE
    ## arrival_date2017-05-27                 FALSE      FALSE
    ## arrival_date2017-05-28                 FALSE      FALSE
    ## arrival_date2017-05-29                 FALSE      FALSE
    ## arrival_date2017-05-30                 FALSE      FALSE
    ## arrival_date2017-05-31                 FALSE      FALSE
    ## arrival_date2017-06-01                 FALSE      FALSE
    ## arrival_date2017-06-02                 FALSE      FALSE
    ## arrival_date2017-06-03                 FALSE      FALSE
    ## arrival_date2017-06-04                 FALSE      FALSE
    ## arrival_date2017-06-05                 FALSE      FALSE
    ## arrival_date2017-06-06                 FALSE      FALSE
    ## arrival_date2017-06-07                 FALSE      FALSE
    ## arrival_date2017-06-08                 FALSE      FALSE
    ## arrival_date2017-06-09                 FALSE      FALSE
    ## arrival_date2017-06-10                 FALSE      FALSE
    ## arrival_date2017-06-11                 FALSE      FALSE
    ## arrival_date2017-06-12                 FALSE      FALSE
    ## arrival_date2017-06-13                 FALSE      FALSE
    ## arrival_date2017-06-14                 FALSE      FALSE
    ## arrival_date2017-06-15                 FALSE      FALSE
    ## arrival_date2017-06-16                 FALSE      FALSE
    ## arrival_date2017-06-17                 FALSE      FALSE
    ## arrival_date2017-06-18                 FALSE      FALSE
    ## arrival_date2017-06-19                 FALSE      FALSE
    ## arrival_date2017-06-20                 FALSE      FALSE
    ## arrival_date2017-06-21                 FALSE      FALSE
    ## arrival_date2017-06-22                 FALSE      FALSE
    ## arrival_date2017-06-23                 FALSE      FALSE
    ## arrival_date2017-06-24                 FALSE      FALSE
    ## arrival_date2017-06-25                 FALSE      FALSE
    ## arrival_date2017-06-26                 FALSE      FALSE
    ## arrival_date2017-06-27                 FALSE      FALSE
    ## arrival_date2017-06-28                 FALSE      FALSE
    ## arrival_date2017-06-29                 FALSE      FALSE
    ## arrival_date2017-06-30                 FALSE      FALSE
    ## arrival_date2017-07-01                 FALSE      FALSE
    ## arrival_date2017-07-02                 FALSE      FALSE
    ## arrival_date2017-07-03                 FALSE      FALSE
    ## arrival_date2017-07-04                 FALSE      FALSE
    ## arrival_date2017-07-05                 FALSE      FALSE
    ## arrival_date2017-07-06                 FALSE      FALSE
    ## arrival_date2017-07-07                 FALSE      FALSE
    ## arrival_date2017-07-08                 FALSE      FALSE
    ## arrival_date2017-07-09                 FALSE      FALSE
    ## arrival_date2017-07-10                 FALSE      FALSE
    ## arrival_date2017-07-11                 FALSE      FALSE
    ## arrival_date2017-07-12                 FALSE      FALSE
    ## arrival_date2017-07-13                 FALSE      FALSE
    ## arrival_date2017-07-14                 FALSE      FALSE
    ## arrival_date2017-07-15                 FALSE      FALSE
    ## arrival_date2017-07-16                 FALSE      FALSE
    ## arrival_date2017-07-17                 FALSE      FALSE
    ## arrival_date2017-07-18                 FALSE      FALSE
    ## arrival_date2017-07-19                 FALSE      FALSE
    ## arrival_date2017-07-20                 FALSE      FALSE
    ## arrival_date2017-07-21                 FALSE      FALSE
    ## arrival_date2017-07-22                 FALSE      FALSE
    ## arrival_date2017-07-23                 FALSE      FALSE
    ## arrival_date2017-07-24                 FALSE      FALSE
    ## arrival_date2017-07-25                 FALSE      FALSE
    ## arrival_date2017-07-26                 FALSE      FALSE
    ## arrival_date2017-07-27                 FALSE      FALSE
    ## arrival_date2017-07-28                 FALSE      FALSE
    ## arrival_date2017-07-29                 FALSE      FALSE
    ## arrival_date2017-07-30                 FALSE      FALSE
    ## arrival_date2017-07-31                 FALSE      FALSE
    ## arrival_date2017-08-01                 FALSE      FALSE
    ## arrival_date2017-08-02                 FALSE      FALSE
    ## arrival_date2017-08-03                 FALSE      FALSE
    ## arrival_date2017-08-04                 FALSE      FALSE
    ## arrival_date2017-08-05                 FALSE      FALSE
    ## arrival_date2017-08-06                 FALSE      FALSE
    ## arrival_date2017-08-07                 FALSE      FALSE
    ## arrival_date2017-08-08                 FALSE      FALSE
    ## arrival_date2017-08-09                 FALSE      FALSE
    ## arrival_date2017-08-10                 FALSE      FALSE
    ## arrival_date2017-08-11                 FALSE      FALSE
    ## arrival_date2017-08-12                 FALSE      FALSE
    ## arrival_date2017-08-13                 FALSE      FALSE
    ## arrival_date2017-08-14                 FALSE      FALSE
    ## arrival_date2017-08-15                 FALSE      FALSE
    ## arrival_date2017-08-16                 FALSE      FALSE
    ## arrival_date2017-08-17                 FALSE      FALSE
    ## arrival_date2017-08-18                 FALSE      FALSE
    ## arrival_date2017-08-19                 FALSE      FALSE
    ## arrival_date2017-08-20                 FALSE      FALSE
    ## arrival_date2017-08-21                 FALSE      FALSE
    ## arrival_date2017-08-22                 FALSE      FALSE
    ## arrival_date2017-08-23                 FALSE      FALSE
    ## arrival_date2017-08-24                 FALSE      FALSE
    ## arrival_date2017-08-25                 FALSE      FALSE
    ## arrival_date2017-08-26                 FALSE      FALSE
    ## arrival_date2017-08-27                 FALSE      FALSE
    ## arrival_date2017-08-28                 FALSE      FALSE
    ## arrival_date2017-08-29                 FALSE      FALSE
    ## arrival_date2017-08-30                 FALSE      FALSE
    ## arrival_date2017-08-31                 FALSE      FALSE
    ## 1 subsets of each size up to 21
    ## Selection Algorithm: 'sequential replacement'
    ##           hotelResort_Hotel lead_time stays_in_weekend_nights
    ## 1  ( 1 )  " "               " "       " "                    
    ## 2  ( 1 )  " "               " "       " "                    
    ## 3  ( 1 )  " "               " "       " "                    
    ## 4  ( 1 )  "*"               "*"       "*"                    
    ## 5  ( 1 )  " "               " "       " "                    
    ## 6  ( 1 )  " "               " "       " "                    
    ## 7  ( 1 )  " "               " "       " "                    
    ## 8  ( 1 )  " "               " "       " "                    
    ## 9  ( 1 )  " "               " "       " "                    
    ## 10  ( 1 ) " "               " "       " "                    
    ## 11  ( 1 ) " "               " "       " "                    
    ## 12  ( 1 ) "*"               "*"       "*"                    
    ## 13  ( 1 ) "*"               " "       " "                    
    ## 14  ( 1 ) "*"               " "       " "                    
    ## 15  ( 1 ) "*"               " "       " "                    
    ## 16  ( 1 ) "*"               "*"       "*"                    
    ## 17  ( 1 ) "*"               " "       " "                    
    ## 18  ( 1 ) "*"               " "       " "                    
    ## 19  ( 1 ) "*"               " "       " "                    
    ## 20  ( 1 ) "*"               " "       " "                    
    ## 21  ( 1 ) "*"               " "       " "                    
    ##           stays_in_week_nights adults mealFB mealHB mealSC mealUndefined
    ## 1  ( 1 )  " "                  " "    " "    " "    " "    " "          
    ## 2  ( 1 )  " "                  " "    " "    " "    " "    " "          
    ## 3  ( 1 )  " "                  " "    " "    " "    " "    " "          
    ## 4  ( 1 )  "*"                  " "    " "    " "    " "    " "          
    ## 5  ( 1 )  " "                  " "    " "    " "    " "    " "          
    ## 6  ( 1 )  " "                  " "    " "    " "    " "    " "          
    ## 7  ( 1 )  " "                  " "    " "    " "    " "    " "          
    ## 8  ( 1 )  " "                  " "    " "    " "    " "    " "          
    ## 9  ( 1 )  " "                  "*"    " "    " "    " "    " "          
    ## 10  ( 1 ) " "                  "*"    " "    " "    " "    " "          
    ## 11  ( 1 ) " "                  "*"    " "    " "    "*"    " "          
    ## 12  ( 1 ) "*"                  "*"    "*"    "*"    "*"    "*"          
    ## 13  ( 1 ) " "                  "*"    " "    " "    "*"    " "          
    ## 14  ( 1 ) " "                  "*"    " "    " "    "*"    " "          
    ## 15  ( 1 ) " "                  "*"    " "    " "    "*"    " "          
    ## 16  ( 1 ) "*"                  "*"    "*"    "*"    "*"    "*"          
    ## 17  ( 1 ) " "                  "*"    " "    " "    "*"    " "          
    ## 18  ( 1 ) " "                  "*"    " "    " "    "*"    " "          
    ## 19  ( 1 ) " "                  "*"    " "    " "    "*"    " "          
    ## 20  ( 1 ) " "                  "*"    " "    " "    "*"    " "          
    ## 21  ( 1 ) " "                  "*"    " "    " "    "*"    " "          
    ##           market_segmentComplementary market_segmentCorporate
    ## 1  ( 1 )  " "                         " "                    
    ## 2  ( 1 )  " "                         " "                    
    ## 3  ( 1 )  " "                         " "                    
    ## 4  ( 1 )  " "                         " "                    
    ## 5  ( 1 )  " "                         " "                    
    ## 6  ( 1 )  " "                         " "                    
    ## 7  ( 1 )  " "                         " "                    
    ## 8  ( 1 )  " "                         " "                    
    ## 9  ( 1 )  " "                         " "                    
    ## 10  ( 1 ) " "                         " "                    
    ## 11  ( 1 ) " "                         " "                    
    ## 12  ( 1 ) "*"                         "*"                    
    ## 13  ( 1 ) " "                         " "                    
    ## 14  ( 1 ) " "                         " "                    
    ## 15  ( 1 ) " "                         " "                    
    ## 16  ( 1 ) "*"                         "*"                    
    ## 17  ( 1 ) " "                         " "                    
    ## 18  ( 1 ) " "                         " "                    
    ## 19  ( 1 ) " "                         " "                    
    ## 20  ( 1 ) " "                         " "                    
    ## 21  ( 1 ) " "                         " "                    
    ##           market_segmentDirect market_segmentGroups market_segmentOffline_TA/TO
    ## 1  ( 1 )  " "                  " "                  " "                        
    ## 2  ( 1 )  " "                  " "                  " "                        
    ## 3  ( 1 )  " "                  " "                  " "                        
    ## 4  ( 1 )  " "                  " "                  " "                        
    ## 5  ( 1 )  " "                  " "                  " "                        
    ## 6  ( 1 )  " "                  " "                  " "                        
    ## 7  ( 1 )  " "                  " "                  " "                        
    ## 8  ( 1 )  " "                  " "                  " "                        
    ## 9  ( 1 )  " "                  " "                  " "                        
    ## 10  ( 1 ) " "                  " "                  " "                        
    ## 11  ( 1 ) " "                  " "                  " "                        
    ## 12  ( 1 ) "*"                  " "                  " "                        
    ## 13  ( 1 ) " "                  " "                  " "                        
    ## 14  ( 1 ) " "                  " "                  " "                        
    ## 15  ( 1 ) " "                  " "                  " "                        
    ## 16  ( 1 ) "*"                  "*"                  "*"                        
    ## 17  ( 1 ) " "                  " "                  " "                        
    ## 18  ( 1 ) " "                  " "                  " "                        
    ## 19  ( 1 ) " "                  " "                  " "                        
    ## 20  ( 1 ) " "                  " "                  " "                        
    ## 21  ( 1 ) " "                  " "                  " "                        
    ##           market_segmentOnline_TA distribution_channelDirect
    ## 1  ( 1 )  " "                     " "                       
    ## 2  ( 1 )  " "                     " "                       
    ## 3  ( 1 )  " "                     " "                       
    ## 4  ( 1 )  " "                     " "                       
    ## 5  ( 1 )  " "                     " "                       
    ## 6  ( 1 )  " "                     " "                       
    ## 7  ( 1 )  " "                     " "                       
    ## 8  ( 1 )  " "                     " "                       
    ## 9  ( 1 )  " "                     " "                       
    ## 10  ( 1 ) " "                     " "                       
    ## 11  ( 1 ) " "                     " "                       
    ## 12  ( 1 ) " "                     " "                       
    ## 13  ( 1 ) " "                     " "                       
    ## 14  ( 1 ) " "                     " "                       
    ## 15  ( 1 ) " "                     " "                       
    ## 16  ( 1 ) "*"                     "*"                       
    ## 17  ( 1 ) " "                     " "                       
    ## 18  ( 1 ) " "                     " "                       
    ## 19  ( 1 ) " "                     " "                       
    ## 20  ( 1 ) " "                     " "                       
    ## 21  ( 1 ) " "                     " "                       
    ##           distribution_channelGDS distribution_channelTA/TO is_repeated_guest
    ## 1  ( 1 )  " "                     " "                       " "              
    ## 2  ( 1 )  " "                     " "                       " "              
    ## 3  ( 1 )  " "                     " "                       " "              
    ## 4  ( 1 )  " "                     " "                       " "              
    ## 5  ( 1 )  " "                     " "                       " "              
    ## 6  ( 1 )  " "                     " "                       " "              
    ## 7  ( 1 )  " "                     " "                       " "              
    ## 8  ( 1 )  " "                     " "                       " "              
    ## 9  ( 1 )  " "                     " "                       " "              
    ## 10  ( 1 ) " "                     " "                       " "              
    ## 11  ( 1 ) " "                     " "                       " "              
    ## 12  ( 1 ) " "                     " "                       " "              
    ## 13  ( 1 ) " "                     " "                       " "              
    ## 14  ( 1 ) " "                     " "                       "*"              
    ## 15  ( 1 ) " "                     " "                       " "              
    ## 16  ( 1 ) " "                     " "                       " "              
    ## 17  ( 1 ) " "                     " "                       "*"              
    ## 18  ( 1 ) " "                     " "                       "*"              
    ## 19  ( 1 ) " "                     " "                       "*"              
    ## 20  ( 1 ) " "                     " "                       "*"              
    ## 21  ( 1 ) " "                     " "                       "*"              
    ##           previous_cancellations previous_bookings_not_canceled
    ## 1  ( 1 )  " "                    " "                           
    ## 2  ( 1 )  " "                    " "                           
    ## 3  ( 1 )  " "                    " "                           
    ## 4  ( 1 )  " "                    " "                           
    ## 5  ( 1 )  " "                    " "                           
    ## 6  ( 1 )  " "                    " "                           
    ## 7  ( 1 )  " "                    " "                           
    ## 8  ( 1 )  " "                    " "                           
    ## 9  ( 1 )  " "                    " "                           
    ## 10  ( 1 ) " "                    " "                           
    ## 11  ( 1 ) " "                    " "                           
    ## 12  ( 1 ) " "                    " "                           
    ## 13  ( 1 ) " "                    " "                           
    ## 14  ( 1 ) " "                    " "                           
    ## 15  ( 1 ) " "                    " "                           
    ## 16  ( 1 ) " "                    " "                           
    ## 17  ( 1 ) " "                    " "                           
    ## 18  ( 1 ) " "                    " "                           
    ## 19  ( 1 ) " "                    " "                           
    ## 20  ( 1 ) " "                    " "                           
    ## 21  ( 1 ) " "                    " "                           
    ##           reserved_room_typeB reserved_room_typeC reserved_room_typeD
    ## 1  ( 1 )  " "                 " "                 " "                
    ## 2  ( 1 )  " "                 " "                 " "                
    ## 3  ( 1 )  " "                 "*"                 " "                
    ## 4  ( 1 )  " "                 " "                 " "                
    ## 5  ( 1 )  " "                 "*"                 " "                
    ## 6  ( 1 )  " "                 "*"                 " "                
    ## 7  ( 1 )  "*"                 "*"                 " "                
    ## 8  ( 1 )  "*"                 "*"                 " "                
    ## 9  ( 1 )  "*"                 "*"                 " "                
    ## 10  ( 1 ) "*"                 "*"                 " "                
    ## 11  ( 1 ) "*"                 "*"                 " "                
    ## 12  ( 1 ) " "                 " "                 " "                
    ## 13  ( 1 ) "*"                 "*"                 " "                
    ## 14  ( 1 ) "*"                 "*"                 " "                
    ## 15  ( 1 ) "*"                 "*"                 "*"                
    ## 16  ( 1 ) " "                 " "                 " "                
    ## 17  ( 1 ) "*"                 "*"                 "*"                
    ## 18  ( 1 ) "*"                 "*"                 "*"                
    ## 19  ( 1 ) "*"                 "*"                 "*"                
    ## 20  ( 1 ) "*"                 "*"                 "*"                
    ## 21  ( 1 ) "*"                 "*"                 "*"                
    ##           reserved_room_typeE reserved_room_typeF reserved_room_typeG
    ## 1  ( 1 )  " "                 " "                 " "                
    ## 2  ( 1 )  " "                 " "                 "*"                
    ## 3  ( 1 )  " "                 "*"                 "*"                
    ## 4  ( 1 )  " "                 " "                 " "                
    ## 5  ( 1 )  " "                 "*"                 "*"                
    ## 6  ( 1 )  " "                 "*"                 "*"                
    ## 7  ( 1 )  " "                 "*"                 "*"                
    ## 8  ( 1 )  " "                 "*"                 "*"                
    ## 9  ( 1 )  " "                 "*"                 "*"                
    ## 10  ( 1 ) " "                 "*"                 "*"                
    ## 11  ( 1 ) " "                 "*"                 "*"                
    ## 12  ( 1 ) " "                 " "                 " "                
    ## 13  ( 1 ) " "                 "*"                 "*"                
    ## 14  ( 1 ) " "                 "*"                 "*"                
    ## 15  ( 1 ) " "                 "*"                 "*"                
    ## 16  ( 1 ) " "                 " "                 " "                
    ## 17  ( 1 ) " "                 "*"                 "*"                
    ## 18  ( 1 ) " "                 "*"                 "*"                
    ## 19  ( 1 ) " "                 "*"                 "*"                
    ## 20  ( 1 ) " "                 "*"                 "*"                
    ## 21  ( 1 ) " "                 "*"                 "*"                
    ##           reserved_room_typeH reserved_room_typeL assigned_room_typeB
    ## 1  ( 1 )  " "                 " "                 " "                
    ## 2  ( 1 )  " "                 " "                 " "                
    ## 3  ( 1 )  " "                 " "                 " "                
    ## 4  ( 1 )  " "                 " "                 " "                
    ## 5  ( 1 )  "*"                 " "                 " "                
    ## 6  ( 1 )  "*"                 " "                 " "                
    ## 7  ( 1 )  "*"                 " "                 " "                
    ## 8  ( 1 )  "*"                 " "                 " "                
    ## 9  ( 1 )  "*"                 " "                 " "                
    ## 10  ( 1 ) "*"                 " "                 " "                
    ## 11  ( 1 ) "*"                 " "                 " "                
    ## 12  ( 1 ) " "                 " "                 " "                
    ## 13  ( 1 ) "*"                 " "                 " "                
    ## 14  ( 1 ) "*"                 " "                 " "                
    ## 15  ( 1 ) "*"                 " "                 " "                
    ## 16  ( 1 ) " "                 " "                 " "                
    ## 17  ( 1 ) "*"                 " "                 " "                
    ## 18  ( 1 ) "*"                 " "                 " "                
    ## 19  ( 1 ) "*"                 " "                 " "                
    ## 20  ( 1 ) "*"                 " "                 " "                
    ## 21  ( 1 ) "*"                 " "                 " "                
    ##           assigned_room_typeC assigned_room_typeD assigned_room_typeE
    ## 1  ( 1 )  " "                 " "                 " "                
    ## 2  ( 1 )  " "                 " "                 " "                
    ## 3  ( 1 )  " "                 " "                 " "                
    ## 4  ( 1 )  " "                 " "                 " "                
    ## 5  ( 1 )  " "                 " "                 " "                
    ## 6  ( 1 )  " "                 " "                 " "                
    ## 7  ( 1 )  " "                 " "                 " "                
    ## 8  ( 1 )  " "                 " "                 " "                
    ## 9  ( 1 )  " "                 " "                 " "                
    ## 10  ( 1 ) " "                 " "                 " "                
    ## 11  ( 1 ) " "                 " "                 " "                
    ## 12  ( 1 ) " "                 " "                 " "                
    ## 13  ( 1 ) "*"                 " "                 " "                
    ## 14  ( 1 ) "*"                 " "                 " "                
    ## 15  ( 1 ) "*"                 "*"                 " "                
    ## 16  ( 1 ) " "                 " "                 " "                
    ## 17  ( 1 ) "*"                 "*"                 "*"                
    ## 18  ( 1 ) "*"                 "*"                 "*"                
    ## 19  ( 1 ) "*"                 "*"                 "*"                
    ## 20  ( 1 ) "*"                 "*"                 "*"                
    ## 21  ( 1 ) "*"                 "*"                 "*"                
    ##           assigned_room_typeF assigned_room_typeG assigned_room_typeH
    ## 1  ( 1 )  " "                 " "                 " "                
    ## 2  ( 1 )  " "                 " "                 " "                
    ## 3  ( 1 )  " "                 " "                 " "                
    ## 4  ( 1 )  " "                 " "                 " "                
    ## 5  ( 1 )  " "                 " "                 " "                
    ## 6  ( 1 )  " "                 " "                 " "                
    ## 7  ( 1 )  " "                 " "                 " "                
    ## 8  ( 1 )  " "                 " "                 " "                
    ## 9  ( 1 )  " "                 " "                 " "                
    ## 10  ( 1 ) " "                 " "                 " "                
    ## 11  ( 1 ) " "                 " "                 " "                
    ## 12  ( 1 ) " "                 " "                 " "                
    ## 13  ( 1 ) " "                 " "                 " "                
    ## 14  ( 1 ) " "                 " "                 " "                
    ## 15  ( 1 ) " "                 " "                 " "                
    ## 16  ( 1 ) " "                 " "                 " "                
    ## 17  ( 1 ) " "                 " "                 " "                
    ## 18  ( 1 ) " "                 "*"                 " "                
    ## 19  ( 1 ) " "                 "*"                 " "                
    ## 20  ( 1 ) " "                 "*"                 " "                
    ## 21  ( 1 ) " "                 "*"                 " "                
    ##           assigned_room_typeI assigned_room_typeK booking_changes
    ## 1  ( 1 )  " "                 " "                 " "            
    ## 2  ( 1 )  " "                 " "                 " "            
    ## 3  ( 1 )  " "                 " "                 " "            
    ## 4  ( 1 )  " "                 " "                 " "            
    ## 5  ( 1 )  " "                 " "                 " "            
    ## 6  ( 1 )  " "                 " "                 " "            
    ## 7  ( 1 )  " "                 " "                 " "            
    ## 8  ( 1 )  " "                 " "                 "*"            
    ## 9  ( 1 )  " "                 " "                 "*"            
    ## 10  ( 1 ) " "                 " "                 "*"            
    ## 11  ( 1 ) " "                 " "                 "*"            
    ## 12  ( 1 ) " "                 " "                 " "            
    ## 13  ( 1 ) " "                 " "                 "*"            
    ## 14  ( 1 ) " "                 " "                 "*"            
    ## 15  ( 1 ) " "                 " "                 "*"            
    ## 16  ( 1 ) " "                 " "                 " "            
    ## 17  ( 1 ) " "                 " "                 "*"            
    ## 18  ( 1 ) " "                 " "                 "*"            
    ## 19  ( 1 ) " "                 " "                 "*"            
    ## 20  ( 1 ) " "                 " "                 "*"            
    ## 21  ( 1 ) " "                 " "                 "*"            
    ##           deposit_typeNon_Refund deposit_typeRefundable days_in_waiting_list
    ## 1  ( 1 )  " "                    " "                    " "                 
    ## 2  ( 1 )  " "                    " "                    " "                 
    ## 3  ( 1 )  " "                    " "                    " "                 
    ## 4  ( 1 )  " "                    " "                    " "                 
    ## 5  ( 1 )  " "                    " "                    " "                 
    ## 6  ( 1 )  " "                    " "                    " "                 
    ## 7  ( 1 )  " "                    " "                    " "                 
    ## 8  ( 1 )  " "                    " "                    " "                 
    ## 9  ( 1 )  " "                    " "                    " "                 
    ## 10  ( 1 ) " "                    " "                    " "                 
    ## 11  ( 1 ) " "                    " "                    " "                 
    ## 12  ( 1 ) " "                    " "                    " "                 
    ## 13  ( 1 ) " "                    " "                    " "                 
    ## 14  ( 1 ) " "                    " "                    " "                 
    ## 15  ( 1 ) " "                    " "                    " "                 
    ## 16  ( 1 ) " "                    " "                    " "                 
    ## 17  ( 1 ) " "                    " "                    " "                 
    ## 18  ( 1 ) " "                    " "                    " "                 
    ## 19  ( 1 ) " "                    " "                    " "                 
    ## 20  ( 1 ) " "                    " "                    " "                 
    ## 21  ( 1 ) " "                    " "                    " "                 
    ##           customer_typeGroup customer_typeTransient
    ## 1  ( 1 )  " "                " "                   
    ## 2  ( 1 )  " "                " "                   
    ## 3  ( 1 )  " "                " "                   
    ## 4  ( 1 )  " "                " "                   
    ## 5  ( 1 )  " "                " "                   
    ## 6  ( 1 )  " "                " "                   
    ## 7  ( 1 )  " "                " "                   
    ## 8  ( 1 )  " "                " "                   
    ## 9  ( 1 )  " "                " "                   
    ## 10  ( 1 ) " "                " "                   
    ## 11  ( 1 ) " "                " "                   
    ## 12  ( 1 ) " "                " "                   
    ## 13  ( 1 ) " "                " "                   
    ## 14  ( 1 ) " "                " "                   
    ## 15  ( 1 ) " "                " "                   
    ## 16  ( 1 ) " "                " "                   
    ## 17  ( 1 ) " "                " "                   
    ## 18  ( 1 ) " "                " "                   
    ## 19  ( 1 ) " "                " "                   
    ## 20  ( 1 ) " "                " "                   
    ## 21  ( 1 ) " "                " "                   
    ##           customer_typeTransient-Party average_daily_rate
    ## 1  ( 1 )  " "                          "*"               
    ## 2  ( 1 )  " "                          "*"               
    ## 3  ( 1 )  " "                          " "               
    ## 4  ( 1 )  " "                          " "               
    ## 5  ( 1 )  " "                          "*"               
    ## 6  ( 1 )  " "                          "*"               
    ## 7  ( 1 )  " "                          "*"               
    ## 8  ( 1 )  " "                          "*"               
    ## 9  ( 1 )  " "                          "*"               
    ## 10  ( 1 ) "*"                          "*"               
    ## 11  ( 1 ) "*"                          "*"               
    ## 12  ( 1 ) " "                          " "               
    ## 13  ( 1 ) "*"                          "*"               
    ## 14  ( 1 ) "*"                          "*"               
    ## 15  ( 1 ) "*"                          "*"               
    ## 16  ( 1 ) " "                          " "               
    ## 17  ( 1 ) "*"                          "*"               
    ## 18  ( 1 ) "*"                          "*"               
    ## 19  ( 1 ) "*"                          "*"               
    ## 20  ( 1 ) "*"                          "*"               
    ## 21  ( 1 ) "*"                          "*"               
    ##           required_car_parking_spacesparking total_of_special_requests
    ## 1  ( 1 )  " "                                " "                      
    ## 2  ( 1 )  " "                                " "                      
    ## 3  ( 1 )  " "                                " "                      
    ## 4  ( 1 )  " "                                " "                      
    ## 5  ( 1 )  " "                                " "                      
    ## 6  ( 1 )  " "                                "*"                      
    ## 7  ( 1 )  " "                                "*"                      
    ## 8  ( 1 )  " "                                "*"                      
    ## 9  ( 1 )  " "                                "*"                      
    ## 10  ( 1 ) " "                                "*"                      
    ## 11  ( 1 ) " "                                "*"                      
    ## 12  ( 1 ) " "                                " "                      
    ## 13  ( 1 ) " "                                "*"                      
    ## 14  ( 1 ) " "                                "*"                      
    ## 15  ( 1 ) " "                                "*"                      
    ## 16  ( 1 ) " "                                " "                      
    ## 17  ( 1 ) " "                                "*"                      
    ## 18  ( 1 ) " "                                "*"                      
    ## 19  ( 1 ) " "                                "*"                      
    ## 20  ( 1 ) " "                                "*"                      
    ## 21  ( 1 ) " "                                "*"                      
    ##           arrival_date2015-07-02 arrival_date2015-07-03 arrival_date2015-07-04
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2015-07-05 arrival_date2015-07-06 arrival_date2015-07-07
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2015-07-08 arrival_date2015-07-09 arrival_date2015-07-10
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2015-07-11 arrival_date2015-07-12 arrival_date2015-07-13
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2015-07-14 arrival_date2015-07-15 arrival_date2015-07-16
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2015-07-17 arrival_date2015-07-18 arrival_date2015-07-19
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2015-07-20 arrival_date2015-07-21 arrival_date2015-07-22
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2015-07-23 arrival_date2015-07-24 arrival_date2015-07-25
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2015-07-26 arrival_date2015-07-27 arrival_date2015-07-28
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2015-07-29 arrival_date2015-07-30 arrival_date2015-07-31
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2015-08-01 arrival_date2015-08-02 arrival_date2015-08-03
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2015-08-04 arrival_date2015-08-05 arrival_date2015-08-06
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2015-08-07 arrival_date2015-08-08 arrival_date2015-08-09
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2015-08-10 arrival_date2015-08-11 arrival_date2015-08-12
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2015-08-13 arrival_date2015-08-14 arrival_date2015-08-15
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2015-08-16 arrival_date2015-08-17 arrival_date2015-08-18
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2015-08-19 arrival_date2015-08-20 arrival_date2015-08-21
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2015-08-22 arrival_date2015-08-23 arrival_date2015-08-24
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2015-08-25 arrival_date2015-08-26 arrival_date2015-08-27
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2015-08-28 arrival_date2015-08-29 arrival_date2015-08-30
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2015-08-31 arrival_date2015-09-01 arrival_date2015-09-02
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2015-09-03 arrival_date2015-09-04 arrival_date2015-09-05
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2015-09-06 arrival_date2015-09-07 arrival_date2015-09-08
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2015-09-09 arrival_date2015-09-10 arrival_date2015-09-11
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2015-09-12 arrival_date2015-09-13 arrival_date2015-09-14
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2015-09-15 arrival_date2015-09-16 arrival_date2015-09-17
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2015-09-18 arrival_date2015-09-19 arrival_date2015-09-20
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2015-09-21 arrival_date2015-09-22 arrival_date2015-09-23
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2015-09-24 arrival_date2015-09-25 arrival_date2015-09-26
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2015-09-27 arrival_date2015-09-28 arrival_date2015-09-29
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2015-09-30 arrival_date2015-10-01 arrival_date2015-10-02
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2015-10-03 arrival_date2015-10-04 arrival_date2015-10-05
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2015-10-06 arrival_date2015-10-07 arrival_date2015-10-08
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2015-10-09 arrival_date2015-10-10 arrival_date2015-10-11
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2015-10-12 arrival_date2015-10-13 arrival_date2015-10-14
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2015-10-15 arrival_date2015-10-16 arrival_date2015-10-17
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2015-10-18 arrival_date2015-10-19 arrival_date2015-10-20
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2015-10-21 arrival_date2015-10-22 arrival_date2015-10-23
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2015-10-24 arrival_date2015-10-25 arrival_date2015-10-26
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2015-10-27 arrival_date2015-10-28 arrival_date2015-10-29
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2015-10-30 arrival_date2015-10-31 arrival_date2015-11-01
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2015-11-02 arrival_date2015-11-03 arrival_date2015-11-04
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2015-11-05 arrival_date2015-11-06 arrival_date2015-11-07
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2015-11-08 arrival_date2015-11-09 arrival_date2015-11-10
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2015-11-11 arrival_date2015-11-12 arrival_date2015-11-13
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2015-11-14 arrival_date2015-11-15 arrival_date2015-11-16
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2015-11-17 arrival_date2015-11-18 arrival_date2015-11-19
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2015-11-20 arrival_date2015-11-21 arrival_date2015-11-22
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2015-11-23 arrival_date2015-11-24 arrival_date2015-11-25
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2015-11-26 arrival_date2015-11-27 arrival_date2015-11-28
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2015-11-29 arrival_date2015-11-30 arrival_date2015-12-01
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2015-12-02 arrival_date2015-12-03 arrival_date2015-12-04
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2015-12-05 arrival_date2015-12-06 arrival_date2015-12-07
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2015-12-08 arrival_date2015-12-09 arrival_date2015-12-10
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2015-12-11 arrival_date2015-12-12 arrival_date2015-12-13
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2015-12-14 arrival_date2015-12-15 arrival_date2015-12-16
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2015-12-17 arrival_date2015-12-18 arrival_date2015-12-19
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2015-12-20 arrival_date2015-12-21 arrival_date2015-12-22
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2015-12-23 arrival_date2015-12-24 arrival_date2015-12-25
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2015-12-26 arrival_date2015-12-27 arrival_date2015-12-28
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2015-12-29 arrival_date2015-12-30 arrival_date2015-12-31
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2016-01-01 arrival_date2016-01-02 arrival_date2016-01-03
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2016-01-04 arrival_date2016-01-05 arrival_date2016-01-06
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2016-01-07 arrival_date2016-01-08 arrival_date2016-01-09
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2016-01-10 arrival_date2016-01-11 arrival_date2016-01-12
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2016-01-13 arrival_date2016-01-14 arrival_date2016-01-15
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2016-01-16 arrival_date2016-01-17 arrival_date2016-01-18
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2016-01-19 arrival_date2016-01-20 arrival_date2016-01-21
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2016-01-22 arrival_date2016-01-23 arrival_date2016-01-24
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2016-01-25 arrival_date2016-01-26 arrival_date2016-01-27
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2016-01-28 arrival_date2016-01-29 arrival_date2016-01-30
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2016-01-31 arrival_date2016-02-01 arrival_date2016-02-02
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2016-02-03 arrival_date2016-02-04 arrival_date2016-02-05
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2016-02-06 arrival_date2016-02-07 arrival_date2016-02-08
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2016-02-09 arrival_date2016-02-10 arrival_date2016-02-11
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2016-02-12 arrival_date2016-02-13 arrival_date2016-02-14
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2016-02-15 arrival_date2016-02-16 arrival_date2016-02-17
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2016-02-18 arrival_date2016-02-19 arrival_date2016-02-20
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2016-02-21 arrival_date2016-02-22 arrival_date2016-02-23
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2016-02-24 arrival_date2016-02-25 arrival_date2016-02-26
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2016-02-27 arrival_date2016-02-28 arrival_date2016-02-29
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2016-03-01 arrival_date2016-03-02 arrival_date2016-03-03
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2016-03-04 arrival_date2016-03-05 arrival_date2016-03-06
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2016-03-07 arrival_date2016-03-08 arrival_date2016-03-09
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2016-03-10 arrival_date2016-03-11 arrival_date2016-03-12
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2016-03-13 arrival_date2016-03-14 arrival_date2016-03-15
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2016-03-16 arrival_date2016-03-17 arrival_date2016-03-18
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2016-03-19 arrival_date2016-03-20 arrival_date2016-03-21
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2016-03-22 arrival_date2016-03-23 arrival_date2016-03-24
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2016-03-25 arrival_date2016-03-26 arrival_date2016-03-27
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2016-03-28 arrival_date2016-03-29 arrival_date2016-03-30
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2016-03-31 arrival_date2016-04-01 arrival_date2016-04-02
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2016-04-03 arrival_date2016-04-04 arrival_date2016-04-05
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2016-04-06 arrival_date2016-04-07 arrival_date2016-04-08
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2016-04-09 arrival_date2016-04-10 arrival_date2016-04-11
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2016-04-12 arrival_date2016-04-13 arrival_date2016-04-14
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2016-04-15 arrival_date2016-04-16 arrival_date2016-04-17
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2016-04-18 arrival_date2016-04-19 arrival_date2016-04-20
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2016-04-21 arrival_date2016-04-22 arrival_date2016-04-23
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2016-04-24 arrival_date2016-04-25 arrival_date2016-04-26
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2016-04-27 arrival_date2016-04-28 arrival_date2016-04-29
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2016-04-30 arrival_date2016-05-01 arrival_date2016-05-02
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2016-05-03 arrival_date2016-05-04 arrival_date2016-05-05
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2016-05-06 arrival_date2016-05-07 arrival_date2016-05-08
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2016-05-09 arrival_date2016-05-10 arrival_date2016-05-11
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2016-05-12 arrival_date2016-05-13 arrival_date2016-05-14
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2016-05-15 arrival_date2016-05-16 arrival_date2016-05-17
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2016-05-18 arrival_date2016-05-19 arrival_date2016-05-20
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2016-05-21 arrival_date2016-05-22 arrival_date2016-05-23
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2016-05-24 arrival_date2016-05-25 arrival_date2016-05-26
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2016-05-27 arrival_date2016-05-28 arrival_date2016-05-29
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2016-05-30 arrival_date2016-05-31 arrival_date2016-06-01
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2016-06-02 arrival_date2016-06-03 arrival_date2016-06-04
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2016-06-05 arrival_date2016-06-06 arrival_date2016-06-07
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2016-06-08 arrival_date2016-06-09 arrival_date2016-06-10
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2016-06-11 arrival_date2016-06-12 arrival_date2016-06-13
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2016-06-14 arrival_date2016-06-15 arrival_date2016-06-16
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2016-06-17 arrival_date2016-06-18 arrival_date2016-06-19
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2016-06-20 arrival_date2016-06-21 arrival_date2016-06-22
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2016-06-23 arrival_date2016-06-24 arrival_date2016-06-25
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2016-06-26 arrival_date2016-06-27 arrival_date2016-06-28
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2016-06-29 arrival_date2016-06-30 arrival_date2016-07-01
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2016-07-02 arrival_date2016-07-03 arrival_date2016-07-04
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2016-07-05 arrival_date2016-07-06 arrival_date2016-07-07
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2016-07-08 arrival_date2016-07-09 arrival_date2016-07-10
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2016-07-11 arrival_date2016-07-12 arrival_date2016-07-13
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2016-07-14 arrival_date2016-07-15 arrival_date2016-07-16
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2016-07-17 arrival_date2016-07-18 arrival_date2016-07-19
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2016-07-20 arrival_date2016-07-21 arrival_date2016-07-22
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2016-07-23 arrival_date2016-07-24 arrival_date2016-07-25
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) "*"                    " "                    " "                   
    ## 21  ( 1 ) "*"                    " "                    " "                   
    ##           arrival_date2016-07-26 arrival_date2016-07-27 arrival_date2016-07-28
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2016-07-29 arrival_date2016-07-30 arrival_date2016-07-31
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2016-08-01 arrival_date2016-08-02 arrival_date2016-08-03
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2016-08-04 arrival_date2016-08-05 arrival_date2016-08-06
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2016-08-07 arrival_date2016-08-08 arrival_date2016-08-09
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2016-08-10 arrival_date2016-08-11 arrival_date2016-08-12
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2016-08-13 arrival_date2016-08-14 arrival_date2016-08-15
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2016-08-16 arrival_date2016-08-17 arrival_date2016-08-18
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2016-08-19 arrival_date2016-08-20 arrival_date2016-08-21
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    "*"                    " "                   
    ## 20  ( 1 ) " "                    "*"                    " "                   
    ## 21  ( 1 ) " "                    "*"                    " "                   
    ##           arrival_date2016-08-22 arrival_date2016-08-23 arrival_date2016-08-24
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2016-08-25 arrival_date2016-08-26 arrival_date2016-08-27
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2016-08-28 arrival_date2016-08-29 arrival_date2016-08-30
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2016-08-31 arrival_date2016-09-01 arrival_date2016-09-02
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2016-09-03 arrival_date2016-09-04 arrival_date2016-09-05
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2016-09-06 arrival_date2016-09-07 arrival_date2016-09-08
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2016-09-09 arrival_date2016-09-10 arrival_date2016-09-11
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2016-09-12 arrival_date2016-09-13 arrival_date2016-09-14
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2016-09-15 arrival_date2016-09-16 arrival_date2016-09-17
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2016-09-18 arrival_date2016-09-19 arrival_date2016-09-20
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2016-09-21 arrival_date2016-09-22 arrival_date2016-09-23
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2016-09-24 arrival_date2016-09-25 arrival_date2016-09-26
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2016-09-27 arrival_date2016-09-28 arrival_date2016-09-29
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2016-09-30 arrival_date2016-10-01 arrival_date2016-10-02
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2016-10-03 arrival_date2016-10-04 arrival_date2016-10-05
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2016-10-06 arrival_date2016-10-07 arrival_date2016-10-08
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2016-10-09 arrival_date2016-10-10 arrival_date2016-10-11
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2016-10-12 arrival_date2016-10-13 arrival_date2016-10-14
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2016-10-15 arrival_date2016-10-16 arrival_date2016-10-17
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2016-10-18 arrival_date2016-10-19 arrival_date2016-10-20
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2016-10-21 arrival_date2016-10-22 arrival_date2016-10-23
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2016-10-24 arrival_date2016-10-25 arrival_date2016-10-26
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2016-10-27 arrival_date2016-10-28 arrival_date2016-10-29
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2016-10-30 arrival_date2016-10-31 arrival_date2016-11-01
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2016-11-02 arrival_date2016-11-03 arrival_date2016-11-04
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2016-11-05 arrival_date2016-11-06 arrival_date2016-11-07
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2016-11-08 arrival_date2016-11-09 arrival_date2016-11-10
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2016-11-11 arrival_date2016-11-12 arrival_date2016-11-13
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2016-11-14 arrival_date2016-11-15 arrival_date2016-11-16
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2016-11-17 arrival_date2016-11-18 arrival_date2016-11-19
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2016-11-20 arrival_date2016-11-21 arrival_date2016-11-22
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2016-11-23 arrival_date2016-11-24 arrival_date2016-11-25
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2016-11-26 arrival_date2016-11-27 arrival_date2016-11-28
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2016-11-29 arrival_date2016-11-30 arrival_date2016-12-01
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2016-12-02 arrival_date2016-12-03 arrival_date2016-12-04
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2016-12-05 arrival_date2016-12-06 arrival_date2016-12-07
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2016-12-08 arrival_date2016-12-09 arrival_date2016-12-10
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2016-12-11 arrival_date2016-12-12 arrival_date2016-12-13
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2016-12-14 arrival_date2016-12-15 arrival_date2016-12-16
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2016-12-17 arrival_date2016-12-18 arrival_date2016-12-19
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2016-12-20 arrival_date2016-12-21 arrival_date2016-12-22
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2016-12-23 arrival_date2016-12-24 arrival_date2016-12-25
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2016-12-26 arrival_date2016-12-27 arrival_date2016-12-28
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2016-12-29 arrival_date2016-12-30 arrival_date2016-12-31
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2017-01-01 arrival_date2017-01-02 arrival_date2017-01-03
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2017-01-04 arrival_date2017-01-05 arrival_date2017-01-06
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2017-01-07 arrival_date2017-01-08 arrival_date2017-01-09
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2017-01-10 arrival_date2017-01-11 arrival_date2017-01-12
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2017-01-13 arrival_date2017-01-14 arrival_date2017-01-15
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2017-01-16 arrival_date2017-01-17 arrival_date2017-01-18
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2017-01-19 arrival_date2017-01-20 arrival_date2017-01-21
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2017-01-22 arrival_date2017-01-23 arrival_date2017-01-24
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2017-01-25 arrival_date2017-01-26 arrival_date2017-01-27
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2017-01-28 arrival_date2017-01-29 arrival_date2017-01-30
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2017-01-31 arrival_date2017-02-01 arrival_date2017-02-02
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2017-02-03 arrival_date2017-02-04 arrival_date2017-02-05
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2017-02-06 arrival_date2017-02-07 arrival_date2017-02-08
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2017-02-09 arrival_date2017-02-10 arrival_date2017-02-11
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2017-02-12 arrival_date2017-02-13 arrival_date2017-02-14
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2017-02-15 arrival_date2017-02-16 arrival_date2017-02-17
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2017-02-18 arrival_date2017-02-19 arrival_date2017-02-20
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2017-02-21 arrival_date2017-02-22 arrival_date2017-02-23
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2017-02-24 arrival_date2017-02-25 arrival_date2017-02-26
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2017-02-27 arrival_date2017-02-28 arrival_date2017-03-01
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2017-03-02 arrival_date2017-03-03 arrival_date2017-03-04
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2017-03-05 arrival_date2017-03-06 arrival_date2017-03-07
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2017-03-08 arrival_date2017-03-09 arrival_date2017-03-10
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2017-03-11 arrival_date2017-03-12 arrival_date2017-03-13
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2017-03-14 arrival_date2017-03-15 arrival_date2017-03-16
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2017-03-17 arrival_date2017-03-18 arrival_date2017-03-19
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2017-03-20 arrival_date2017-03-21 arrival_date2017-03-22
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2017-03-23 arrival_date2017-03-24 arrival_date2017-03-25
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2017-03-26 arrival_date2017-03-27 arrival_date2017-03-28
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2017-03-29 arrival_date2017-03-30 arrival_date2017-03-31
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2017-04-01 arrival_date2017-04-02 arrival_date2017-04-03
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2017-04-04 arrival_date2017-04-05 arrival_date2017-04-06
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2017-04-07 arrival_date2017-04-08 arrival_date2017-04-09
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2017-04-10 arrival_date2017-04-11 arrival_date2017-04-12
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2017-04-13 arrival_date2017-04-14 arrival_date2017-04-15
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2017-04-16 arrival_date2017-04-17 arrival_date2017-04-18
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2017-04-19 arrival_date2017-04-20 arrival_date2017-04-21
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2017-04-22 arrival_date2017-04-23 arrival_date2017-04-24
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2017-04-25 arrival_date2017-04-26 arrival_date2017-04-27
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2017-04-28 arrival_date2017-04-29 arrival_date2017-04-30
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2017-05-01 arrival_date2017-05-02 arrival_date2017-05-03
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2017-05-04 arrival_date2017-05-05 arrival_date2017-05-06
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2017-05-07 arrival_date2017-05-08 arrival_date2017-05-09
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2017-05-10 arrival_date2017-05-11 arrival_date2017-05-12
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2017-05-13 arrival_date2017-05-14 arrival_date2017-05-15
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2017-05-16 arrival_date2017-05-17 arrival_date2017-05-18
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2017-05-19 arrival_date2017-05-20 arrival_date2017-05-21
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2017-05-22 arrival_date2017-05-23 arrival_date2017-05-24
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2017-05-25 arrival_date2017-05-26 arrival_date2017-05-27
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2017-05-28 arrival_date2017-05-29 arrival_date2017-05-30
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2017-05-31 arrival_date2017-06-01 arrival_date2017-06-02
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2017-06-03 arrival_date2017-06-04 arrival_date2017-06-05
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2017-06-06 arrival_date2017-06-07 arrival_date2017-06-08
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2017-06-09 arrival_date2017-06-10 arrival_date2017-06-11
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2017-06-12 arrival_date2017-06-13 arrival_date2017-06-14
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2017-06-15 arrival_date2017-06-16 arrival_date2017-06-17
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2017-06-18 arrival_date2017-06-19 arrival_date2017-06-20
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    "*"                   
    ##           arrival_date2017-06-21 arrival_date2017-06-22 arrival_date2017-06-23
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2017-06-24 arrival_date2017-06-25 arrival_date2017-06-26
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2017-06-27 arrival_date2017-06-28 arrival_date2017-06-29
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2017-06-30 arrival_date2017-07-01 arrival_date2017-07-02
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2017-07-03 arrival_date2017-07-04 arrival_date2017-07-05
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2017-07-06 arrival_date2017-07-07 arrival_date2017-07-08
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2017-07-09 arrival_date2017-07-10 arrival_date2017-07-11
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2017-07-12 arrival_date2017-07-13 arrival_date2017-07-14
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2017-07-15 arrival_date2017-07-16 arrival_date2017-07-17
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2017-07-18 arrival_date2017-07-19 arrival_date2017-07-20
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2017-07-21 arrival_date2017-07-22 arrival_date2017-07-23
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2017-07-24 arrival_date2017-07-25 arrival_date2017-07-26
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2017-07-27 arrival_date2017-07-28 arrival_date2017-07-29
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2017-07-30 arrival_date2017-07-31 arrival_date2017-08-01
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2017-08-02 arrival_date2017-08-03 arrival_date2017-08-04
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2017-08-05 arrival_date2017-08-06 arrival_date2017-08-07
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2017-08-08 arrival_date2017-08-09 arrival_date2017-08-10
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2017-08-11 arrival_date2017-08-12 arrival_date2017-08-13
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2017-08-14 arrival_date2017-08-15 arrival_date2017-08-16
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2017-08-17 arrival_date2017-08-18 arrival_date2017-08-19
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2017-08-20 arrival_date2017-08-21 arrival_date2017-08-22
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2017-08-23 arrival_date2017-08-24 arrival_date2017-08-25
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2017-08-26 arrival_date2017-08-27 arrival_date2017-08-28
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "                   
    ##           arrival_date2017-08-29 arrival_date2017-08-30 arrival_date2017-08-31
    ## 1  ( 1 )  " "                    " "                    " "                   
    ## 2  ( 1 )  " "                    " "                    " "                   
    ## 3  ( 1 )  " "                    " "                    " "                   
    ## 4  ( 1 )  " "                    " "                    " "                   
    ## 5  ( 1 )  " "                    " "                    " "                   
    ## 6  ( 1 )  " "                    " "                    " "                   
    ## 7  ( 1 )  " "                    " "                    " "                   
    ## 8  ( 1 )  " "                    " "                    " "                   
    ## 9  ( 1 )  " "                    " "                    " "                   
    ## 10  ( 1 ) " "                    " "                    " "                   
    ## 11  ( 1 ) " "                    " "                    " "                   
    ## 12  ( 1 ) " "                    " "                    " "                   
    ## 13  ( 1 ) " "                    " "                    " "                   
    ## 14  ( 1 ) " "                    " "                    " "                   
    ## 15  ( 1 ) " "                    " "                    " "                   
    ## 16  ( 1 ) " "                    " "                    " "                   
    ## 17  ( 1 ) " "                    " "                    " "                   
    ## 18  ( 1 ) " "                    " "                    " "                   
    ## 19  ( 1 ) " "                    " "                    " "                   
    ## 20  ( 1 ) " "                    " "                    " "                   
    ## 21  ( 1 ) " "                    " "                    " "

    ##                  (Intercept)            hotelResort_Hotel 
    ##                 0.0217723810                -0.0292173760 
    ##                       adults                       mealSC 
    ##                -0.0340022930                -0.0544489142 
    ##            is_repeated_guest          reserved_room_typeB 
    ##                -0.0483865693                 0.2329664525 
    ##          reserved_room_typeC          reserved_room_typeD 
    ##                 0.5498046291                -0.0567144770 
    ##          reserved_room_typeF          reserved_room_typeG 
    ##                 0.3660880314                 0.5238495718 
    ##          reserved_room_typeH          assigned_room_typeC 
    ##                 0.6848334708                 0.0803940259 
    ##          assigned_room_typeD          assigned_room_typeE 
    ##                 0.0474142634                 0.0279272251 
    ##              booking_changes customer_typeTransient-Party 
    ##                 0.0214916248                -0.0397250443 
    ##           average_daily_rate    total_of_special_requests 
    ##                 0.0008492635                 0.0324909456

    ##    yhat
    ## y      0    1
    ##   0 8144  126
    ##   1  468  262

    ## [1] 93.4

![](Exercise_2_files/figure-markdown_strict/unnamed-chunk-6-1.png)![](Exercise_2_files/figure-markdown_strict/unnamed-chunk-6-2.png)![](Exercise_2_files/figure-markdown_strict/unnamed-chunk-6-3.png)![](Exercise_2_files/figure-markdown_strict/unnamed-chunk-6-4.png)![](Exercise_2_files/figure-markdown_strict/unnamed-chunk-6-5.png)

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
<td style="text-align: right;">0.6816490</td>
</tr>
<tr class="even">
<td style="text-align: left;">Baseline 2</td>
<td style="text-align: right;">0.8623264</td>
</tr>
<tr class="odd">
<td style="text-align: left;">Best Linear Model</td>
<td style="text-align: right;">0.8556378</td>
</tr>
<tr class="even">
<td style="text-align: left;">Stepwise linear Model</td>
<td style="text-align: right;">0.8480959</td>
</tr>
</tbody>
</table>

![](Exercise_2_files/figure-markdown_strict/unnamed-chunk-6-6.png)

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
<td style="text-align: left;">18</td>
<td style="text-align: left;">13</td>
</tr>
<tr class="even">
<td style="text-align: left;">Fold02</td>
<td style="text-align: left;">18</td>
<td style="text-align: left;">13</td>
</tr>
<tr class="odd">
<td style="text-align: left;">Fold03</td>
<td style="text-align: left;">23</td>
<td style="text-align: left;">21</td>
</tr>
<tr class="even">
<td style="text-align: left;">Fold04</td>
<td style="text-align: left;">19</td>
<td style="text-align: left;">15</td>
</tr>
<tr class="odd">
<td style="text-align: left;">Fold05</td>
<td style="text-align: left;">27</td>
<td style="text-align: left;">25</td>
</tr>
<tr class="even">
<td style="text-align: left;">Fold06</td>
<td style="text-align: left;">21</td>
<td style="text-align: left;">16</td>
</tr>
<tr class="odd">
<td style="text-align: left;">Fold07</td>
<td style="text-align: left;">21</td>
<td style="text-align: left;">19</td>
</tr>
<tr class="even">
<td style="text-align: left;">Fold08</td>
<td style="text-align: left;">19</td>
<td style="text-align: left;">19</td>
</tr>
<tr class="odd">
<td style="text-align: left;">Fold09</td>
<td style="text-align: left;">18</td>
<td style="text-align: left;">19</td>
</tr>
<tr class="even">
<td style="text-align: left;">Fold10</td>
<td style="text-align: left;">19</td>
<td style="text-align: left;">16</td>
</tr>
<tr class="odd">
<td style="text-align: left;">Fold11</td>
<td style="text-align: left;">19</td>
<td style="text-align: left;">28</td>
</tr>
<tr class="even">
<td style="text-align: left;">Fold12</td>
<td style="text-align: left;">24</td>
<td style="text-align: left;">28</td>
</tr>
<tr class="odd">
<td style="text-align: left;">Fold13</td>
<td style="text-align: left;">29</td>
<td style="text-align: left;">23</td>
</tr>
<tr class="even">
<td style="text-align: left;">Fold14</td>
<td style="text-align: left;">21</td>
<td style="text-align: left;">18</td>
</tr>
<tr class="odd">
<td style="text-align: left;">Fold15</td>
<td style="text-align: left;">21</td>
<td style="text-align: left;">23</td>
</tr>
<tr class="even">
<td style="text-align: left;">Fold16</td>
<td style="text-align: left;">19</td>
<td style="text-align: left;">20</td>
</tr>
<tr class="odd">
<td style="text-align: left;">Fold17</td>
<td style="text-align: left;">29</td>
<td style="text-align: left;">27</td>
</tr>
<tr class="even">
<td style="text-align: left;">Fold18</td>
<td style="text-align: left;">18</td>
<td style="text-align: left;">27</td>
</tr>
<tr class="odd">
<td style="text-align: left;">Fold19</td>
<td style="text-align: left;">16</td>
<td style="text-align: left;">16</td>
</tr>
<tr class="even">
<td style="text-align: left;">Fold20</td>
<td style="text-align: left;">18</td>
<td style="text-align: left;">16</td>
</tr>
<tr class="odd">
<td style="text-align: left;"></td>
<td style="text-align: left;">417</td>
<td style="text-align: left;">402</td>
</tr>
</tbody>
</table>
