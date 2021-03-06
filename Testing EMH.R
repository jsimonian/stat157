#install.packages('stockPortfolio')
library('stockPortfolio')

Returns <- function(x) {
  back <- getReturns(x, freq = "day", start = "1995-01-01")[6]$full[[1]]
  stock <- back[rev(rownames(back)),]
  return(stock)
}

Returns.Week <- function(x) {
  back <- getReturns(x, freq = "week", start = "1995-01-01")[6]$full[[1]]
  stock <- back[rev(rownames(back)),]
  return(stock)
}

Returns.Month <- function(x) {
  back <- getReturns(x, freq = "month", start = "1995-01-01")[6]$full[[1]]
  stock <- back[rev(rownames(back)),]
  return(stock)
}

# Creates dataframes of daily, weekly, and monthly stock prices for company,
# with ticker 'x', from the first day of trading in 1995 to the present day

SP.ALL <- strsplit("ABT,ABBV,ACE,ACN,ACT,ADBE,ADT,AES,AET,AFL,AMG,A,GAS,APD,ARG,AKAM,AA,ALXN,ATI,ALLE,AGN,ADS,ALL,ALTR,MO,AMZN,AEE,AEP,AXP,AIG,AMT,AMP,ABC,AME,AMGN,APH,APC,ADI,AON,APA,AIV,AAPL,AMAT,ADM,AIZ,T,ADSK,ADP,AN,AZO,AVGO,AVB,AVY,AVP,BHI,BLL,BAC,BK,BCR,BAX,BBT,BDX,BBBY,BRK.B,BBY,BIIB,BLK,HRB,BA,BWA,BXP,BSX,BMY,BRCM,BF.B,CHRW,CA,CVC,COG,CAM,CPB,COF,CAH,CFN,KMX,CCL,CAT,CBG,CBS,CELG,CNP,CTL,CERN,CF,SCHW,CHK,CVX,CMG,CB,CI,XEC,CINF,CTAS,CSCO,C,CTXS,CLX,CME,CMS,COH,KO,CCE,CTSH,CL,CMCSA,CMA,CSC,CAG,COP,CNX,ED,STZ,GLW,COST,COV,CCI,CSX,CMI,CVS,DHI,DHR,DRI,DVA,DE,DLPH,DAL,DNR,XRAY,DVN,DO,DTV,DFS,DISCA,DISCK,DG,DLTR,D,DOV,DOW,DPS,DTE,DD,DUK,DNB,ETFC,EMN,ETN,EBAY,ECL,EIX,EW,EA,EMC,EMR,ESV,ETR,EOG,EQT,EFX,EQR,ESS,EL,EXC,EXPE,EXPD,ESRX,XOM,FFIV,FB,FDO,FAST,FDX,FIS,FITB,FSLR,FE,FISV,FLIR,FLS,FLR,FMC,FTI,F,FOSL,BEN,FCX,FTR,GME,GCI,GPS,GRMN,GD,GE,GGP,GIS,GM,GPC,GNW,GILD,GS,GT,GOOGL,GOOG,GWW,HAL,HOG,HAR,HRS,HIG,HAS,HCP,HCN,HP,HES,HPQ,HD,HON,HRL,HSP,HST,HCBK,HUM,HBAN,ITW,IR,TEG,INTC,ICE,IBM,IP,IPG,IFF,INTU,ISRG,IVZ,IRM,JEC,JNJ,JCI,JOY,JPM,JNPR,KSU,K,KEY,GMCR,KMB,KIM,KMI,KLAC,KSS,KRFT,KR,LB,LLL,LH,LRCX,LM,LEG,LEN,LVLT,LUK,LLY,LNC,LLTC,LMT,L,LO,LOW,LYB,MTB,MAC,M,MMM,MNK,MRO,MPC,MAR,MMC,MAS,MA,MAT,MKC,MCD,MHFI,MCK,MJN,MWV,MDT,MRK,MET,MCHP,MU,MSFT,MHK,TAP,MDLZ,MON,MNST,MCO,MS,MOS,MSI,MUR,MYL,NBR,NDAQ,NOV,NAVI,NTAP,NFLX,NWL,NFX,NEM,NWSA,NEE,NLSN,NKE,NI,NE,NBL,JWN,NSC,NTRS,NOC,NU,NRG,NUE,NVDA,KORS,ORLY,OXY,OMC,OKE,ORCL,OI,PCG,PCAR,PLL,PH,PDCO,PAYX,PNR,PBCT,POM,PEP,PKI,PRGO,PETM,PFE,PM,PSX,PNW,PXD,PBI,PCL,PNC,RL,PPG,PPL,PX,PCP,PCLN,PFG,PG,PGR,PLD,PRU,PEG,PSA,PHM,PVH,QEP,PWR,QCOM,DGX,RRC,RTN,RHT,REGN,RF,RSG,RAI,RHI,ROK,COL,ROP,ROST,RCL,R,SWY,CRM,SNDK,SCG,SLB,SNI,STX,SEE,SRE,SHW,SIAL,SPG,SJM,SNA,SO,LUV,SWN,SE,STJ,SWK,SPLS,SBUX,HOT,STT,SRCL,SYK,STI,SYMC,SYY,TROW,TGT,TEL,TE,THC,TDC,TSO,TXN,TXT,HSY,TRV,TMO,TIF,TWX,TWC,TJX,TMK,TSS,TSCO,RIG,TRIP,FOXA,TSN,TYC,USB,UA,UNP,UNH,UPS,MLM,URI,UTX,UHS,UNM,URBN,VFC,VLO,VAR,VTR,VRSN,VZ,VRTX,VIAB,V,VNO,VMC,WMT,WAG,DIS,WM,WAT,ANTM,WFC,WDC,WU,WY,WHR,WFM,WMB,WIN,WEC,WYN,WYNN,XEL,XRX,XLNX,XL,XYL,YHOO,YUM,ZMH,ZION,ZTS", ",")

