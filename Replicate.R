
d0 <- read.csv(file = "prefLevelTest.csv", header = TRUE)


## regression 1
reg.ols <-lm(lngdppc2000~lnmig1127+south,data=d0)
summary(reg.ols)

robust.csv <- sandwich::vcovHC(reg.ols,type="HC1")

print( lmtest::coeftest(reg.ols, vcov. = robust.csv) ) # robust test


## regression 2

d1 <- d0
d1$provgb <- as.factor(d0$provgb)

# data=fastDummies::dummy_cols(prefLevelTest,select_columns = c("provgb"),remove_first_dummy = TRUE)

## Fit the regression model(Table II Column 2)
reg.dummy<-lm(lngdppc2000~lnmig1127+south+lnhhden1080+lnarea+provgb,data=d1)
summary(reg.dummy)


## regression 3
## Fit the regression model(Table IV Column 1)
## Stage 1

first<-lm(lnmig1127~difmigperiod+shock+south+x_coord+y_coord+coast+dist_ports+dsongrivers+lnarea+lnhhden1080+
            nsden+provgb+lnrice+lnwheat+lnmaize+lnspotato+dist_HZ+change+n_change,data=d1)
summary(first)
m.hat<-fitted.values(first)


second<-ivreg::ivreg(lngdppc2000~lnmig1127+shock+south+x_coord+y_coord+coast+dist_ports+dsongrivers
              +lnarea+lnhhden1080+nsden+provgb+lnrice+lnwheat+lnmaize+lnspotato+dist_HZ
              +change+n_change|
                difmigperiod+shock+south+x_coord+y_coord+coast+dist_ports+dsongrivers+lnarea+lnhhden1080
              +lnhhden1080+nsden+provgb+lnrice+lnwheat+lnmaize+lnspotato+dist_HZ+change+n_change,data=d1)
summary(second)


tsls<-lm(lngdppc2000~m.hat+shock+south+x_coord+y_coord+coast+dist_ports+dsongrivers
         +lnarea+lnhhden1080+nsden+provgb+lnrice+lnwheat+lnmaize+lnspotato+dist_HZ
         +change+n_change,data=d1)
summary(tsls)




