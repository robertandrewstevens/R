> plot.HP.MDP
function()
{
  xyplot(MDP^0.25 ~ HP | HPGroup, data = engine, panel = function(x, y)
  {
    panel.xyplot(x, y)
    panel.loess(x, y, span = 2)
  }
  , layout = c(1, 3, 1))
}
> rm(plot.HP.MDP)
> plot.HP.Income
function()
{
  xyplot(Income ~ HP | ProdGrp, data = engine, panel = function(x, y)
  {
    panel.xyplot(x, y)
    panel.loess(x, y, span = 2)
  }
  , layout = c(1, 3, 1))
}
> rm(plot.HP.Income)
> plot.HP.Incentives
function()
{
  xyplot(Incentives^0.25 ~ HP | HPGroup1, data = engine, panel = function(x, y)
  {
    panel.xyplot(x, y)
    panel.loess(x, y, span = 2)
  }
  , layout = c(1, 2, 1))
}
> rm(plot.HP.Incentives)
> plot.HP.Cost
function()
{
  xyplot(Cost^0.25 ~ HP | HPGroup, data = engine, panel = function(x, y)
  {
    panel.xyplot(x, y)
    panel.loess(x, y, span = 2)
  }
  , layout = c(1, 3, 1))
}
> rm(plot.HP.Cost)
> objects()
[1] ".Last.value"         ".Random.seed"        "A"                   "Airplane"            "Airplane1"           "Airplane1.avas"     
[7] "Airplane1.lm"        "Airplane2"           "Airplane2.lm"        "Airplane2.rp"        "Airplane3"           "Airplane4"          
[13] "AngleBetween"        "BallBearing"         "BallBearing.fit"     "BoxLiu"              "BoxLiu.Y.tree"       "BoxLiu.s.tree"      
[19] "CR3.avas"            "CV.lvq"              "CVprobs"             "CVtest"              "Caligula"            "Caligula.lm"        
[25] "Caligula.rp"         "Cart"                "Cat"                 "Cf"                  "Commodity"           "Commodity.Total"    
[31] "Commodity.rp"        "Commodity.rp1"       "Cooling"             "Cooling.y1"          "Cooling.y2"          "Cooling.y3"         
[37] "Cord"                "Cortol"              "Cp"                  "Cpk"                 "Crnout"              "Cylinder.Loader"    
[43] "DS1"                 "DS1.df"              "Data"                "Diam"                "Distb"               "Emissions"          
[49] "Emissions.rp"        "Emissions.rp.Accel"  "Emissions.rp.CO"     "Emissions.rp.HC"     "Emissions.rp.HCNO"   "Emissions.rp.Lug"   
[55] "Emissions.rp.NO"     "Emissions.rp.Part"   "Emissions.rp.Peak"   "Engine4"             "Engine4.avas"        "Engine4.st"         
[61] "Engine4a"            "Engine4a.st"         "Engine4b"            "Engine4c"            "Errors"              "Flat"               
[67] "L"                   "Lab"                 "Lab1"                "Lemonade"            "Lemonade.lm"         "Lemonade.lm1"       
[73] "Lemonade.rp"         "Lemonade.rp1"        "Lemonade0"           "Lemonade1"           "Lemonade1.RFeedb.lm" "Lemonade1.Satisf.lm"
[79] "Lemonade2"           "Lemonade2.lm"        "Lemonade2.tree"      "Lemonade2.tree1"     "Mason"               "Mee"                
[85] "Mee1"                "Mee2"                "Obara4"              "Obara5"              "Parlel"              "Perp1"              
[91] "Perp2"               "Pos2"                "Profp"               "Rad"                 "Rat"                 "SDF1"               
[97] "SDF2"                "SDF3"                "SDF4"                "SDF5"                "Saran"               "Saran.cv"           
[103] "Saran.rp"            "Saran.tr"            "Satisf.bc"           "Sauer"               "Sauer.Agusta"        "Sauer.Agusta.cv"    
[109] "Sauer.Agusta.pred"   "Sauer.Agusta.tr"     "Sauer.Other"         "Sauer.Other.cv"      "Sauer.Other.pred"    "Sauer.Other.tr"     
[115] "Sauer.cv"            "Sauer.rp"            "Sauer.rp1"           "Sauer.rp2"           "Sauer.rp3"           "Sauer.rp4"          
[121] "Sauer.rp5"           "Sauer.tr"            "Shfit.Sync.rp1"      "Shift"               "Shift.Peak"          "Shift.Peak.rp"      
[127] "Shift.Peak.rp1"      "Shift.Peak.rp2"      "Shift.Sync"          "Shift.Sync.rp"       "Shift.Sync.rp1"      "Shift.Sync.rp2"     
[133] "Shift.rp"            "Span"                "Status"              "Stress"              "T2"                  "Times.iso"          
[139] "Times.sam"           "Torreon"             "Torreon.Emissions"   "Torreon.Smoke"       "Torreon.rp"          "Torreon1"           
[145] "Torreon1.rp"         "Tractor"             "Tractor.rp"          "Tractor.rp1"         "TractorW"            "TractorW.rp"        
[151] "TractorW.rp1"        "UIDE"                "WTier2"              "Waterloo"            "Waterloo.rp"         "Waterloo1"          
[157] "Waterloo1.rp"        "Waterloo2"           "WaterlooR"           "WaterlooR.rp"        "Wing.Area"           "Wing.Area.lo"       
[163] "Wing.Area.loess"     "Wing.Area.mar"       "Wing.Aspect"         "Wing.Aspect.lo"      "Wing.Aspect.loess"   "Wing.Aspect.mar"    
[169] "Wing.Cord"           "Wing.Span"           "Wloo"                "Wloo.pc"             "Wloo.pca"            "WlooR"              
[175] "WlooR.pca"           "WlooT2"              "WlooT2a"             "Z"                   "ability.FA"          "ability.cl"         
[181] "ability.cov"         "allfail"             "allfail.tr"          "allfail.u"           "allfail.u.rp"        "allfail.u.tr"       
[187] "area1"               "bass"                "c.ds"                "c.n"                 "c.q"                 "chi.q"              
[193] "chi.q.ds"            "circle"              "circle.bak"          "circle1"             "clv"                 "con"                
[199] "cor.obj"             "cormatrix"           "cov.obj"             "covmatrix"           "cset"                "cset0"              
[205] "d0"                  "d1"                  "d3"                  "deaths.spc"          "dfReturn"            "dist2"              
[211] "dist2full"           "distp"               "dv"                  "eda.shape"           "eda.shape1"          "engine"             
[217] "engine.avas"         "engine.lm"           "engine.m"            "engine.m.ln"         "engine.rp"           "f"                  
[223] "f1"                  "f2"                  "factcor"             "factcov"             "fd"                  "fgl.iso"            
[229] "fgl.rp2"         "fgl0"            "fgl1"            "fit"             "fsr"             "fsr.ds"          "fsr.n"          
[236] "fsr.q"           "fsrlv"           "ft2"             "gamma.fit"       "gamma.lnL"       "gehan.surv"      "ggamma.fit"     
[243] "ggamma.fit.bak"  "ggamma.lnL"      "ggamma.lnL.bak"  "ggamma.lnLi"     "ggamma.loglike"  "h"               "i"              
[250] "income"          "initial"         "invlog"          "keep"            "last.dump"       "last.warning"    "leuk.wei"       
[257] "logistic"        "lvd"             "lvd.ps.t"        "lvd.t"           "med"             "mid"             "mvsplot"        
[264] "mvz2plot"        "naxes"           "newp"            "np"              "ntimes"          "oblirot"         "p"              
[271] "p.i"             "plot.HP.AdjCost"
> plot.HP.AdjCost
function()
{
  xyplot(AdjCost^0.25 ~ HP | HPGroup, data = engine, panel = function(x, y)
  {
    panel.xyplot(x, y)
    panel.loess(x, y, span = 2)
  }
  , layout = c(1, 3, 1))
}
> rm(plot.HP.AdjCost)
> p.i
function(i, n)
{
  # Median Rank approximation given rank and sample size
  value <- (i - 1/3)/(n + 1/3)
  value
}
> rm(p.i)
> p
[1] 0.01666667 0.05000000 0.08333333 0.11666667 0.15000000 0.18333333 0.21666667 0.25000000 0.28333333 0.31666667 0.35000000 0.38333333
[13] 0.41666667 0.45000000 0.48333333 0.51666667 0.55000000 0.58333333 0.61666667 0.65000000 0.68333333 0.71666667 0.75000000 0.78333333
[25] 0.81666667 0.85000000 0.88333333 0.91666667 0.95000000 0.98333333
> rm(p)
> oblirot
$rmat:
  Factor1  Factor2 
general " 0.379" " 0.513"
picture "      " " 0.640"
blocks "      " " 0.887"
maze "      " " 0.483"
reading " 0.946" "      "
vocab " 0.757" " 0.137"

$correlation:
  [,1]      [,2] 
[1,] 1.0000000 0.3555064
[2,] 0.3555064 1.0000000

$tmat:
  [,1]      [,2] 
[1,]  1.0378436 -0.126036
[2,] -0.2599025  1.062442

$iterations:
  [1] 12

$kappa:
  [1]  0.1666667  1.0000000 -0.1666667 -1.0000000

$normalize:
  [1] T

$orthogonal:
  [1] F

