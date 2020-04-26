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

  if(dir.exists("data")==FALSE){
  dir.create("data")}
  if(dir.exists("code")==FALSE){
    dir.create("code")}
  if(dir.exists("figs")==FALSE){
    dir.create("figs")}
  if(dir.exists("output")==FALSE){
    dir.create("output")}
  for(i in length(...)) {
    dir.create(...[i])
  }
}
