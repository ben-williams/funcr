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
  dirs = c("code", "data", "figs", "output")

  for(i in 1:length(dirs)){
    if(dir.exists(dirs[i])==FALSE){
      dir.create(dirs[i])
    }
  }
  for(i in length(...)) {
      dir.create(...[i])
  }
}
