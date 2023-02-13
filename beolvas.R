## Fájl lista
txtfiles <- dir("konvertalt_2022")

### Beolvasás
## submodule szkript behívása
source("smartbe/smartbe.R")
smartbe("konvertalt_2022/eger4_420.TXT", channel = 3)
