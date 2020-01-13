#' Build folders
#'
#' @param ...
#'
#' @return folders
#' @export folders
#'
#' @examples
#' Setup R projects with standard folder outputs:
#'
#' folders() # creates a data, code, figs, and ouput folder by default
#' the ... can be used to create additional folders
#' folders("tables", "text", "tmb")
folders <- function(...){
  dir.create("data")
  dir.create("code")
  dir.create("figs")
  dir.create("output")
  for(i in length(...)) {
    dir.create(...[i])
  }
}
