## R/tminer.R
## function 'tminer' is a text miner

tminer <- function(x, lang)
{
    library(reticulate)
    use_virtualenv("inst/extdata/my_env")
    source_python("py_deepl.py")

    return(py_deepl(x, lang))
}
