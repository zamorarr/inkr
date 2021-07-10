url <- "https://unpkg.com/inkjs"
destfile <- file.path(system.file("js", package = "inkr"), "ink.js")
download.file(url, destfile)