> rm(oblirot)
> objects()
[1] ".Last.value"         ".Random.seed"        "A"                   "Airplane"            "Airplane1"           "Airplane1.avas"     
[7] "Airplane1.lm"        "Airplane2"           "Airplane2.lm"        "Airplane2.rp"        "Airplane3"           "Airplane4"          
[13] "AngleBetween"        "BallBearing"         "BallBearing.fit"     "BoxLiu"              "BoxLiu.Y.tree"       "BoxLiu.s.tree"      
[19] "CR3.avas"            "CV.lvq"              "CVprobs"             "CVtest"              "Caligula"            "Caligula.lm"        
[25] "Caligula.rp"         "Cart"                "Cat"                 "Cf"                  "Commodity"           "Commodity.Total"    
[31] "Commodity.rp"        "Commodity.rp1"       "Cooling"             "Cooling.y1"          "Cooling.y2"          "Cooling.y3"         
[37] "Cord"                "Cortol"              "Cp"                  "Cpk"                 "Crnout"              "Cylinder.Loader"    
[43] "DS1"                 "DS1.df"              "Data"                "Diam"                "Distb"               "Emissions"          
[49] "Emissions.rp"        "Emissions.rp.Accel"  "Emissions.rp.CO"     "Emissions.rp.HC"     "Emissions.rp.HCNO"   "Emissions.rp.Lug"   
[55] "Emissions.rp.NO"     "Emissions.rp.Part"   "Emissions.rp.Peak"   "Engine4"             "Engine4.avas"        "Engine4.st"         
[61] "Engine4a"            "Engine4a.st"         "Engine4b"            "Engine4c"            "Errors"              "Flat"               
[67] "L"                   "Lab"                 "Lab1"                "Lemonade"            "Lemonade.lm"         "Lemonade.lm1"       
[73] "Lemonade.rp"         "Lemonade.rp1"        "Lemonade0"           "Lemonade1"           "Lemonade1.RFeedb.lm" "Lemonade1.Satisf.lm"
[79] "Lemonade2"           "Lemonade2.lm"        "Lemonade2.tree"      "Lemonade2.tree1"     "Mason"               "Mee"                
[85] "Mee1"                "Mee2"                "Obara4"              "Obara5"              "Parlel"              "Perp1"              
[91] "Perp2"               "Pos2"                "Profp"               "Rad"                 "Rat"                 "SDF1"               
[97] "SDF2"                "SDF3"                "SDF4"                "SDF5"                "Saran"               "Saran.cv"           
[103] "Saran.rp"            "Saran.tr"            "Satisf.bc"           "Sauer"               "Sauer.Agusta"        "Sauer.Agusta.cv"    
[109] "Sauer.Agusta.pred"   "Sauer.Agusta.tr"     "Sauer.Other"         "Sauer.Other.cv"      "Sauer.Other.pred"    "Sauer.Other.tr"     
[115] "Sauer.cv"            "Sauer.rp"            "Sauer.rp1"           "Sauer.rp2"           "Sauer.rp3"           "Sauer.rp4"          
[121] "Sauer.rp5"           "Sauer.tr"            "Shfit.Sync.rp1"      "Shift"               "Shift.Peak"          "Shift.Peak.rp"      
[127] "Shift.Peak.rp1"      "Shift.Peak.rp2"      "Shift.Sync"          "Shift.Sync.rp"       "Shift.Sync.rp1"      "Shift.Sync.rp2"     
[133] "Shift.rp"            "Span"                "Status"              "Stress"              "T2"                  "Times.iso"          
[139] "Times.sam"           "Torreon"             "Torreon.Emissions"   "Torreon.Smoke"       "Torreon.rp"          "Torreon1"           
[145] "Torreon1.rp"         "Tractor"             "Tractor.rp"          "Tractor.rp1"         "TractorW"            "TractorW.rp"        
[151] "TractorW.rp1"        "UIDE"                "WTier2"              "Waterloo"            "Waterloo.rp"         "Waterloo1"          
[157] "Waterloo1.rp"        "Waterloo2"           "WaterlooR"           "WaterlooR.rp"        "Wing.Area"           "Wing.Area.lo"       
[163] "Wing.Area.loess"     "Wing.Area.mar"       "Wing.Aspect"         "Wing.Aspect.lo"      "Wing.Aspect.loess"   "Wing.Aspect.mar"    
[169] "Wing.Cord"           "Wing.Span"           "Wloo"                "Wloo.pc"             "Wloo.pca"            "WlooR"              
[175] "WlooR.pca"           "WlooT2"              "WlooT2a"             "Z"                   "ability.FA"          "ability.cl"         
[181] "ability.cov"         "allfail"             "allfail.tr"          "allfail.u"           "allfail.u.rp"        "allfail.u.tr"       
[187] "area1"               "bass"                "c.ds"                "c.n"                 "c.q"                 "chi.q"              
[193] "chi.q.ds"            "circle"              "circle.bak"          "circle1"             "clv"                 "con"                
[199] "cor.obj"             "cormatrix"           "cov.obj"             "covmatrix"           "cset"                "cset0"              
[205] "d0"                  "d1"                  "d3"                  "deaths.spc"          "dfReturn"            "dist2"              
[211] "dist2full"           "distp"               "dv"                  "eda.shape"           "eda.shape1"          "engine"             
[217] "engine.avas"         "engine.lm"           "engine.m"            "engine.m.ln"         "engine.rp"           "f"                  
[223] "f1"                  "f2"                  "factcor"             "factcov"             "fd"                  "fgl.iso"            
[229] "fgl.rp2"        "fgl0"           "fgl1"           "fit"            "fsr"            "fsr.ds"         "fsr.n"          "fsr.q"         
[237] "fsrlv"          "ft2"            "gamma.fit"      "gamma.lnL"      "gehan.surv"     "ggamma.fit"     "ggamma.fit.bak" "ggamma.lnL"    
[245] "ggamma.lnL.bak" "ggamma.lnLi"    "ggamma.loglike" "h"              "i"              "income"         "initial"        "invlog"        
[253] "keep"           "last.dump"      "last.warning"   "leuk.wei"       "logistic"       "lvd"            "lvd.ps.t"       "lvd.t"         
[261] "med"            "mid"            "mvsplot"        "mvz2plot"       "naxes"          "newp"           "np"             "ntimes"        
> ntimes
[1] 0.74344304 1.26016890 1.38888170 1.59207361 0.24642543 1.97884951 2.18372819 0.08511181 0.58133966 2.31034897 0.99142951 0.67321349
[13] 0.58570620 0.03687646 0.03687646 0.15051676 2.39697014 2.17368537 2.24028553 0.64063688 0.19456629 0.77549308 0.90471895 0.15023786
[25] 0.24446992 0.13631884 0.20679911 0.56916133 0.26946312 0.18913664 2.85328696 0.40931173 4.40010113
> rm(ntimes)
> np
[1] 100
> rm(np)
> newp
[1] 0.00000000 0.01010101 0.02020202 0.03030303 0.04040404 0.05050505 0.06060606 0.07070707 0.08080808 0.09090909 0.10101010 0.11111111
[13] 0.12121212 0.13131313 0.14141414 0.15151515 0.16161616 0.17171717 0.18181818 0.19191919 0.20202020 0.21212121 0.22222222 0.23232323
[25] 0.24242424 0.25252525 0.26262626 0.27272727 0.28282828 0.29292929 0.30303030 0.31313131 0.32323232 0.33333333 0.34343434 0.35353535
[37] 0.36363636 0.37373737 0.38383838 0.39393939 0.40404040 0.41414141 0.42424242 0.43434343 0.44444444 0.45454545 0.46464646 0.47474747
[49] 0.48484848 0.49494949 0.50505051 0.51515152 0.52525253 0.53535354 0.54545455 0.55555556 0.56565657 0.57575758 0.58585859 0.59595960
[61] 0.60606061 0.61616162 0.62626263 0.63636364 0.64646465 0.65656566 0.66666667 0.67676768 0.68686869 0.69696970 0.70707071 0.71717172
[73] 0.72727273 0.73737374 0.74747475 0.75757576 0.76767677 0.77777778 0.78787879 0.79797980 0.80808081 0.81818182 0.82828283 0.83838384
[85] 0.84848485 0.85858586 0.86868687 0.87878788 0.88888889 0.89898990 0.90909091 0.91919192 0.92929293 0.93939394 0.94949495 0.95959596
[97] 0.96969697 0.97979798 0.98989899 1.00000000
> rm(newp)
> naxes
[,1]      [,2] 
[1,] 0.9930370 0.1178026
[2,] 0.2429241 0.9700453
> rm(naxes)
> mvz2plot
function(x)
{
  # Mid-versus-Z^2 Plot (EDTTS p. 448 & 477)
  n <- length(x)
  k <- (n + 1)/2
  sort.x <- sort(x)
  sort.p <- p(sort.x)
  if(n %% 2 == 0) {
    #even
    low <- sort.x[1:floor(k)]
    up <- rev(sort.x[(floor(k) + 1):n])
    p.up <- rev(sort.p[(floor(k) + 1):n])
  }
  else {
    #odd
    low <- sort.x[1:(k - 1)]
    up <- rev(sort.x[(k + 1):n])
    p.up <- rev(sort.p[(k + 1):n])
  }
  spread <- up - low
  mv <- mid(low, up)
  z <- qnorm(p.up)
  z2 <- z^2
  plot(z2, mv)
  abline(median(x), 0)
  value <- data.frame(low, up, spread, mv, p.up, z, z2)
  value
}
> rm(mvz2plot)
> 
  
  S-PLUS : Copyright (c) 1988, 2001 Insightful Corp.
S : Copyright Lucent Technologies, Inc.
Professional Edition Version 6.0.2 Release 1 for Microsoft Windows : 200
1 
Working data will be in C:\Program Files\Insightful\splus6\users\rs62172

