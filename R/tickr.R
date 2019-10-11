#' Adjust axis tick marks and labels
#'
#' @param data = input dataframe
#' @param var = variable of interest e.g., year
#' @param to = step increase desired e.g., every 5 years
#' @param start = adjust the start value
#' @param end = adjust the end vlaue
#'
#' @return tickr
#' @export tickr
#'
#' @examples
#'
#' data.frame(year = 1970:2019,
#'            catch = rnorm(50, 10, 2))
#'
tickr <- function(data, var, to = 5, start = NULL, end = NULL){

  data %>%
    dplyr::summarise(min = min({{var}}, na.rm = T),
                     max = max({{var}}, na.rm = T)) %>%
    dplyr::mutate(min = ifelse(is.null(start), min, start),
                  max = ifelse(is.null(end), max, end)) -> out

  data.frame(breaks = out$min:out$max) %>%
    dplyr::mutate(labels = ifelse(breaks %in%
                                    seq(to * floor(min(breaks) / to), max(breaks), by = to), breaks, ""))

}
