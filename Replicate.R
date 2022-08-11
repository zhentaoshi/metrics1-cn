
prefLevelTest <- read.csv(file = "prefLevelTest.csv", header = TRUE)


## regression 1
reg.ols <-lm(lngdppc2000~lnmig1127+south,data=prefLevelTest)
summary(reg.ols)

robust.csv <- sandwich::vcovHC(reg.ols,type="HC1")

print( lmtest::coeftest(reg.ols, vcov. = robust.csv) ) # robust test


## regression 2

data=fastDummies::dummy_cols(prefLevelTest,select_columns = c("provgb"),remove_first_dummy = TRUE)

## Fit the regression model(column 2)
reg.dummy<-lm(lngdppc2000~lnmig1127+south+lnhhden1080+lnarea+provgb_14+provgb_32+provgb_33+provgb_34+provgb_35+provgb_36+provgb_37+provgb_41+provgb_42+provgb_43+provgb_44+provgb_45+provgb_50+provgb_61+provgb_62,data=data)
summary(reg.dummy)