> objects()
[1] ".Last.value"         ".Random.seed"        "A"                   "Airplane"            "Airplane1"           "Airplane1.avas"     
[7] "Airplane1.lm"        "Airplane2"           "Airplane2.lm"        "Airplane2.rp"        "Airplane3"           "Airplane4"          
[13] "AngleBetween"        "BallBearing"         "BallBearing.fit"     "BoxLiu"              "BoxLiu.Y.tree"       "BoxLiu.s.tree"      
[19] "CR3.avas"            "CV.lvq"              "CVprobs"             "CVtest"              "Caligula"            "Caligula.lm"        
[25] "Caligula.rp"         "Cart"                "Cat"                 "Cf"                  "Commodity"           "Commodity.Total"    
[31] "Commodity.rp"        "Commodity.rp1"       "Cooling"             "Cooling.y1"          "Cooling.y2"          "Cooling.y3"         
[37] "Cord"                "Cortol"              "Cp"                  "Cpk"                 "Crnout"              "Cylinder.Loader"    
[43] "DS1"                 "DS1.df"              "Data"                "Diam"                "Distb"               "Emissions"          
[49] "Emissions.rp"        "Emissions.rp.Accel"  "Emissions.rp.CO"     "Emissions.rp.HC"     "Emissions.rp.HCNO"   "Emissions.rp.Lug"   
[55] "Emissions.rp.NO"     "Emissions.rp.Part"   "Emissions.rp.Peak"   "Engine4"             "Engine4.avas"        "Engine4.st"         
[61] "Engine4a"            "Engine4a.st"         "Engine4b"            "Engine4c"            "Errors"              "Flat"               
[67] "L"                   "Lab"                 "Lab1"                "Lemonade"            "Lemonade.lm"         "Lemonade.lm1"       
[73] "Lemonade.rp"         "Lemonade.rp1"        "Lemonade0"           "Lemonade1"           "Lemonade1.RFeedb.lm" "Lemonade1.Satisf.lm"
[79] "Lemonade2"           "Lemonade2.lm"        "Lemonade2.tree"      "Lemonade2.tree1"     "Mason"               "Mee"                
[85] "Mee1"                "Mee2"                "Obara4"              "Obara5"              "Parlel"              "Perp1"              
[91] "Perp2"               "Pos2"                "Profp"               "Rad"                 "Rat"                 "SDF1"               
[97] "SDF2"                "SDF3"                "SDF4"                "SDF5"                "Saran"               "Saran.cv"           
[103] "Saran.rp"            "Saran.tr"            "Satisf.bc"           "Sauer"               "Sauer.Agusta"        "Sauer.Agusta.cv"    
[109] "Sauer.Agusta.pred"   "Sauer.Agusta.tr"     "Sauer.Other"         "Sauer.Other.cv"      "Sauer.Other.pred"    "Sauer.Other.tr"     
[115] "Sauer.cv"            "Sauer.rp"            "Sauer.rp1"           "Sauer.rp2"           "Sauer.rp3"           "Sauer.rp4"          
[121] "Sauer.rp5"           "Sauer.tr"            "Shfit.Sync.rp1"      "Shift"               "Shift.Peak"          "Shift.Peak.rp"      
[127] "Shift.Peak.rp1"      "Shift.Peak.rp2"      "Shift.Sync"          "Shift.Sync.rp"       "Shift.Sync.rp1"      "Shift.Sync.rp2"     
[133] "Shift.rp"            "Span"                "Status"              "Stress"              "T2"                  "Times.iso"          
[139] "Times.sam"           "Torreon"             "Torreon.Emissions"   "Torreon.Smoke"       "Torreon.rp"          "Torreon1"           
[145] "Torreon1.rp"         "Tractor"             "Tractor.rp"          "Tractor.rp1"         "TractorW"            "TractorW.rp"        
[151] "TractorW.rp1"        "UIDE"                "WTier2"              "Waterloo"            "Waterloo.rp"         "Waterloo1"          
[157] "Waterloo1.rp"        "Waterloo2"           "WaterlooR"           "WaterlooR.rp"        "Wing.Area"           "Wing.Area.lo"       
[163] "Wing.Area.loess"     "Wing.Area.mar"       "Wing.Aspect"         "Wing.Aspect.lo"      "Wing.Aspect.loess"   "Wing.Aspect.mar"    
[169] "Wing.Cord"           "Wing.Span"           "Wloo"                "Wloo.pc"             "Wloo.pca"            "WlooR"              
[175] "WlooR.pca"           "WlooT2"              "WlooT2a"             "Z"                   "ability.FA"          "ability.cl"         
[181] "ability.cov"         "allfail"             "allfail.tr"          "allfail.u"           "allfail.u.rp"        "allfail.u.tr"       
[187] "area1"               "bass"                "c.ds"                "c.n"                 "c.q"                 "chi.q"              
[193] "chi.q.ds"            "circle"              "circle.bak"          "circle1"             "clv"                 "con"                
[199] "cor.obj"             "cormatrix"           "cov.obj"             "covmatrix"           "cset"                "cset0"              
[205] "d0"                  "d1"                  "d3"                  "deaths.spc"          "dfReturn"            "dist2"              
[211] "dist2full"           "distp"               "dv"                  "eda.shape"           "eda.shape1"          "engine"             
[217] "engine.avas"         "engine.lm"           "engine.m"            "engine.m.ln"         "engine.rp"           "f"                  
[223] "f1"                  "f2"                  "factcor"             "factcov"             "fd"                  "fgl.iso"            
[229] "fgl.rp2"        "fgl0"           "fgl1"           "fit"            "fsr"            "fsr.ds"         "fsr.n"          "fsr.q"         
[237] "fsrlv"          "ft2"            "gamma.fit"      "gamma.lnL"      "gehan.surv"     "ggamma.fit"     "ggamma.fit.bak" "ggamma.lnL"    
[245] "ggamma.lnL.bak" "ggamma.lnLi"    "ggamma.loglike" "h"              "i"              "income"         "initial"        "invlog"        
[253] "keep"           "last.dump"      "last.warning"   "leuk.wei"       "logistic"       "lvd"            "lvd.ps.t"       "lvd.t"         
[261] "med"            "mid"            "mvsplot"       
> mvsplot
function(x)
{
  # Upper-versus-Lower Plot (EDTTS p. 442)
  n <- length(x)
  k <- (n + 1)/2
  sort.x <- sort(x)
  if(n %% 2 == 0) {
    #even
    low <- sort.x[1:floor(k)]
    up <- rev(sort.x[(floor(k) + 1):n])
  }
  else {
    #odd
    low <- sort.x[1:(k - 1)]
    up <- rev(sort.x[(k + 1):n])
  }
  spread <- up - low
  mv <- mid(low, up)
  plot(spread, mv)
  abline(median(x), 0)
  value <- data.frame(low, up, spread, mv)
  value
}
> rm(mvsplot)
> mid
function(x, y)
{
  value <- (x + y)/2
  value
}
> rm(mid)
> med
function(x)
{
  n <- length(x)
  value <- qnorm((rank(x) - 1/3)/(n + 1/3))
  value
}
> rm(med)
> objects()
[1] ".Last.value"         ".Random.seed"        "A"                   "Airplane"            "Airplane1"           "Airplane1.avas"     
[7] "Airplane1.lm"        "Airplane2"           "Airplane2.lm"        "Airplane2.rp"        "Airplane3"           "Airplane4"          
[13] "AngleBetween"        "BallBearing"         "BallBearing.fit"     "BoxLiu"              "BoxLiu.Y.tree"       "BoxLiu.s.tree"      
[19] "CR3.avas"            "CV.lvq"              "CVprobs"             "CVtest"              "Caligula"            "Caligula.lm"        
[25] "Caligula.rp"         "Cart"                "Cat"                 "Cf"                  "Commodity"           "Commodity.Total"    
[31] "Commodity.rp"        "Commodity.rp1"       "Cooling"             "Cooling.y1"          "Cooling.y2"          "Cooling.y3"         
[37] "Cord"                "Cortol"              "Cp"                  "Cpk"                 "Crnout"              "Cylinder.Loader"    
[43] "DS1"                 "DS1.df"              "Data"                "Diam"                "Distb"               "Emissions"          
[49] "Emissions.rp"        "Emissions.rp.Accel"  "Emissions.rp.CO"     "Emissions.rp.HC"     "Emissions.rp.HCNO"   "Emissions.rp.Lug"   
[55] "Emissions.rp.NO"     "Emissions.rp.Part"   "Emissions.rp.Peak"   "Engine4"             "Engine4.avas"        "Engine4.st"         
[61] "Engine4a"            "Engine4a.st"         "Engine4b"            "Engine4c"            "Errors"              "Flat"               
[67] "L"                   "Lab"                 "Lab1"                "Lemonade"            "Lemonade.lm"         "Lemonade.lm1"       
[73] "Lemonade.rp"         "Lemonade.rp1"        "Lemonade0"           "Lemonade1"           "Lemonade1.RFeedb.lm" "Lemonade1.Satisf.lm"
[79] "Lemonade2"           "Lemonade2.lm"        "Lemonade2.tree"      "Lemonade2.tree1"     "Mason"               "Mee"                
[85] "Mee1"                "Mee2"                "Obara4"              "Obara5"              "Parlel"              "Perp1"              
[91] "Perp2"               "Pos2"                "Profp"               "Rad"                 "Rat"                 "SDF1"               
[97] "SDF2"                "SDF3"                "SDF4"                "SDF5"                "Saran"               "Saran.cv"           
[103] "Saran.rp"            "Saran.tr"            "Satisf.bc"           "Sauer"               "Sauer.Agusta"        "Sauer.Agusta.cv"    
[109] "Sauer.Agusta.pred"   "Sauer.Agusta.tr"     "Sauer.Other"         "Sauer.Other.cv"      "Sauer.Other.pred"    "Sauer.Other.tr"     
[115] "Sauer.cv"            "Sauer.rp"            "Sauer.rp1"           "Sauer.rp2"           "Sauer.rp3"           "Sauer.rp4"          
[121] "Sauer.rp5"           "Sauer.tr"            "Shfit.Sync.rp1"      "Shift"               "Shift.Peak"          "Shift.Peak.rp"      
[127] "Shift.Peak.rp1"      "Shift.Peak.rp2"      "Shift.Sync"          "Shift.Sync.rp"       "Shift.Sync.rp1"      "Shift.Sync.rp2"     
[133] "Shift.rp"            "Span"                "Status"              "Stress"              "T2"                  "Times.iso"          
[139] "Times.sam"           "Torreon"             "Torreon.Emissions"   "Torreon.Smoke"       "Torreon.rp"          "Torreon1"           
[145] "Torreon1.rp"         "Tractor"             "Tractor.rp"          "Tractor.rp1"         "TractorW"            "TractorW.rp"        
[151] "TractorW.rp1"        "UIDE"                "WTier2"              "Waterloo"            "Waterloo.rp"         "Waterloo1"          
[157] "Waterloo1.rp"        "Waterloo2"           "WaterlooR"           "WaterlooR.rp"        "Wing.Area"           "Wing.Area.lo"       
[163] "Wing.Area.loess"     "Wing.Area.mar"       "Wing.Aspect"         "Wing.Aspect.lo"      "Wing.Aspect.loess"   "Wing.Aspect.mar"    
[169] "Wing.Cord"           "Wing.Span"           "Wloo"                "Wloo.pc"             "Wloo.pca"            "WlooR"              
[175] "WlooR.pca"           "WlooT2"              "WlooT2a"             "Z"                   "ability.FA"          "ability.cl"         
[181] "ability.cov"         "allfail"             "allfail.tr"          "allfail.u"           "allfail.u.rp"        "allfail.u.tr"       
[187] "area1"               "bass"                "c.ds"                "c.n"                 "c.q"                 "chi.q"              
[193] "chi.q.ds"            "circle"              "circle.bak"          "circle1"             "clv"                 "con"                
[199] "cor.obj"             "cormatrix"           "cov.obj"             "covmatrix"           "cset"                "cset0"              
[205] "d0"                  "d1"                  "d3"                  "deaths.spc"          "dfReturn"            "dist2"              
[211] "dist2full"           "distp"               "dv"                  "eda.shape"           "eda.shape1"          "engine"             
[217] "engine.avas"         "engine.lm"           "engine.m"            "engine.m.ln"         "engine.rp"           "f"                  
[223] "f1"                  "f2"                  "factcor"             "factcov"             "fd"                  "fgl.iso"            
[229] "fgl.rp2"        "fgl0"           "fgl1"           "fit"            "fsr"            "fsr.ds"         "fsr.n"          "fsr.q"         
[237] "fsrlv"          "ft2"            "gamma.fit"      "gamma.lnL"      "gehan.surv"     "ggamma.fit"     "ggamma.fit.bak" "ggamma.lnL"    
[245] "ggamma.lnL.bak" "ggamma.lnLi"    "ggamma.loglike" "h"              "i"              "income"         "initial"        "invlog"        
[253] "keep"           "last.dump"      "last.warning"   "leuk.wei"       "logistic"       "lvd"            "lvd.ps.t"       "lvd.t"         
> lvd.t
function(Tag, LV.L, LV.U, n)
{
  # Letter-value display given table of data (EDTTS p. 421 & 423)
  k <- length(Tag)
  Depth <- rep(0, 5)
  Depth[1] <- (n + 1)/2
  for(i in 2:(k - 1))
    Depth[i] <- (floor(Depth[i - 1]) + 1)/2
  Depth[k] <- 1
  MV <- mid(LV.L, LV.U)
  cat("n = ", n, "\n")
  value <- data.frame(Tag, Depth, LV.L, MV, LV.U)
  value
}
> rm(lvd.t)
> lvd.ps.t
function(Tag, LV.L, LV.U, n)
{
  # Letter-value display given table of data (EDTTS p. 430)
  k <- length(Tag)
  Depth <- rep(0, 5)
  Depth[1] <- (n + 1)/2
  for(i in 2:(k - 1))
    Depth[i] <- (floor(Depth[i - 1]) + 1)/2
  Depth[k] <- 1
  MV <- mid(LV.L, LV.U)
  LS <- LV.U - LV.L
  p.d <- 1 - p.i(Depth, n)
  z.d <- qnorm(p.d)
  LS.N <- 2 * z.d
  PS <- LS/LS.N
  plot(c( - z.d[-1], z.d), c(LV.L[-1], LV.U))
  cat("n = ", n, "\n")
  value <- data.frame(Tag, Depth, LV.L, MV, LV.U, p.d, z.d, LS, PS)
  value
}
> rm(lvd.ps.t)
> objects()
[1] ".Last.value"         ".Random.seed"        "A"                   "Airplane"            "Airplane1"           "Airplane1.avas"     
[7] "Airplane1.lm"        "Airplane2"           "Airplane2.lm"        "Airplane2.rp"        "Airplane3"           "Airplane4"          
[13] "AngleBetween"        "BallBearing"         "BallBearing.fit"     "BoxLiu"              "BoxLiu.Y.tree"       "BoxLiu.s.tree"      
[19] "CR3.avas"            "CV.lvq"              "CVprobs"             "CVtest"              "Caligula"            "Caligula.lm"        
[25] "Caligula.rp"         "Cart"                "Cat"                 "Cf"                  "Commodity"           "Commodity.Total"    
[31] "Commodity.rp"        "Commodity.rp1"       "Cooling"             "Cooling.y1"          "Cooling.y2"          "Cooling.y3"         
[37] "Cord"                "Cortol"              "Cp"                  "Cpk"                 "Crnout"              "Cylinder.Loader"    
[43] "DS1"                 "DS1.df"              "Data"                "Diam"                "Distb"               "Emissions"          
[49] "Emissions.rp"        "Emissions.rp.Accel"  "Emissions.rp.CO"     "Emissions.rp.HC"     "Emissions.rp.HCNO"   "Emissions.rp.Lug"   
[55] "Emissions.rp.NO"     "Emissions.rp.Part"   "Emissions.rp.Peak"   "Engine4"             "Engine4.avas"        "Engine4.st"         
[61] "Engine4a"            "Engine4a.st"         "Engine4b"            "Engine4c"            "Errors"              "Flat"               
[67] "L"                   "Lab"                 "Lab1"                "Lemonade"            "Lemonade.lm"         "Lemonade.lm1"       
[73] "Lemonade.rp"         "Lemonade.rp1"        "Lemonade0"           "Lemonade1"           "Lemonade1.RFeedb.lm" "Lemonade1.Satisf.lm"
[79] "Lemonade2"           "Lemonade2.lm"        "Lemonade2.tree"      "Lemonade2.tree1"     "Mason"               "Mee"                
[85] "Mee1"                "Mee2"                "Obara4"              "Obara5"              "Parlel"              "Perp1"              
[91] "Perp2"               "Pos2"                "Profp"               "Rad"                 "Rat"                 "SDF1"               
[97] "SDF2"                "SDF3"                "SDF4"                "SDF5"                "Saran"               "Saran.cv"           
[103] "Saran.rp"            "Saran.tr"            "Satisf.bc"           "Sauer"               "Sauer.Agusta"        "Sauer.Agusta.cv"    
[109] "Sauer.Agusta.pred"   "Sauer.Agusta.tr"     "Sauer.Other"         "Sauer.Other.cv"      "Sauer.Other.pred"    "Sauer.Other.tr"     
[115] "Sauer.cv"            "Sauer.rp"            "Sauer.rp1"           "Sauer.rp2"           "Sauer.rp3"           "Sauer.rp4"          
[121] "Sauer.rp5"           "Sauer.tr"            "Shfit.Sync.rp1"      "Shift"               "Shift.Peak"          "Shift.Peak.rp"      
[127] "Shift.Peak.rp1"      "Shift.Peak.rp2"      "Shift.Sync"          "Shift.Sync.rp"       "Shift.Sync.rp1"      "Shift.Sync.rp2"     
[133] "Shift.rp"            "Span"                "Status"              "Stress"              "T2"                  "Times.iso"          
[139] "Times.sam"           "Torreon"             "Torreon.Emissions"   "Torreon.Smoke"       "Torreon.rp"          "Torreon1"           
[145] "Torreon1.rp"         "Tractor"             "Tractor.rp"          "Tractor.rp1"         "TractorW"            "TractorW.rp"        
[151] "TractorW.rp1"        "UIDE"                "WTier2"              "Waterloo"            "Waterloo.rp"         "Waterloo1"          
[157] "Waterloo1.rp"        "Waterloo2"           "WaterlooR"           "WaterlooR.rp"        "Wing.Area"           "Wing.Area.lo"       
[163] "Wing.Area.loess"     "Wing.Area.mar"       "Wing.Aspect"         "Wing.Aspect.lo"      "Wing.Aspect.loess"   "Wing.Aspect.mar"    
[169] "Wing.Cord"           "Wing.Span"           "Wloo"                "Wloo.pc"             "Wloo.pca"            "WlooR"              
[175] "WlooR.pca"           "WlooT2"              "WlooT2a"             "Z"                   "ability.FA"          "ability.cl"         
[181] "ability.cov"         "allfail"             "allfail.tr"          "allfail.u"           "allfail.u.rp"        "allfail.u.tr"       
[187] "area1"               "bass"                "c.ds"                "c.n"                 "c.q"                 "chi.q"              
[193] "chi.q.ds"            "circle"              "circle.bak"          "circle1"             "clv"                 "con"                
[199] "cor.obj"             "cormatrix"           "cov.obj"             "covmatrix"           "cset"                "cset0"              
[205] "d0"                  "d1"                  "d3"                  "deaths.spc"          "dfReturn"            "dist2"              
[211] "dist2full"           "distp"               "dv"                  "eda.shape"           "eda.shape1"          "engine"             
[217] "engine.avas"         "engine.lm"           "engine.m"            "engine.m.ln"         "engine.rp"           "f"                  
[223] "f1"                  "f2"                  "factcor"             "factcov"             "fd"                  "fgl.iso"            
[229] "fgl.rp2"        "fgl0"           "fgl1"           "fit"            "fsr"            "fsr.ds"         "fsr.n"          "fsr.q"         
[237] "fsrlv"          "ft2"            "gamma.fit"      "gamma.lnL"      "gehan.surv"     "ggamma.fit"     "ggamma.fit.bak" "ggamma.lnL"    
[245] "ggamma.lnL.bak" "ggamma.lnLi"    "ggamma.loglike" "h"              "i"              "income"         "initial"        "invlog"        
[253] "keep"           "last.dump"      "last.warning"   "leuk.wei"       "logistic"       "lvd"           
> lvd
function(x)
{
  # Letter-value display (EDTTS p. 421 & 423)
  n <- length(x)
  Tag <- c("M", "F", "E", "D", " ")
  Depth <- rep(0, 5)
  Depth[1] <- (n + 1)/2
  for(i in 2:4)
    Depth[i] <- (floor(Depth[i - 1]) + 1)/2
  Depth[5] <- 1
  sort.x <- sort(x)
  LV.L <- rep(0, 5)
  LV.L[1] <- median(x)
  LV.L[2] <- mid(sort.x[5], sort.x[6])
  LV.L[3] <- sort.x[3]
  LV.L[4] <- sort.x[2]
  LV.L[5] <- min(x)
  LV.U <- rep(0, 5)
  LV.U[1] <- median(x)
  LV.U[2] <- mid(sort.x[n - 4], sort.x[n - 5])
  LV.U[3] <- sort.x[n - 2]
  LV.U[4] <- sort.x[n - 1]
  LV.U[5] <- max(x)
  MV <- mid(LV.L, LV.U)
  value <- data.frame(Tag, Depth, LV.L, MV, LV.U)
  value
}
> rm(lvd)
> logistic
function(x)
{
  log(x/(1 - x))
}
> rm(logistic)
> luek.wei
Problem: Object "luek.wei" not found 
Use traceback() to see the call stack
> objects()
[1] ".Last.value"         ".Random.seed"        "A"                   "Airplane"            "Airplane1"           "Airplane1.avas"     
[7] "Airplane1.lm"        "Airplane2"           "Airplane2.lm"        "Airplane2.rp"        "Airplane3"           "Airplane4"          
[13] "AngleBetween"        "BallBearing"         "BallBearing.fit"     "BoxLiu"              "BoxLiu.Y.tree"       "BoxLiu.s.tree"      
[19] "CR3.avas"            "CV.lvq"              "CVprobs"             "CVtest"              "Caligula"            "Caligula.lm"        
[25] "Caligula.rp"         "Cart"                "Cat"                 "Cf"                  "Commodity"           "Commodity.Total"    
[31] "Commodity.rp"        "Commodity.rp1"       "Cooling"             "Cooling.y1"          "Cooling.y2"          "Cooling.y3"         
[37] "Cord"                "Cortol"              "Cp"                  "Cpk"                 "Crnout"              "Cylinder.Loader"    
[43] "DS1"                 "DS1.df"              "Data"                "Diam"                "Distb"               "Emissions"          
[49] "Emissions.rp"        "Emissions.rp.Accel"  "Emissions.rp.CO"     "Emissions.rp.HC"     "Emissions.rp.HCNO"   "Emissions.rp.Lug"   
[55] "Emissions.rp.NO"     "Emissions.rp.Part"   "Emissions.rp.Peak"   "Engine4"             "Engine4.avas"        "Engine4.st"         
[61] "Engine4a"            "Engine4a.st"         "Engine4b"            "Engine4c"            "Errors"              "Flat"               
[67] "L"                   "Lab"                 "Lab1"                "Lemonade"            "Lemonade.lm"         "Lemonade.lm1"       
[73] "Lemonade.rp"         "Lemonade.rp1"        "Lemonade0"           "Lemonade1"           "Lemonade1.RFeedb.lm" "Lemonade1.Satisf.lm"
[79] "Lemonade2"           "Lemonade2.lm"        "Lemonade2.tree"      "Lemonade2.tree1"     "Mason"               "Mee"                
[85] "Mee1"                "Mee2"                "Obara4"              "Obara5"              "Parlel"              "Perp1"              
[91] "Perp2"               "Pos2"                "Profp"               "Rad"                 "Rat"                 "SDF1"               
[97] "SDF2"                "SDF3"                "SDF4"                "SDF5"                "Saran"               "Saran.cv"           
[103] "Saran.rp"            "Saran.tr"            "Satisf.bc"           "Sauer"               "Sauer.Agusta"        "Sauer.Agusta.cv"    
[109] "Sauer.Agusta.pred"   "Sauer.Agusta.tr"     "Sauer.Other"         "Sauer.Other.cv"      "Sauer.Other.pred"    "Sauer.Other.tr"     
[115] "Sauer.cv"            "Sauer.rp"            "Sauer.rp1"           "Sauer.rp2"           "Sauer.rp3"           "Sauer.rp4"          
[121] "Sauer.rp5"           "Sauer.tr"            "Shfit.Sync.rp1"      "Shift"               "Shift.Peak"          "Shift.Peak.rp"      
[127] "Shift.Peak.rp1"      "Shift.Peak.rp2"      "Shift.Sync"          "Shift.Sync.rp"       "Shift.Sync.rp1"      "Shift.Sync.rp2"     
[133] "Shift.rp"            "Span"                "Status"              "Stress"              "T2"                  "Times.iso"          
[139] "Times.sam"           "Torreon"             "Torreon.Emissions"   "Torreon.Smoke"       "Torreon.rp"          "Torreon1"           
[145] "Torreon1.rp"         "Tractor"             "Tractor.rp"          "Tractor.rp1"         "TractorW"            "TractorW.rp"        
[151] "TractorW.rp1"        "UIDE"                "WTier2"              "Waterloo"            "Waterloo.rp"         "Waterloo1"          
[157] "Waterloo1.rp"        "Waterloo2"           "WaterlooR"           "WaterlooR.rp"        "Wing.Area"           "Wing.Area.lo"       
[163] "Wing.Area.loess"     "Wing.Area.mar"       "Wing.Aspect"         "Wing.Aspect.lo"      "Wing.Aspect.loess"   "Wing.Aspect.mar"    
[169] "Wing.Cord"           "Wing.Span"           "Wloo"                "Wloo.pc"             "Wloo.pca"            "WlooR"              
[175] "WlooR.pca"           "WlooT2"              "WlooT2a"             "Z"                   "ability.FA"          "ability.cl"         
[181] "ability.cov"         "allfail"             "allfail.tr"          "allfail.u"           "allfail.u.rp"        "allfail.u.tr"       
[187] "area1"               "bass"                "c.ds"                "c.n"                 "c.q"                 "chi.q"              
[193] "chi.q.ds"            "circle"              "circle.bak"          "circle1"             "clv"                 "con"                
[199] "cor.obj"             "cormatrix"           "cov.obj"             "covmatrix"           "cset"                "cset0"              
[205] "d0"                  "d1"                  "d3"                  "deaths.spc"          "dfReturn"            "dist2"              
[211] "dist2full"           "distp"               "dv"                  "eda.shape"           "eda.shape1"          "engine"             
[217] "engine.avas"         "engine.lm"           "engine.m"            "engine.m.ln"         "engine.rp"           "f"                  
[223] "f1"                  "f2"                  "factcor"             "factcov"             "fd"                  "fgl.iso"            
[229] "fgl.rp2"        "fgl0"           "fgl1"           "fit"            "fsr"            "fsr.ds"         "fsr.n"          "fsr.q"         
[237] "fsrlv"          "ft2"            "gamma.fit"      "gamma.lnL"      "gehan.surv"     "ggamma.fit"     "ggamma.fit.bak" "ggamma.lnL"    
[245] "ggamma.lnL.bak" "ggamma.lnLi"    "ggamma.loglike" "h"              "i"              "income"         "initial"        "invlog"        
[253] "keep"           "last.dump"      "last.warning"   "leuk.wei"      
> leuk.wei
Call:
  survReg(formula = Surv(time) ~ ag + log(wbc), data = leuk)

