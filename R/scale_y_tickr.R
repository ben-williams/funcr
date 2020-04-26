#' Adjust y-axis tick marks and labels
#'
#' @param data = input dataframe
#' @param var = variable of interest e.g., year
#' @param to = step increase desired e.g., every 5 years
#' @param start = adjust the start value
#' @param end = adjust the end vlaue
#' @param min = lowest value to label
#'
#' @return scale_y_tickr
#' @export scale_y_tickr
#'
#' @examples
scale_y_tickr <- function(data, var, to = 5, start = NULL, end = NULL, min = NULL){

  tickr(data, {{var}}, to, start, end, min) -> tick

  scale_y_continuous(breaks = tick$breaks,
                     labels =  tick$labels)

}
