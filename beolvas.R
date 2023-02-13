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

plot(eger4ido, eger4p[,2], type = "l")