Coefficients:
  (Intercept)        ag   log(wbc) 
6.362753 0.5103046 -0.3103361

Scale= 1.040689 

Loglik(model)= -146.5   Loglik(intercept only)= -153.6
Chisq= 14.18 on 2 degrees of freedom, p= 0.00084 
n= 33 
> rm(leuk.wei)
> keep
1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50 
T T T T F F T T T  F  F  T  F  F  F  T  F  T  F  T  T  T  T  T  T  T  F  T  F  T  F  T  T  T  F  F  T  T  T  T  F  F  F  F  T  F  T  T  T  T

51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 81 82 83 84 85 86 87 88 89 90 91 92 93 94 95 96 97 
T  T  F  T  F  F  F  T  T  F  T  F  F  F  T  T  F  F  F  T  F  T  T  T  T  F  F  F  T  T  F  F  T  F  F  T  T  F  F  F  F  F  T  T  F  F  T

98 99 100 101 102 103 104 105 106 107 108 109 110 111 112 113 114 115 116 117 118 119 120 121 122 123 124 125 126 127 128 129 130 131 132 
F  F   T   T   T   T   T   F   T   T   T   F   F   F   T   T   F   F   T   F   T   T   F   T   F   F   T   F   T   T   F   T   T   F   F

133 134 135 136 137 138 139 140 141 142 143 144 145 146 147 148 149 150 151 152 153 154 155 156 157 158 159 160 161 162 163 164 165 166 167 
F   F   F   T   T   F   F   T   T   T   T   F   T   T   F   T   F   T   T   F   T   T   T   T   F   T   T   F   T   T   F   T   F   T   T

