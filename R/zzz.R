.onLoad <- function(pkg, lib) {
  rc.options(custom.completer = completeme)
  register_completion(texPreview = populate)
}