## Introduction

Like other rodents, Guinea pigs have teeth that growth continuously while gnawing on their surface. As such, Guniea pigs can keep their teeth at a relatively constant length. It is well established that Vitamin C has play a key role in the tooth growth and maintenance.

This app is used to show the effect of two different Vitamin C delivery methods on the steady-state length of teeth of Guinea pigs. Reach my shiny app here: <https://weisdata.shinyapps.io/ToothGrowth/>.

This app takes advantage the R build-in dataset `data(ToothGrowth)`. To make sure the app run well online, I store the dataset in the subfile named "data".

The dataset contains `60` observations. The response is the length of odontoblasts (teeth) in each of 10 guinea pigs at each of three dose levels of Vitamin C (0.5, 1, and 2 mg) with each of two delivery methods (orange juice or ascorbic acid).

Note that both `ui.R` and `server.R` are contained in the file "ToothGrowth".