168 169 170 171 172 173 174 175 176 177 178 179 180 181 182 183 184 185 186 187 188 189 190 191 192 193 194 195 196 197 198 199 200 201 202 
T   T   T   T   T   T   F   F   T   T   T   T   T   T   T   F   F   T   F   F   T   T   T   T   T   T   T   T   T   T   F   T   F   T   T

203 204 205 206 207 208 209 210 211 212 213 214 215 216 217 218 219 220 221 222 223 224 225 226 227 228 229 230 231 232 233 234 235 236 237 
F   T   F   F   T   T   T   F   T   F   T   F   T   T   F   T   T   T   T   F   F   T   F   T   T   T   T   T   F   T   T   T   T   T   T

238 239 240 241 242 243 244 245 246 247 248 249 250 
T   T   T   F   T   F   T   F   F   T   F   F   T
> rm(keep)
> objects()
[1] ".Last.value"         ".Random.seed"        "A"                   "Airplane"            "Airplane1"           "Airplane1.avas"     
[7] "Airplane1.lm"        "Airplane2"           "Airplane2.lm"        "Airplane2.rp"        "Airplane3"           "Airplane4"          
[13] "AngleBetween"        "BallBearing"         "BallBearing.fit"     "BoxLiu"              "BoxLiu.Y.tree"       "BoxLiu.s.tree"      
[19] "CR3.avas"            "CV.lvq"              "CVprobs"             "CVtest"              "Caligula"            "Caligula.lm"        
[25] "Caligula.rp"         "Cart"                "Cat"                 "Cf"                  "Commodity"           "Commodity.Total"    
[31] "Commodity.rp"        "Commodity.rp1"       "Cooling"             "Cooling.y1"          "Cooling.y2"          "Cooling.y3"         
[37] "Cord"                "Cortol"              "Cp"                  "Cpk"                 "Crnout"              "Cylinder.Loader"    
[43] "DS1"                 "DS1.df"              "Data"                "Diam"                "Distb"               "Emissions"          
[49] "Emissions.rp"        "Emissions.rp.Accel"  "Emissions.rp.CO"     "Emissions.rp.HC"     "Emissions.rp.HCNO"   "Emissions.rp.Lug"   
[55] "Emissions.rp.NO"     "Emissions.rp.Part"   "Emissions.rp.Peak"   "Engine4"             "Engine4.avas"        "Engine4.st"         
[61] "Engine4a"            "Engine4a.st"         "Engine4b"            "Engine4c"            "Errors"              "Flat"               
[67] "L"                   "Lab"                 "Lab1"                "Lemonade"            "Lemonade.lm"         "Lemonade.lm1"       
[73] "Lemonade.rp"         "Lemonade.rp1"        "Lemonade0"           "Lemonade1"           "Lemonade1.RFeedb.lm" "Lemonade1.Satisf.lm"
[79] "Lemonade2"           "Lemonade2.lm"        "Lemonade2.tree"      "Lemonade2.tree1"     "Mason"               "Mee"                
[85] "Mee1"                "Mee2"                "Obara4"              "Obara5"              "Parlel"              "Perp1"              
[91] "Perp2"               "Pos2"                "Profp"               "Rad"                 "Rat"                 "SDF1"               
[97] "SDF2"                "SDF3"                "SDF4"                "SDF5"                "Saran"               "Saran.cv"           
[103] "Saran.rp"            "Saran.tr"            "Satisf.bc"           "Sauer"               "Sauer.Agusta"        "Sauer.Agusta.cv"    
[109] "Sauer.Agusta.pred"   "Sauer.Agusta.tr"     "Sauer.Other"         "Sauer.Other.cv"      "Sauer.Other.pred"    "Sauer.Other.tr"     
[115] "Sauer.cv"            "Sauer.rp"            "Sauer.rp1"           "Sauer.rp2"           "Sauer.rp3"           "Sauer.rp4"          
[121] "Sauer.rp5"           "Sauer.tr"            "Shfit.Sync.rp1"      "Shift"               "Shift.Peak"          "Shift.Peak.rp"      
[127] "Shift.Peak.rp1"      "Shift.Peak.rp2"      "Shift.Sync"          "Shift.Sync.rp"       "Shift.Sync.rp1"      "Shift.Sync.rp2"     
[133] "Shift.rp"            "Span"                "Status"              "Stress"              "T2"                  "Times.iso"          
[139] "Times.sam"           "Torreon"             "Torreon.Emissions"   "Torreon.Smoke"       "Torreon.rp"          "Torreon1"           
[145] "Torreon1.rp"         "Tractor"             "Tractor.rp"          "Tractor.rp1"         "TractorW"            "TractorW.rp"        
[151] "TractorW.rp1"        "UIDE"                "WTier2"              "Waterloo"            "Waterloo.rp"         "Waterloo1"          
[157] "Waterloo1.rp"        "Waterloo2"           "WaterlooR"           "WaterlooR.rp"        "Wing.Area"           "Wing.Area.lo"       
[163] "Wing.Area.loess"     "Wing.Area.mar"       "Wing.Aspect"         "Wing.Aspect.lo"      "Wing.Aspect.loess"   "Wing.Aspect.mar"    
[169] "Wing.Cord"           "Wing.Span"           "Wloo"                "Wloo.pc"             "Wloo.pca"            "WlooR"              
[175] "WlooR.pca"           "WlooT2"              "WlooT2a"             "Z"                   "ability.FA"          "ability.cl"         
[181] "ability.cov"         "allfail"             "allfail.tr"          "allfail.u"           "allfail.u.rp"        "allfail.u.tr"       
[187] "area1"               "bass"                "c.ds"                "c.n"                 "c.q"                 "chi.q"              
[193] "chi.q.ds"            "circle"              "circle.bak"          "circle1"             "clv"                 "con"                
[199] "cor.obj"             "cormatrix"           "cov.obj"             "covmatrix"           "cset"                "cset0"              
[205] "d0"                  "d1"                  "d3"                  "deaths.spc"          "dfReturn"            "dist2"              
[211] "dist2full"           "distp"               "dv"                  "eda.shape"           "eda.shape1"          "engine"             
[217] "engine.avas"         "engine.lm"           "engine.m"            "engine.m.ln"         "engine.rp"           "f"                  
[223] "f1"                  "f2"                  "factcor"             "factcov"             "fd"                  "fgl.iso"            
[229] "fgl.rp2"        "fgl0"           "fgl1"           "fit"            "fsr"            "fsr.ds"         "fsr.n"          "fsr.q"         
[237] "fsrlv"          "ft2"            "gamma.fit"      "gamma.lnL"      "gehan.surv"     "ggamma.fit"     "ggamma.fit.bak" "ggamma.lnL"    
[245] "ggamma.lnL.bak" "ggamma.lnLi"    "ggamma.loglike" "h"              "i"              "income"         "initial"        "invlog"        
[253] "last.dump"      "last.warning"  
> invlog
function(x)
{
  # inverse of logistic function
  exp(x)/(1 + exp(x))
}
> rm(invlog)
> initial
Dim1     Dim2     Dim3     Dim4     Dim5     Dim6 
[1,] 40.43277 3.570611 3.907633 7.636133 1.346233 36.08456
[2,] 40.42868 3.574221 4.663889 7.635277 1.339021 36.07041
[3,] 40.42820 3.560800 4.650500 7.637300 1.342400 36.69800
> rm(initial)
> income
Low      Up 
M 3480.0  3480.0
F 2412.0  4944.0
E 1788.0  6443.0
D 1517.0  7284.0
C 1248.0  8350.0
B  963.5  8994.0
A  727.5  9754.5
Z  579.0 10210.0
Y  345.0 10675.5
NA  114.0 10874.0
> rm(income)
> i
[1]  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19
> rm(i)
> h
$merge:
  integer matrix: 149 rows, 2 columns. 
