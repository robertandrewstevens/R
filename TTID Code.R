library(rstan) 
library(LambertW)
set_cppo("fast") 
set_cppo('debug')

alpha.mean=100
alpha.sd=5
beta.mean=1
beta.sd=.05



dat=list(N=1,y=array(1,dim=1),x=array(94.55802,dim=1))



rec.intercept.mean=rep(0,10000)
rec.intercept.sd=rep(0,10000)
rec.slope.mean=rep(0,10000)
rec.slope.sd=rep(0,10000)
rec.decision=rep(0,10000)
rec.sd.decision=rep(0,10000)
rec.ynew=rep(0,10000)
rec.expected.pr=rep(0,10000)




alpha=.5

for(j in 1:10000){

log.code=paste('
data {
  int N;  // number of items
  int y[N];  // binary outcome for item n
  real x[N];  // predictive feature for item n
}
parameters {
  real alpha;  // intercept
  real<lower=0> beta;  // slope
}
model {
  alpha ~ normal(',alpha.mean,',',alpha.sd,');  // weakly informative
  beta ~ normal(',beta.mean,',',beta.sd,');
  for (n in 1:N)
    y[n] ~ bernoulli(1/(1+exp(-(alpha - beta * x[n]))));
}', sep="")
hlm = stan(model_name="log.code", model_code = log.code, data=dat , iter = 2000, n_chains = 2, verbose = FALSE)

hlm.mat=as.matrix(hlm)

  
beta=1/hlm.mat[,2]
const=hlm.mat[,1]

step.1=W(-(alpha-1)*exp(const/beta - 1/alpha + 1)/alpha)
decision=beta*(alpha*step.1-alpha+1)/alpha
pr.new.exp=-(1-alpha)*beta/(alpha*decision)+1

rec.expected.pr[j]=mean(pr.new.exp)  
pr.new=1/(1+exp(-(100-mean(decision))))
ynew=rbinom(1,1,pr.new)


rec.intercept.mean[j]=mean(const)
rec.intercept.sd[j]=sd(const)
rec.slope.mean[j]=mean(beta)
rec.slope.sd[j]=sd(beta)
rec.decision[j]=mean(decision)
rec.sd.decision[j]=sd(decision)
rec.ynew[j]=ynew




dat=list(N=1,y=array(ynew,dim=1),x=array(mean(decision),dim=1))

alpha.mean=mean(const)
alpha.sd=sd(const)
beta.mean=mean(beta)
beta.sd=sd(beta)


}

ttid.dat=cbind(rec.intercept.mean,rec.intercept.sd,rec.slope.mean,rec.slope.sd,rec.decision,rec.sd.decision,rec.ynew,rec.expected.pr)

save(ttid.dat,file="/Users/sweiss/Google Drive/TTID/simulated.dat.RData")
