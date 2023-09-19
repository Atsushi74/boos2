* BOOS 2SLS
* 

program boos_2sls_1, eclass
version 16
tempname b V
*tempvar num_exper_upgrades_st_hat 
*tempvar num_exper_upgrades_st_cum_hat

capture drop num_exper_upgrades_st_hat num_exper_upgrades_st_cum_hat

poisson num_exper_upgrades_st  c.sotan_c#c.dlog_high_end_cap fr_low_prod u_eng_dummy  merchant_d ///
dlog_high_end_cap dlog_low_end_cap log_firm_total firm_age i.year_half_year  if est_inc==1 , robust cluster(firmID)


 
predict num_exper_upgrades_st_hat if e(sample)
sort newid year_half_year
by newid: gen num_exper_upgrades_st_cum_hat=sum(num_exper_upgrades_st_hat)

reg dlog_firm_total num_exper_upgrades_st_cum_hat  fr_low_prod   u_eng_dummy  merchant_d  ///
dlog_high_end_cap dlog_low_end_cap   log_firm_total  firm_age i.year_half_year  if  est_inc==1


matrix `b' = e(b)
matrix `V' = e(V)
ereturn post `b' `V' 
end
d
