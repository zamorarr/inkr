#' Continue story until a choice is hit
#'
#' @inheritParams load_story
#' @family API
#' @export
continue_maximally <- function(js) {
  js$eval("story.ContinueMaximally()")
}

#' Continue story one step at a time
#'
#' @inheritParams load_story
#' @family API
#' @export
continue_normally <- function(js) {
  js$eval("story.Continue()")
}

#' Check if story can continue
#'
#' @inheritParams load_story
#' @family API
#' @export
can_continue <- function(js) {
  as.logical(js$eval("story.canContinue"))
}

#' Make a choice
#'
#' @inheritParams load_story
#' @family API
#'
#' @param idx integer index of choice
#' @export
choose_choice_index <- function(js, idx) {
  js$call("story.ChooseChoiceIndex", idx - 1L)
}

#' Get number of current choices
#' @inheritParams load_story
#' @keywords internal
current_choices_length <- function(js) {
  #m <- js$get("story.currentChoices.map(x => ({index: x.index, text: x.text}))")
  #print(js$get("JSON.stringify(story.currentChoices)"))
  js$get("story.currentChoices.length")
}

#' Get text of current choices
#' @inheritParams load_story
#' @keywords internal
current_choices_text <- function(js) {
  js$get("story.currentChoices.map(x => x.text)")
}
