#!/usr/bin/Rscript

pdf(file='cache-degrade.pdf',width=16, height=10)

linear <- read.table("data-linear")
poisson <- read.table("data-poisson")
ecalc <- read.table("data-calc")
scan <- read.table("scan.data") 

plot(linear$V3 ~ linear$V2, xlim=c(0,1), type="l", col="blue", ylab="Cache Hit Ratio", xlab="Hot Data Set Size / Cache Size", bty="n", lwd=2)
lines(poisson$V3 ~ poisson$V2, col="green", lwd=2)
legend("bottomleft", c("Flat Distribution", "Poisson Distribution"), fill=c("blue", "green"), inset=0.04)

plot(linear$V3 ~ linear$V2, type="l", col="blue", ylab="Cache Hit Ratio", xlab="Hot Data Set Size / Cache Size", bty="n", lwd=2)
lines(poisson$V3 ~ poisson$V2, col="green", lwd=2)
legend("bottomleft", c("Flat Distribution", "Poisson Distribution"), fill=c("blue", "green"), inset=0.04)

plot(scan$V2 ~ scan$V1, type="l", col="purple", xlab="Time", ylab="Cache Hit Ratio", bty="n", ylim=c(0,1), lwd=2)
segments(scan$V1, scan$V2-scan$V3, scan$V1, scan$V2+scan$V3, col="pink")
rect(50, 0, 51, 1, col="#00000020", border=NA)
legend("bottomright", c("Hit Rate Value", "Hit Rate Std.Dev.", "Linear Scan Event"), fill=c("purple", "pink", "#00000020"), inset=0.04)