# Yes, there are 502 stocks on the S&P 500. Two of them are second classes
# of stock in already-listed companies (Google and  Discovery Communications).

Predic <- function(x) {
  same <- 0
  diff <- 0
  for(i in 2:(length(x[,1])-1)) {
    if((x[i,]$Adj.Close > x[i-1,]$Adj.Close && x[i+1,]$Adj.Close > x[i,]$Adj.Close)) {
      same <- same + 1
    }
    if((x[i,]$Adj.Close < x[i-1,]$Adj.Close && x[i+1,]$Adj.Close < x[i,]$Adj.Close)) {
      same <- same + 1
    }
    if((x[i,]$Adj.Close > x[i-1,]$Adj.Close && x[i+1,]$Adj.Close < x[i,]$Adj.Close)) {
      diff <- diff + 1
    }
    if((x[i,]$Adj.Close < x[i-1,]$Adj.Close && x[i+1,]$Adj.Close > x[i,]$Adj.Close)) {
      diff <- diff + 1
    }
  }
  return(same/(same+diff))
}

# checks to see if stocks are predictible in their movements, in terms of
# sequences and reversals

Day.SP <- c(0)
for(i in 1:502) {Day.SP[i] <- Predic(Returns(SP.ALL[[1]][i]))}

Week.SP <- c(0)
for(i in 1:502) {Week.SP[i] <- Predic(Returns.Week(SP.ALL[[1]][i]))}

Month.SP <- c(0)
for(i in 1:502) {Month.SP[i] <- Predic(Returns.Month(SP.ALL[[1]][i]))}

# creates vectors of average movements in prices - each one represents the
# percentage of the time a certain stock moved in the same direction

Stock.Var <- function(x) {
  var <- c(0)
  for(i in 2:length(x$Adj.Close)) {
    var[i] <- var(x$Adj.Close[1:i])
  }
  return(var)
}

Stock.Corr <- function(x) {
  return(cor(1:length(Stock.Var(x)), Stock.Var(x)))
}

Stock.Direc <- function(x) {
  vardirec <- 0
  var <- Stock.Var(x)
  for(i in 2:length(var)) {
    if(var[i] > (var[i-1])*(i/(i-1))) {
      vardirec <- vardirec + 1
    }
  }
  return(vardirec/length(Stock.Var(x)))
}


VarCorrWeek <- c(0)
for(i in 1:502) {VarCorrWeek[i] <- Stock.Corr(Returns.Week(SP.ALL[[1]][i]))}

VarCorrMonth <- c(0)
for(i in 1:502) {VarCorrMonth[i] <- Stock.Corr(Returns.Month(SP.ALL[[1]][i]))}

VarDirecWeek <- c(0)
for(i in 1:502) {VarDirecWeek[i] <- Stock.Direc(Returns.Week(SP.ALL[[1]][i]))}

VarDirecMonth <- c(0)
for(i in 1:502) {VarDirecMonth[i] <- Stock.Direc(Returns.Month(SP.ALL[[1]][i]))}



ManMom <- function(x) {
  cash <- 10000
  stock <- 0
  for(i in 1:(length(x[,1]))) {
    if(((x[i,]$Open*(x[i,]$Adj.Close/x[i,]$Close)) > 
          x[i,]$Adj.Close) && stock > cash) {
      cash <- stock*x[i,]$Close
      stock <- 0
    }
    if(((x[i,]$Open*(x[i,]$Adj.Close/x[i,]$Close)) < 
          x[i,]$Adj.Close) && cash > stock) {
      stock <- cash/x[i,]$Close
      cash <- 0
    }
    print(c(cash, stock, x[i,]$Adj.Close))
  }
  return(max(cash, stock*(x[length(x[,1]),]$Adj.Close)))
}

# Returns value of assets over time for a player of the "Manic Momentum" game.

x <- list(0)
for(i in 1:4) {x[[i]] <- 2*(floor(runif(5021, 0, 2)))-1}
y <- list(0, 0, 0, 0)
for(j in 1:4){
  for(i in 2:5022) {y[[j]][i] <- y[[j]][i-1] + x[[j]][i-1]}}
for(i in 1:4) {plot(1:5022, y[[i]]+100, type = 'l')}

# generates charts that look like stocks, but aren't (for presentation)

