# 1) Data visualization: flights at ABIA

![](hw1-markdown_files/figure-markdown_strict/Airline%20Delays%20(1)-1.png)

How did departures for Austin-Bergstrom International Airport vary in
2008? According to this chart, across all airlines, the greatest average
departure delays occur in the morning, with Southwest delays being the
most severe. If you’re flying United, you want to avoid early afternoon
departures, as there is a huge spike in average delays in the hours
between 11:00 am and 4:00 pm.

\#2) Wrangling the Billboard Top 100

\#\#Part A:

    ## # A tibble: 10 × 3
    ## # Groups:   performer [10]
    ##    performer                              song                             count
    ##    <chr>                                  <chr>                            <int>
    ##  1 Imagine Dragons                        Radioactive                         87
    ##  2 AWOLNATION                             Sail                                79
    ##  3 Jason Mraz                             I'm Yours                           76
    ##  4 The Weeknd                             Blinding Lights                     76
    ##  5 LeAnn Rimes                            How Do I Live                       69
    ##  6 LMFAO Featuring Lauren Bennett & Goon… Party Rock Anthem                   68
    ##  7 OneRepublic                            Counting Stars                      68
    ##  8 Adele                                  Rolling In The Deep                 65
    ##  9 Jewel                                  Foolish Games/You Were Meant Fo…    65
    ## 10 Carrie Underwood                       Before He Cheats                    64

\#\#Part B:

![](hw1-markdown_files/figure-markdown_strict/Musical%20Diversity%20(2B)-1.png)

Song diversity on the Billboard Top 100 peaked in the mid-1960’s, then
steadily dropped until it hit a low in the early 2000’s. Since the early
2000’s, however, song diversity has increased sharply, with
almost-record high numbers for 2020.

\#\#Part C:

    ## # A tibble: 19 × 2
    ##    performer             count
    ##    <chr>                 <int>
    ##  1 Elton John               52
    ##  2 Madonna                  44
    ##  3 Kenny Chesney            42
    ##  4 Tim McGraw               39
    ##  5 Keith Urban              36
    ##  6 Stevie Wonder            36
    ##  7 Taylor Swift             35
    ##  8 Michael Jackson          34
    ##  9 Rod Stewart              33
    ## 10 The Rolling Stones       33
    ## 11 Billy Joel               32
    ## 12 Chicago                  31
    ## 13 Drake                    31
    ## 14 Rascal Flatts            31
    ## 15 Brad Paisley             30
    ## 16 Daryl Hall John Oates    30
    ## 17 George Strait            30
    ## 18 Jason Aldean             30
    ## 19 Neil Diamond             30

![](hw1-markdown_files/figure-markdown_strict/19%20Artists%20that%20are%20Built%20Different%20(2C)-1.png)
\#3) Wrangling the Olympics

\#\#Part A:

    ## # A tibble: 132 × 2
    ##    event                                 topheight
    ##    <chr>                                     <dbl>
    ##  1 Basketball Women's Basketball              198.
    ##  2 Volleyball Women's Volleyball              193 
    ##  3 Athletics Women's Shot Put                 192.
    ##  4 Swimming Women's 200 metres Freestyle      191 
    ##  5 Athletics Women's Heptathlon               189.
    ##  6 Athletics Women's Discus Throw             188.
    ##  7 Athletics Women's High Jump                188 
    ##  8 Rowing Women's Coxed Eights                188 
    ##  9 Rowing Women's Double Sculls               188.
    ## 10 Athletics Women's Triple Jump              187.
    ## # … with 122 more rows

Female competitors across all athletic events in the top 20 Olympic
sports. The Women’s Basketball team has the highest (and therefore
tallest) percentiles among all female sports. The Women’s Triple Jump
has the lowest.

\#\#Part B:

    ## # A tibble: 1 × 2
    ##   event                      height_variation
    ##   <chr>                                 <dbl>
    ## 1 Rowing Women's Coxed Fours             10.9

Rowing Women’s Coxed Fours has the most variation in height among
competitors, with a standard deviation of 10.9 cm.

\#\#Part C:

![](hw1-markdown_files/figure-markdown_strict/Average%20Age%20of%20Olympic%20Swimmers%20(3C)-1.png)

The average age of Olympic swimming medalists spiked in 1924, but
dropped to an average age of about 20 for men and 17 for women until the
1980s, when there began a gradual increase in age for both sexes.

\#4.) K-nearest Neighbors

