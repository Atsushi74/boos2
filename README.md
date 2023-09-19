# boss2
Stata ado files for "Product Innovation, Product Diversification and Firm Growth: Evidence from Japan's Early Industrialization" by S. Braguinsky, A. Ohyama, T. Okazaki, and C. Syverson. 

### Erratum
Date: September 19, 2023

Modified files: boos_2sls_1.ado, boos_2sls_2.ado, boos_2sls_A1.ado, boos_2sls_A2.ado

There was a logical coding error in the subroutine that obtains the bootstrapped standard errors for Table 5, columns (3) and (4) in the main text and Table A7, columns (3) and (4) in the online appendix. The code was structured in such a way that, when we computed a particular cumulative sum in a bootstrap sample, we took the sum over all observations for a given firm, even if that firm was sampled multiple times in the bootstrap draw. The correct procedure would instead treat re-sampled firms as distinct “quasi-firms” and only compute the cumulative sum using the observations for each quasi-firm. We thank Isaiah Andrews and Jesse Shapiro for pointing this out to us. 

We have fixed this error and updated the four ado files hosted here that are called upon by the replication codes hosted on the AER web site (two words needed to be changed in our code). The updated files compute the correct bootstrapped errors for the columns in the tables above. Because the coding error regarded a bootstrap procedure, only the published standard errors are affected, not the point estimates. In some cases, the corrected standard errors are somewhat higher than those published but this does not affect our claims in the main text and the appendix. 
