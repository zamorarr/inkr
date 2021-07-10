#' Read Ink JSON file
#' @inheritParams load_story
#' @export
read_inkjson <- function(filepath) {
  txt <- readLines(filepath, warn = FALSE)
  jsonlite::fromJSON(txt, simplifyVector = FALSE)
}

#' Load Ink story from JSON
#' @param js javascript context to load story into
#' @param filepath path to JSON file
#' @export
load_story <- function(js, filepath) {
  # load story into js context
  json <- read_inkjson(filepath)
  js$assign("storyContent", json)

  # create story
  js$eval("var story = new inkjs.Story(storyContent);")
}

#' Play an Ink JSON story in R
#' @inheritParams load_story
#' @export
play_story <- function(filepath) {
  # initialize a js context
  js <- create_context()
  on.exit(remove_context(js))

  # load story into js context
  load_story(js, filepath)

  # play loop
  while (TRUE) {
    txt <- continue_maximally(js)
    cat(txt)

    # get number of choices
    num_choices <- current_choices_length(js)

    # if no more choices left, game is over
    if (num_choices < 1) break

    # show choices
    choices <- current_choices_text(js)
    cat("\n")
    cat(sprintf("[%i] %s", seq_along(choices), choices), sep = "\n")
    cat("\n")

    # wait for player to choose
    while(TRUE) {
      idx <- strtoi(readline("Choice: "))

      # check if input is valid
      is_valid <- !is.na(idx) & idx %in% seq_len(num_choices)
      if (is_valid) break

      # invalid input
      message(sprintf("Invalid choice. Please enter a number between 1 - %i", num_choices))
    }
    cat("---------------------------------\n")

    # make choice
    choose_choice_index(js, idx)
  }
}
