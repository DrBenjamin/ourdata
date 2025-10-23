# data-raw/compress_data.R
# compress all data files (Rdata)

save(fragebogen, file = "data/fragebogen.rda", compress = "bzip2")
save(hdi, file = "data/hdi.rda", compress = "xz")
save(imr, file = "data/imr.rda", compress = "xz")
save(kirche, file = "data/kirche.rda", compress = "bzip2")
save(koelsch, file = "data/koelsch.rda", compress = "bzip2")
save(oecd_preventable, file = "data/oecd_preventable.rda", compress = "xz")

