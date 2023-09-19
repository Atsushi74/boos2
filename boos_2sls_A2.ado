* BOOS 2SLS
* 

program boos_2sls_A2, eclass
version 16
tempname b V


capture drop temp_upgrade_hat temp_upgrade_cum_hat upgrade_exper_low_hat

 
 poisson temp_upgrade  c.sotan_c#c.dlog_high_end_cap fr_low_prod u_eng_dummy merchant_d ///
 dlog_high_end_cap dlog_low_end_cap log_firm_total firm_age i.year_half_year  if  est_inc==1 , robust cluster(firmID)

predict temp_upgrade_hat if e(sample)
sort newid year_half_year
by newid: gen temp_upgrade_cum_hat=sum(temp_upgrade_hat)
gen upgrade_exper_low_hat = temp_upgrade_cum_hat*fr_low_prod

reg dlog_firm_total temp_upgrade_cum_hat fr_low_prod upgrade_exper_low_hat u_eng_dummy  merchant_d   dlog_high_end_cap dlog_low_end_cap ///
 log_firm_total  firm_age i.year_half_year  if  est_inc==1

matrix `b' = e(b)
matrix `V' = e(V)
ereturn post `b' `V' 
end
