#' @importFrom V8 new_context JS
ct <- NULL

.onLoad <- function(libname, pkgname){
  # highlight.js assumes 'window' object
  ct <<- new_context(c("global", "window"))
  libs <- list.files(system.file("js", package = pkgname), full.names = TRUE, pattern="*.js");
  lapply(sort(libs), function(path){
    ct$source(path)
  })
}
