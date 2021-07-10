#' Create a javascript context
#' @export
create_context <- function() {
  # create js environment
  js <- V8::v8()

  # source js files
  inkjs <- system.file("js", "ink.js", package = "inkr")
  js$source(inkjs)

  # return context
  js
}

#' Remove a javascript context
#' @inheritParams load_story
#' @export
remove_context <- function(js) {
  rm(js)
}