[,1] [,2] 
[1,]   -1  -18
[2,]   -2  -17
[3,]   -3  -19
[4,]   -4  -20
[5,]   -5  -30
[6,]   -8  -23
[7,]   -9  -26
[8,]  -10  -25
[9,]  -11  -27
[10,]  -12  -28
[11,]  -13  -21
[12,]  -14  -22
[13,]  -15  -31
[14,]  -16  -32
[15,]    6  -24
[16,]    8  -38
[17,]    7  -37
[18,]  -29  -33
[19,]  -34  -58
[20,]  -35  -63
[21,]  -36  -69
[22,]  -41  -73
[23,]  -42  -74
[24,]  -44  -75
[25,]  -45  -76
[26,]  -46  -77
[27,]  -47  -80
[28,]  -48  -85
[29,]  -49  -86
[30,]  -50  -91
[31,]  -51  -94
[32,]  -52  -95
[33,]  -57 -102
[34,]  -59 -105
[35,]  -60 -106
[36,]  -61 -107
[37,]  -62 -108
[,1] [,2] 
[38,]  -65 -109
[39,]  -66 -110
[40,]  -67 -111
[41,]  -68 -112
[42,]  -70 -114
[43,]  -71 -115
[44,]  -72 -116
[45,]  -78 -117
[46,]  -79 -118
[47,]  -81 -120
[48,]  -82 -121
[49,]  -83  -84
[50,]   49 -122
[51,]  -87 -123
[52,]  -88 -124
[53,]  -89 -125
[54,]  -90 -126
[55,]  -92 -127
[56,]  -93 -128
[57,] -100 -129
[58,] -101 -130
[59,] -103 -131
[60,] -104 -132
[61,] -119 -135
[62,]   24   25
[63,]    3    4
[64,]   18   19
[65,]   17   16
[66,]   11   40
[67,]  -43   20
[68,]   10  -39
[69,]    2    1
[70,]   34   35
[71,]   38   39
[72,]   29   55
[73,]   27   65
[74,]   62   67
[,1] [,2] 
[75,]   44   73
[76,]   14   59
[77,]   31   75
[78,]   12   48
[79,]   15   21
[80,]   77   78
[81,]   -6 -143
[82,] -136   74
[83,]  -40   71
[84,] -133   81
[85,]   32   45
[86,]    9   68
[87,]   82   86
[88,]   47   80
[89,]   41   87
[90,]   56   88
[91,]   84   89
[92,]  -54  -55
[93,]   26   91
[94,]    5   64
[95,]  -99   57
[96,]   37   93
[97,]   69   70
[98,]   96   97
[99,]   43   83
[100,] -140 -150
[101,]   85   98
[102,]   -7 -134
[103,]   42   99
[104,]   30 -113
[105,]   94  101
[106,]   66  105
[107,]   53   90
[108,] -148  100
[109,]   72  107
[110,]   52  109
[111,]  104  110
[,1] [,2] 
[112,]   36  106
[113,] -142  112
[114,]  111  113
[115,]   28  114
[116,]   51  115
[117,]   79  116
[118,]  102  117
[119,]   33   76
[120,]  -53   60
[121,] -139 -147
[122,]  -97  -98
[123,]   13  119
[124,]  120  123
[125,]   23  103
[126,]  -64  118
[127,]  125  126
[128,]   95  121
[129,]   92  124
[130,] -137  108
[131,]   22  127
[132,]   63  131
[133,] -144  132
[134,] -145  128
[135,] -138  130
[136,]  122  129
[137,]   54   61
[138,]  135  136
[139,]  -96  138
[140,]   58  137
[141,]  133  140
[142,]   50  141
[143,]  134  139
[144,]  142  143
[145,]   46  144
[146,]  -56  145
[147,] -149  146
[148,] -146  147
[,1] [,2] 
[149,] -141  148

