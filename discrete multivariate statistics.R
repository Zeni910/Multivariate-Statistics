
hiv<-matrix(c(2485, 82, 77, 104), nrow=2, byrow=T)
hiv


dimnames(hiv)<-list(c("HIV-", "HIV+"), c("HIV-", "HIV+"))
names(dimnames(hiv))<-c("females", "males")
hiv
addmargins(hiv)


# overall number infected
2748*0.096

#82+77+104 = 263

# number concordantly infected
2748*0.038

#104

# total number discordantly infected
2748*0.058

#82+77 = 159

#number of female HIV+ in total discordantly infected couples
2748*0.058*0.485

#77

#####

prop.hiv<-prop.table(hiv)

addmargins(prop.hiv)


#H_0:  p_{jk}=p_{j+}p_{+k}, j=1,2;  k=1,2
#H_1:  independence does not hold

total <- sum(hiv)
total


 phat.1plus <- (hiv[1,1]+hiv[1,2])/total
 phat.1plus 
#[1] 0.9341339
 
 phat.2plus <- (hiv[2,1]+hiv[2,2])/total
 phat.2plus
#[1] 0.06586608
 
 phat.plus1 <- (hiv[1,1]+hiv[2,1])/total
 phat.plus1 
#[1] 0.9323144
 
 phat.plus2 <- (hiv[1,2]+hiv[2,2])/total
 phat.plus2 
#[1] 0.06768559


##

#Another method

phat <- (hiv[1,1]+hiv[1,2])/total
phat

1-phat

qhat <- (hiv[1,1]+hiv[2,1])/total
qhat

1-qhat


total*phat*qhat
total*phat*(1-qhat)
total*(1-phat)*qhat
total*(1-phat)*(1-qhat)


##

#compare with the observed proportions
addmargins(prop.hiv)

#calculate expected frequencies

exp.hiv<-matrix(c(total*phat.1plus*phat.plus1, total*phat.1plus*phat.plus2,
            total*phat.2plus*phat.plus1, total*phat.2plus*phat.plus2),
              nrow=2, byrow=T)
exp.hiv

addmargins(exp.hiv)

#compare with observed counts
addmargins(hiv)


hiv.test<-chisq.test(hiv, correct=F)
hiv.test

names(hiv.test)

hiv.test$observed

hiv.test$expected

hiv.test$residuals

hiv.test$residuals^2

hiv.test$stdres

# odds ratio, r

r <- (hiv[2,2]*hiv[1,1])/(hiv[2,1]*hiv[1,2])
r

(2485*104)/(77*82)

num <- 2485/77
num
denom <- 82/104
denom

num/denom

lnr <- log(r)
lnr

ese.lnr <- sqrt((1/hiv[1,1])+(1/hiv[1,2])+(1/hiv[2,1])+(1/hiv[2,2]))
ese.lnr

ci1 <- lnr-2*ese.lnr
ci1

ci2 <- lnr+2*ese.lnr
ci2



