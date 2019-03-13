Workout1
================
Yeongyu Shin

**Introduction**
----------------

In this article, I'll present the shot recods and statistics for 5 star basket ball players, Andre Iguodala, Draymond Green, Kevin Durant, Klay Thompson and Stephen Curry. They have shown extrarodinary record. It would be worth analyzing records of shots for those players

The following are the record of effective shots

**Effective Shooting Percentage**
---------------------------------

\[1\] "2PT Effective Shooting % by Players"

| player   |  total|  made|  perc\_made|
|:---------|------:|-----:|-----------:|
| iguodala |    210|   134|   0.6380952|
| durant   |    643|   390|   0.6065319|
| curry    |    563|   304|   0.5399645|
| thompson |    640|   329|   0.5140625|
| green    |    346|   171|   0.4942197|

\[1\] "3PT Effective Shooting % by Players"

| player   |  total|  made|  perc\_made|
|:---------|------:|-----:|-----------:|
| thompson |    580|   246|   0.4241379|
| curry    |    687|   280|   0.4075691|
| durant   |    272|   105|   0.3860294|
| iguodala |    161|    58|   0.3602484|
| green    |    232|    74|   0.3189655|

\[1\] "Effective Shooting % by Players"

| player   |  total|  made|  perc\_made|
|:---------|------:|-----:|-----------:|
| durant   |    915|   495|   0.5409836|
| iguodala |    371|   192|   0.5175202|
| thompson |   1220|   575|   0.4713115|
| curry    |   1250|   584|   0.4672000|
| green    |    578|   245|   0.4238754|

### **Associated codes for computing the tables above**

``` r
summary1 <- arrange(summarise(group_by(gsw1, player), 
                      total = sum(shot_type == "2PT Field Goal"), made = sum(shot_made_flag == "y"), perc_made = made/total), desc(perc_made))
summary2 <- arrange(summarise(group_by(gsw2, player), 
                      total = sum(shot_type == "3PT Field Goal"), made = sum(shot_made_flag == "y"), perc_made = made/total), desc(perc_made))
summary3 <- arrange(summarise(group_by(gsw, player), 
                      total = sum(shot_type == "3PT Field Goal" | shot_type == "2PT Field Goal"), made = sum(shot_made_flag == "y"), perc_made = made/total), desc(perc_made))
```

**Shooting Spots Graph**
------------------------

It would be worth as well analyzing spots that each shot was made by those players. Green dots represent successful shots while red dots represent failed ones.

### Andre Iguodala

![](C:/Users/terta1037/Documents/hw-stat133/workout01/images/andre.jfif)

### Draymond Green

![](C:/Users/terta1037/Documents/hw-stat133/workout01/images/draymond.jfif)

### Kevin Durant

![](C:/Users/terta1037/Documents/hw-stat133/workout01/images/kevin.jfif)

### Klay Thompson

![](C:/Users/terta1037/Documents/hw-stat133/workout01/images/klay.jfif)

### Stephen Curry

![](C:/Users/terta1037/Documents/hw-stat133/workout01/images/stephen.jfif)

### Shooting spots for each player

![](C:/Users/terta1037/Documents/hw-stat133/workout01/images/gsw-shot-charts.png)

**Summary**
-----------

It has been found that the players obviously more successfull in 2 points shots. There was no absolute dominance over all kinds of shots. Iguodala has the higest effect shooting rate in terms of 2PT shots while Thompson has the highest in terms of 3 PT and Durant in terms of the total. Green ranked the lowest for the all shots.
