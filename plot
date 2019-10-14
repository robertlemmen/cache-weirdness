#!/usr/bin/Rscript

linear <- read.table("data-linear")
poisson <- read.table("data-poisson")
ecalc <- read.table("data-calc")
scan <- read.table("scan.data") 

par(mar=c(5,4,4,5)+.1)

svg("weirdness2a.svg",width=11.32,height=7)
plot(linear$V3 ~ linear$V2, xlim=c(0,1), type="l", col="pink", ylab="Cache Hit Ratio", xlab="Hot Data Set Size / Cache Size", bty="n", lwd=2)
lines(poisson$V3 ~ poisson$V2, col="purple", lwd=2)
lines(linear$V4 / 200 ~ linear$V2, type="l", col="magenta", lwd=2)
lines(poisson$V4 / 200 ~ poisson$V2, type="l", col="cyan", lwd=2)
legend("topright", c("Hit Rate, Flat Distribution", "Hit Rate, Poisson Distribution", "Avg. Refresh Age, Flat Distribution", "Avg. Refresh Age, Poisson Distribution"), fill=c("pink", "purple", "magenta", "cyan"), inset=0.06, bg="white")
axis(4, at=c(0.2, 0.4, 0.6, 0.8, 1.0), labels=c(40, 80, 120, 160, 200))
mtext("Avg Refresh Age Metric", side=4, line=3)
dev.off()

svg("weirdness2b.svg",width=11.32,height=7)
plot(linear$V3 ~ linear$V2, type="l", col="pink", ylab="Cache Hit Ratio", xlab="Hot Data Set Size / Cache Size", bty="n", lwd=2)
lines(poisson$V3 ~ poisson$V2, col="purple", lwd=2)
lines(linear$V4 / 200 ~ linear$V2, type="l", col="magenta", lwd=2)
lines(poisson$V4 / 200 ~ poisson$V2, type="l", col="cyan", lwd=2)
legend("topright", c("Hit Rate, Flat Distribution", "Hit Rate, Poisson Distribution", "Avg. Refresh Age, Flat Distribution", "Avg. Refresh Age, Poisson Distribution"), fill=c("pink", "purple", "magenta", "cyan"), inset=0.06, bg="white")
axis(4, at=c(0.2, 0.4, 0.6, 0.8, 1.0), labels=c(40, 80, 120, 160, 200))
mtext("Avg Refresh Age Metric", side=4, line=3)
dev.off()


svg("weirdness1.svg",width=11.32,height=7)
plot(scan$V2 ~ scan$V1, type="l", col="purple", xlab="Time", ylab="Cache Hit Ratio", bty="n", ylim=c(0,1), lwd=2)
segments(scan$V1, scan$V2-scan$V3, scan$V1, scan$V2+scan$V3, col="pink")
rect(50, 0, 51, 1, col="#00000020", border=NA)
legend("bottomright", c("Hit Rate Value", "Hit Rate Std.Dev.", "Linear Scan Event"), fill=c("purple", "pink", "#00000020"), inset=0.04)
dev.off()