\#\#Trim 350 analysis \#\#\# Splitting the dataset and making
predictions

    ## [1] 10826.05

    ## [1] 10589.52

    ## [1] 10183.34

    ## [1] 11056.27

    ## [1] 19946.03

Above are the RMSE outputs, in order, of arbitrarily selected values of
K (2, 10, 25, 100, and 300 respectively).

    ##    trim mileage price k2_price_pred k10_price_pred k25_price_pred
    ## 1   350   21929 55994       64989.0        57675.5       54479.00
    ## 4   350   35004 59988       50740.0        50288.8       51832.80
    ## 8   350    2578 68960       66995.0        70375.1       78720.04
    ## 11  350   21388 69900       58430.0        57100.0       56788.08
    ## 16  350   29044 61900       56992.5        51864.4       54640.56
    ## 19  350   29468 40999       59492.5        58588.0       55627.88
    ## 24  350   21874 58975       64989.0        57675.5       54479.00
    ## 27  350   15435 68950       67493.0        59545.6       58430.64
    ## 35  350   21185 51495       54866.5        55626.2       57147.84
    ## 36  350   32290 48789       56700.0        55311.2       55519.88
    ##    k100_price_pred k300_price_pred
    ## 1         56645.71        51118.82
    ## 4         52620.18        51118.82
    ## 8         68308.59        51118.82
    ## 11        56653.47        51118.82
    ## 16        54811.48        51118.82
    ## 19        54727.75        51118.82
    ## 24        56645.71        51118.82
    ## 27        60617.91        51118.82
    ## 35        56513.51        51118.82
    ## 36        53541.55        51118.82

This table shows our testing set with the predictions of each model
associated with a value of k. For brevity we added only the first 10
observations.

### Plotting RMSE vs K

![](hw1-markdown_files/figure-markdown_strict/Trim%20350s%20RMSE%20Based%20on%20the%20Value%20of%20K-1.png)

### Finding Optimal K and Plotting the Model

    ## [1] 27

![](hw1-markdown_files/figure-markdown_strict/Finding%20Optimal%20K%20and%20Plotting%20the%20Model%20-1.png)

## Trim 65 AMG analysis

### Splitting the data and making predictions

    ## [1] 24585.63

    ## [1] 17796.72

    ## [1] 16665.95

    ## [1] 38502.58

    ## [1] 80725.81

Above are the predicted RMSE values for different values of K (2, 10,
25, 100, and 200 respectively).

    ##      trim mileage  price k2_price_pred k10_price_pred k25_price_pred
    ## 1  65 AMG     106 235375      223932.5       220900.7      227155.25
    ## 4  65 AMG   73415  54981       27450.0        42913.0       42250.24
    ## 5  65 AMG   17335 102500       75470.5        97949.5      101082.40
    ## 6  65 AMG       7 230860      229090.8       227859.7      227816.37
    ## 24 65 AMG   85142  37900       50388.0        44298.7       40433.88
    ## 26 65 AMG      17 225681      231059.0       231597.5      229948.27
    ## 35 65 AMG   51670  59995       64745.5        55755.2       58926.24
    ## 41 65 AMG      20 231325      232550.0       231187.0      227315.24
    ## 48 65 AMG   62114  47995       46934.5        41064.1       50651.44
    ## 51 65 AMG    4685 199900      139425.0       177609.4      202793.46
    ##    k100_price_pred k200_price_pred
    ## 1        192089.47        127083.1
    ## 4         51055.45        108854.5
    ## 5        155759.30        127083.1
    ## 6        192089.47        127083.1
    ## 24        50435.45        110633.5
    ## 26       192089.47        127083.1
    ## 35        57581.56        106898.5
    ## 41       192089.47        127083.1
    ## 48        52794.03        109551.1
    ## 51       192089.47        127083.1

This table shows our testing set with the predictions of each model
associated with a value of k. For brevity we added only the first 10
observations.

### Plotting RMSE vs K

![](hw1-markdown_files/figure-markdown_strict/Plotting%20RMSE%20vs%20K-1.png)

### Finding Optimal K and Plotting the Model

    ## [1] 20

![](hw1-markdown_files/figure-markdown_strict/Finding%20Optimal%20K%20and%20Plotting%20the%20Model-1.png)
\#\# Discussion

It would appear that, with repeated trials, Trim 350’s optimal value of
k is generally higher. This is due to Trim 350’s larger sample size.
Generally, higher values of k will reduce the variation of our model but
at the cost of greater bias. With larger sample sizes, we can afford to
use larger values of k as these values will have a lesser effect on the
model’s bias.
