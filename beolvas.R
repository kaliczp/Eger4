## Fájl lista
txtfiles <- dir("konvertalt_2022")

### Beolvasás
## submodule szkript behívása
source("smartbe/smartbe.R")

## Több fájl beolvasása
eger4p <- smartbe(paste0("konvertalt_2022/", txtfiles[1]), channel = 3)
for(ttfile in txtfiles[-1]) {
    eger4p <- rbind(eger4p, smartbe(paste0("konvertalt_2022/", ttfile), channel = 3))
}

## Idővé alakítás
Sys.setenv(TZ="UTC")
eger4ido <- as.POSIXct(gsub("\\.", "-", eger4p[,1]))

## xts csomag használata
library(xts)
eger4p.xts  <- xts(eger4p[,2], eger4ido)
plot(eger4p.xts)

## napi idősor ábrázolása
eger4p.napi.xts <- round(apply.daily(eger4p.xts, mean), 3)
plot(eger4p.napi.xts)
write.zoo(eger4p.napi.xts, "eger4pnapi.csv", dec = ",", sep = ";", row.names = FALSE)

