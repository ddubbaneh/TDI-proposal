/*recode yes/nos*/
gen criminal2 = .
replace criminal2 = 1 if criminal == "yes"
replace criminal2 = 0 if criminal == "no"

gen access2 = .
replace access2 = 1 if access == "yes"
replace access2 = 0 if access == "no"

gen prescription2 = .
replace prescription2 = 1 if prescriptions == "yes"
replace prescription2 = 0 if prescriptions == "no"


/*run logistic regression*/
logistic access2 rate prescription2 criminal2

/*
. logistic access2 rate prescription2 criminal2
note: criminal2 != 0 predicts success perfectly
      criminal2 dropped and 33 obs not used


Logistic regression                               Number of obs   =         18
                                                  LR chi2(2)      =       3.13
                                                  Prob > chi2     =     0.2087
Log likelihood = -9.0685013                       Pseudo R2       =     0.1473

-------------------------------------------------------------------------------
      access2 | Odds Ratio   Std. Err.      z    P>|z|     [95% Conf. Interval]
--------------+----------------------------------------------------------------
         rate |   1.165101   .2528517     0.70   0.481     .7614381    1.782758
prescription2 |   6.915581   8.967563     1.49   0.136     .5445776    87.82084
    criminal2 |          1  (omitted)
        _cons |   .1851304   .5158807    -0.61   0.545     .0007862    43.59319
-------------------------------------------------------------------------------

*/


/*plotting to plot*/
twoway (scatter rate prescription2), by(criminal2)

twoway (scatter rate access2), by(criminal2)
