# Smoking in the UK Case Study

---

 Author: Pedro Bettencourt
 
 Date: November 25, 2024
 
---


# Scenario

Smoking is a leading cause of preventable diseases like lung cancer, heart disease, and chronic respiratory conditions. 
In the UK, it contributed to over 70,000 deaths in 2019. 
Public health campaigns highlight its dangers and promote cessation to improve overall health outcomes and reduce healthcare costs.


### Objectives

* Analyze smoking patterns and trends.
* Uncover insights into demographic differences.
* Use insights to inform and enhance public health strategies to combat smoking.

---

# Dataset

The dataset was obtained from [kaggle](https://www.kaggle.com/datasets/utkarshx27/smoking-dataset-from-uk/data).
It consists of survey data on smoking habits from the UK. It contains 1691 observations and has factors like age, income, nationality, and region.

---

# Data preparation

There wasn't a need to do much data cleaning, as there were no duplicated entries or null and missing values in most columns.
The column "type" was removed, however, as it was irrelevant for this analysis and most of the data was missing.

---

# Analysis

The number of smokers was analysed based on various metrics: gender, age, marital status, qualification, nationality, ethnicity, income, and region.
SQL queries were used to calculate the percentage of smokers within each group for these metrics.


As an example, a query first calculates the number of married individuals in the dataset using a subquery. 
The main query then calculates the number of smokers within that married group. 
The resulting count is then used to determine the percentage of smokers among married individuals.

---

# Visualization

The visualizations for the queries were done in Tableau and can be seen [here](https://public.tableau.com/views/SmokingUK_17325609277020/Dashboard1?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link).


---

# Conclusions

We can see that:
 * Men have a slightly higher smoking rate.
 * People between 18 and 24 years old have the highest smoking rate, while 65+ have the lowest (39% vs 11%).
 * Scotland has the highest smoking rate (34%).
 * Single people have the highest smoking rate, while married people have the lowest (37% vs 17%).
 * People with less income have a higher smoking rate.
 * People of mixed ethnicity had the highest smoking rate (35%).
 * The Irish were the nationality with the highest smoking rate (48%).

Considering these findings, it would be wise to target anti-smoking campaigns towards these demographics that have a higher smoking rate.
For instance, targeting younger individuals (18-24), people living in Scotland, single individuals, and those with lower incomes could be effective strategies for reducing smoking prevalence.







