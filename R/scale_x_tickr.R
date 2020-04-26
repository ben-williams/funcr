#' Adjust x-axis tick marks and labels
#'
#' @param data = input dataframe
#' @param var = variable of interest e.g., year
#' @param to = step increase desired e.g., every 5 years
#' @param start = adjust the start value
#' @param end = adjust the end vlaue
#' @param min = lowest value to label
#'
#' @return scale_x_tickr
#' @export scale_x_tickr
#'
#' @examples
scale_x_tickr <- function(data, var, to = 5, start = NULL, end = NULL, min = NULL){

  tickr(data, {{var}}, to, start, end, min) -> tick

  scale_x_continuous(breaks = tick$breaks,
                     labels =  tick$labels)

}