$height:
  [1] 0.0000000 0.0000000 0.0000000 0.0000000 0.0000000 0.0000000 0.0000000 0.0000000 0.0000000 0.0000000 0.0000000 0.0000000 0.0000000
[14] 0.0000000 0.0000000 0.0000000 0.0000000 0.0000000 0.0000000 0.0000000 0.0000000 0.0000000 0.0000000 0.0000000 0.0000000 0.0000000
[27] 0.0000000 0.0000000 0.0000000 0.0000000 0.0000000 0.0000000 0.0000000 0.0000000 0.0000000 0.0000000 0.0000000 0.0000000 0.0000000
[40] 0.0000000 0.0000000 0.0000000 0.0000000 0.0000000 0.0000000 0.0000000 0.0000000 0.0000000 0.0000000 0.0000000 0.0000000 0.0000000
[53] 0.0000000 0.0000000 0.0000000 0.0000000 0.0000000 0.0000000 0.0000000 0.0000000 0.0000000 0.1393764 0.1490292 0.1881343 0.1985530
[66] 0.2036816 0.2266010 0.2573805 0.2795422 0.2834437 0.2915010 0.2931128 0.3044665 0.3084293 0.3143636 0.3237769 0.3288258 0.3308819
[79] 0.3310617 0.3311129 0.3338714 0.3372326 0.3437163 0.3444577 0.3496885 0.3509100 0.3527097 0.3587717 0.3653576 0.3685720 0.3747324
[92] 0.3759609 0.3772651 0.3775628 0.3783729 0.3809511 0.3843864 0.3873173 0.3899584 0.4090746 0.4096266 0.4106230 0.4262604 0.4349914
[105] 0.4373702 0.4427491 0.4571288 0.4629702 0.4687918 0.4878907 0.4921843 0.4934065 0.5114143 0.5164562 0.5186702 0.5197192 0.5411426
[118] 0.5473177 0.5532908 0.5547635 0.5562367 0.5579900 0.5635471 0.5676929 0.5713003 0.5725052 0.5744117 0.5760425 0.5805012 0.5877849
[131] 0.5883096 0.5935753 0.5969075 0.6140131 0.6492012 0.6499732 0.6519244 0.6525633 0.6558735 0.6577038 0.6591024 0.6731240 0.6802906
[144] 0.6890626 0.7455404 0.8472537 1.0066844 1.0682977 1.3889319

$order:
  [1] 141 146 149  56  79 118  83  84 122 144   3  19   4  20  41  73  42  74  70 114  71 115  40  65 109  66 110  64   7 134   8  23  24  36
[35]  69  87 123  48  85  50  91 113  88 124  49  86  92 127  89 125  93 128  81 120  51  94  72 116  47  80   9  26  37  10  25  38  14  22
[69]  82 121 142  61 107  13  21  67 111   5  30  29  33  34  58  52  95  78 117  62 108  46  77 133   6 143  68 112 136  44  75  45  76  43
[103]  35  63  11  27  12  28  39   2  17   1  18  59 105  60 106 101 130  90 126 119 135 145  99 100 129 139 147  96 138 137 148 140 150  97
[137]  98  54  55  53 104 132  15  31  57 102  16  32 103 131

