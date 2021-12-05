## R/tminer.R
## function 'tminer' is a text miner

tminer <- function(x, lang)
{
    library(reticulate)
    use_virtualenv("inst/extdata/my_env")
    source_python(system.file("extdata", "py_deepl.py", package = "ourdata"))

    return(py_deepl(x, lang))
}
