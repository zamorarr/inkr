#' Version of Ink engine
#' @family version
#' @export
version_ink <- function() {
  # initialize a js context
  js <- create_context()
  on.exit(remove_context(js))

  # current version of the ink story file format. (the .ink file itself?)
  js$get("inkjs.Story.inkVersionCurrent") # this from inkjs itself

  # the minimum legacy version of ink that can be loaded by the current version of the code.
  #js$get("story.inkVersionMinimumCompatible") # this is from the engine but its private in inkjs.Story

  # storyContent.inkVersion -> inksjs.Story.inkVersionCurrent

  # to run a ink story correctly we need inkVersionMinimumCompatible <= version_story()
}

#' Version of Ink story
#' @inheritParams load_story
#' @family version
#' @export
version_story <- function(filepath) {
  json <- read_inkjson(filepath)
  json$inkVersion
}

#' Version of Ink story state
#' @inheritParams load_story
#' @family version
#' @keywords internal
version_storystate <- function(js) {
  # to load a json file correctly we need kInkSaveStateVersion >= kMinCompatibleLoadVersion

  # save state JSON version. this is from the story
  save_version <- js$get("story._state.kInkSaveStateVersion")

  # minimum version needed to load JSON. this is from the story
  load_version_min <- js$get("story._state.kMinCompatibleLoadVersion")

  # combine
  list(
    "kInkSaveStateVersion" = save_version,
    "kMinCompatibleLoadVersion" = load_version_min
  )
}