> rm(h)
> objects()
[1] ".Last.value"         ".Random.seed"        "A"                   "Airplane"            "Airplane1"           "Airplane1.avas"     
[7] "Airplane1.lm"        "Airplane2"           "Airplane2.lm"        "Airplane2.rp"        "Airplane3"           "Airplane4"          
[13] "AngleBetween"        "BallBearing"         "BallBearing.fit"     "BoxLiu"              "BoxLiu.Y.tree"       "BoxLiu.s.tree"      
[19] "CR3.avas"            "CV.lvq"              "CVprobs"             "CVtest"              "Caligula"            "Caligula.lm"        
[25] "Caligula.rp"         "Cart"                "Cat"                 "Cf"                  "Commodity"           "Commodity.Total"    
[31] "Commodity.rp"        "Commodity.rp1"       "Cooling"             "Cooling.y1"          "Cooling.y2"          "Cooling.y3"         
[37] "Cord"                "Cortol"              "Cp"                  "Cpk"                 "Crnout"              "Cylinder.Loader"    
[43] "DS1"                 "DS1.df"              "Data"                "Diam"                "Distb"               "Emissions"          
[49] "Emissions.rp"        "Emissions.rp.Accel"  "Emissions.rp.CO"     "Emissions.rp.HC"     "Emissions.rp.HCNO"   "Emissions.rp.Lug"   
[55] "Emissions.rp.NO"     "Emissions.rp.Part"   "Emissions.rp.Peak"   "Engine4"             "Engine4.avas"        "Engine4.st"         
[61] "Engine4a"            "Engine4a.st"         "Engine4b"            "Engine4c"            "Errors"              "Flat"               
[67] "L"                   "Lab"                 "Lab1"                "Lemonade"            "Lemonade.lm"         "Lemonade.lm1"       
[73] "Lemonade.rp"         "Lemonade.rp1"        "Lemonade0"           "Lemonade1"           "Lemonade1.RFeedb.lm" "Lemonade1.Satisf.lm"
[79] "Lemonade2"           "Lemonade2.lm"        "Lemonade2.tree"      "Lemonade2.tree1"     "Mason"               "Mee"                
[85] "Mee1"                "Mee2"                "Obara4"              "Obara5"              "Parlel"              "Perp1"              
[91] "Perp2"               "Pos2"                "Profp"               "Rad"                 "Rat"                 "SDF1"               
[97] "SDF2"                "SDF3"                "SDF4"                "SDF5"                "Saran"               "Saran.cv"           
[103] "Saran.rp"            "Saran.tr"            "Satisf.bc"           "Sauer"               "Sauer.Agusta"        "Sauer.Agusta.cv"    
[109] "Sauer.Agusta.pred"   "Sauer.Agusta.tr"     "Sauer.Other"         "Sauer.Other.cv"      "Sauer.Other.pred"    "Sauer.Other.tr"     
[115] "Sauer.cv"            "Sauer.rp"            "Sauer.rp1"           "Sauer.rp2"           "Sauer.rp3"           "Sauer.rp4"          
[121] "Sauer.rp5"           "Sauer.tr"            "Shfit.Sync.rp1"      "Shift"               "Shift.Peak"          "Shift.Peak.rp"      
[127] "Shift.Peak.rp1"      "Shift.Peak.rp2"      "Shift.Sync"          "Shift.Sync.rp"       "Shift.Sync.rp1"      "Shift.Sync.rp2"     
[133] "Shift.rp"            "Span"                "Status"              "Stress"              "T2"                  "Times.iso"          
[139] "Times.sam"           "Torreon"             "Torreon.Emissions"   "Torreon.Smoke"       "Torreon.rp"          "Torreon1"           
[145] "Torreon1.rp"         "Tractor"             "Tractor.rp"          "Tractor.rp1"         "TractorW"            "TractorW.rp"        
[151] "TractorW.rp1"        "UIDE"                "WTier2"              "Waterloo"            "Waterloo.rp"         "Waterloo1"          
[157] "Waterloo1.rp"        "Waterloo2"           "WaterlooR"           "WaterlooR.rp"        "Wing.Area"           "Wing.Area.lo"       
[163] "Wing.Area.loess"     "Wing.Area.mar"       "Wing.Aspect"         "Wing.Aspect.lo"      "Wing.Aspect.loess"   "Wing.Aspect.mar"    
[169] "Wing.Cord"           "Wing.Span"           "Wloo"                "Wloo.pc"             "Wloo.pca"            "WlooR"              
[175] "WlooR.pca"           "WlooT2"              "WlooT2a"             "Z"                   "ability.FA"          "ability.cl"         
[181] "ability.cov"         "allfail"             "allfail.tr"          "allfail.u"           "allfail.u.rp"        "allfail.u.tr"       
[187] "area1"               "bass"                "c.ds"                "c.n"                 "c.q"                 "chi.q"              
[193] "chi.q.ds"            "circle"              "circle.bak"          "circle1"             "clv"                 "con"                
[199] "cor.obj"             "cormatrix"           "cov.obj"             "covmatrix"           "cset"                "cset0"              
[205] "d0"                  "d1"                  "d3"                  "deaths.spc"          "dfReturn"            "dist2"              
[211] "dist2full"           "distp"               "dv"                  "eda.shape"           "eda.shape1"          "engine"             
[217] "engine.avas"         "engine.lm"           "engine.m"            "engine.m.ln"         "engine.rp"           "f"                  
[223] "f1"                  "f2"                  "factcor"             "factcov"             "fd"                  "fgl.iso"            
[229] "fgl.rp2"        "fgl0"           "fgl1"           "fit"            "fsr"            "fsr.ds"         "fsr.n"          "fsr.q"         
[237] "fsrlv"          "ft2"            "gamma.fit"      "gamma.lnL"      "gehan.surv"     "ggamma.fit"     "ggamma.fit.bak" "ggamma.lnL"    
[245] "ggamma.lnL.bak" "ggamma.lnLi"    "ggamma.loglike" "last.dump"      "last.warning"  
> ggamma.loglike
function(data, mu, sigma, lambda)
{
  # Generalized Gamma Log Likelihood in original scale (not log scale)
  # For Uncensored data only
  # Based on Lawless, p. 244
  #
  n <- length(data)
  k <- 1/lambda^2
  beta <- lambda/sigma
  theta <- exp(mu - (sigma * log(1/lambda^2))/lambda)
  y <- data/theta
  sum1 <- sum(log(y))
  sum2 <- sum(y^beta)
  value <- n * log(beta) - n * lgamma(k) - n * log(theta) + (k * beta - 1) * sum1 - sum2
  value
}
> rm(ggamma.loglike)
> ggamma.lnLi
function(data, mu, sigma, lambda)
{
  # Generalized Gamma Log Likelihood - Individual value
  # For Uncensored data only
  # Based on Lawless, p. 242
  #
  k <- 1/lambda^2
  y <- log(data)
  w <- (y - mu)/sigma
  value <- (k - 0.5) * log(k) - lgamma(k) - log(sigma) + (k^0.5) * w - k * exp(w/k^0.5)
  value
}
> rm(ggamma.lnLi)
> ggamma.lnLi.bak
Problem: Object "ggamma.lnLi.bak" not found 
Use traceback() to see the call stack
> ggamma.lnL.bak
function(data, mu, sigma, lambda)
{
  # Generalized Gamma Log Likelihood
  # For Uncensored data only
  # Based on Lawless, p. 244
  #
  n <- length(data)
  k <- 1/lambda^2
  y <- log(data)
  w <- (y - mu)/sigma
  sum1 <- sum(w)
  sum2 <- sum(exp(w/k^0.5))
  value <- n * (k - 0.5) * log(k) - n * lgamma(k) - n * log(sigma) + (k^0.5) * sum1 - k * sum2
  value
}
> rm(ggamma.lnL.bak)
> objects()
[1] ".Last.value"         ".Random.seed"        "A"                   "Airplane"            "Airplane1"           "Airplane1.avas"     
[7] "Airplane1.lm"        "Airplane2"           "Airplane2.lm"        "Airplane2.rp"        "Airplane3"           "Airplane4"          
[13] "AngleBetween"        "BallBearing"         "BallBearing.fit"     "BoxLiu"              "BoxLiu.Y.tree"       "BoxLiu.s.tree"      
[19] "CR3.avas"            "CV.lvq"              "CVprobs"             "CVtest"              "Caligula"            "Caligula.lm"        
[25] "Caligula.rp"         "Cart"                "Cat"                 "Cf"                  "Commodity"           "Commodity.Total"    
[31] "Commodity.rp"        "Commodity.rp1"       "Cooling"             "Cooling.y1"          "Cooling.y2"          "Cooling.y3"         
[37] "Cord"                "Cortol"              "Cp"                  "Cpk"                 "Crnout"              "Cylinder.Loader"    
[43] "DS1"                 "DS1.df"              "Data"                "Diam"                "Distb"               "Emissions"          
[49] "Emissions.rp"        "Emissions.rp.Accel"  "Emissions.rp.CO"     "Emissions.rp.HC"     "Emissions.rp.HCNO"   "Emissions.rp.Lug"   
[55] "Emissions.rp.NO"     "Emissions.rp.Part"   "Emissions.rp.Peak"   "Engine4"             "Engine4.avas"        "Engine4.st"         
[61] "Engine4a"            "Engine4a.st"         "Engine4b"            "Engine4c"            "Errors"              "Flat"               
[67] "L"                   "Lab"                 "Lab1"                "Lemonade"            "Lemonade.lm"         "Lemonade.lm1"       
[73] "Lemonade.rp"         "Lemonade.rp1"        "Lemonade0"           "Lemonade1"           "Lemonade1.RFeedb.lm" "Lemonade1.Satisf.lm"
[79] "Lemonade2"           "Lemonade2.lm"        "Lemonade2.tree"      "Lemonade2.tree1"     "Mason"               "Mee"                
[85] "Mee1"                "Mee2"                "Obara4"              "Obara5"              "Parlel"              "Perp1"              
[91] "Perp2"               "Pos2"                "Profp"               "Rad"                 "Rat"                 "SDF1"               
[97] "SDF2"                "SDF3"                "SDF4"                "SDF5"                "Saran"               "Saran.cv"           
[103] "Saran.rp"            "Saran.tr"            "Satisf.bc"           "Sauer"               "Sauer.Agusta"        "Sauer.Agusta.cv"    
[109] "Sauer.Agusta.pred"   "Sauer.Agusta.tr"     "Sauer.Other"         "Sauer.Other.cv"      "Sauer.Other.pred"    "Sauer.Other.tr"     
[115] "Sauer.cv"            "Sauer.rp"            "Sauer.rp1"           "Sauer.rp2"           "Sauer.rp3"           "Sauer.rp4"          
[121] "Sauer.rp5"           "Sauer.tr"            "Shfit.Sync.rp1"      "Shift"               "Shift.Peak"          "Shift.Peak.rp"      
[127] "Shift.Peak.rp1"      "Shift.Peak.rp2"      "Shift.Sync"          "Shift.Sync.rp"       "Shift.Sync.rp1"      "Shift.Sync.rp2"     
[133] "Shift.rp"            "Span"                "Status"              "Stress"              "T2"                  "Times.iso"          
[139] "Times.sam"           "Torreon"             "Torreon.Emissions"   "Torreon.Smoke"       "Torreon.rp"          "Torreon1"           
[145] "Torreon1.rp"         "Tractor"             "Tractor.rp"          "Tractor.rp1"         "TractorW"            "TractorW.rp"        
[151] "TractorW.rp1"        "UIDE"                "WTier2"              "Waterloo"            "Waterloo.rp"         "Waterloo1"          
[157] "Waterloo1.rp"        "Waterloo2"           "WaterlooR"           "WaterlooR.rp"        "Wing.Area"           "Wing.Area.lo"       
[163] "Wing.Area.loess"     "Wing.Area.mar"       "Wing.Aspect"         "Wing.Aspect.lo"      "Wing.Aspect.loess"   "Wing.Aspect.mar"    
[169] "Wing.Cord"           "Wing.Span"           "Wloo"                "Wloo.pc"             "Wloo.pca"            "WlooR"              
[175] "WlooR.pca"           "WlooT2"              "WlooT2a"             "Z"                   "ability.FA"          "ability.cl"         
[181] "ability.cov"         "allfail"             "allfail.tr"          "allfail.u"           "allfail.u.rp"        "allfail.u.tr"       
[187] "area1"               "bass"                "c.ds"                "c.n"                 "c.q"                 "chi.q"              
[193] "chi.q.ds"            "circle"              "circle.bak"          "circle1"             "clv"                 "con"                
[199] "cor.obj"             "cormatrix"           "cov.obj"             "covmatrix"           "cset"                "cset0"              
[205] "d0"                  "d1"                  "d3"                  "deaths.spc"          "dfReturn"            "dist2"              
[211] "dist2full"           "distp"               "dv"                  "eda.shape"           "eda.shape1"          "engine"             
[217] "engine.avas"         "engine.lm"           "engine.m"            "engine.m.ln"         "engine.rp"           "f"                  
[223] "f1"                  "f2"                  "factcor"             "factcov"             "fd"                  "fgl.iso"            
[229] "fgl.rp2"        "fgl0"           "fgl1"           "fit"            "fsr"            "fsr.ds"         "fsr.n"          "fsr.q"         
[237] "fsrlv"          "ft2"            "gamma.fit"      "gamma.lnL"      "gehan.surv"     "ggamma.fit"     "ggamma.fit.bak" "ggamma.lnL"    
[245] "last.dump"      "last.warning"  
> ggamma.lnL
function(data, mu, sigma, lambda)
{
  # Generalized Gamma Log Likelihood
  # For Uncensored data only
  # Based on Lawless, p. 244
  #
  n <- length(data)
  k <- 1/lambda^2
  y <- log(data)
  w <- (y - mu)/sigma
  sum1 <- sum(w)
  sum2 <- sum(exp(w/k^0.5))
  value <- n * (k - 0.5) * log(k) - n * lgamma(k) - n * log(sigma) + (k^0.5) * sum1 - k * sum2
  value
}
> rm(ggamma.lnL)
> ggamma.fit.bak
function(data.values, mu0, sigma0, lambda0)
{
  # generalized gamma parameter estimation
  # for uncensored data only
  # requires function "ggamma.lnL" (Log Likelhood)
  # 
  ms.data <- data.frame(data.values)
  parameters(ms.data) <- list(mu = mu0, sigma = sigma0, lambda = lambda0)
  ms.fit <- ms( ~  - ggamma.lnL(data.values, mu, sigma, lambda), data = ms.data, trace = F)
  ms.fit
}
> rm(ggamma.fit.bak)
> ggamma.fit
function(data.values, mu0, sigma0, lambda0)
{
  # generalized gamma parameter estimation
  # for uncensored data only
  # requires function "ggamma.loglike" (Log Likelhood)
  # 
  ms.data <- data.frame(data.values)
  parameters(ms.data) <- list(mu = mu0, sigma = sigma0, lambda = lambda0)
  ms.fit <- ms( ~  - ggamma.loglike(data.values, mu, sigma, lambda), data = ms.data, trace = F)
  ms.fit
}
