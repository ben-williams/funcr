
#' Get the mode of a variable
#'
#' @param x = input variable
#'
#' @return mode
#' @export mode
#'
#' @examples
#' df <- data.frame(year = 1970:2019,
#'                catch = rnorm(50, 10, 2))
#' mode(df$catch)
mode <- function(x) {
  uniqv <- unique(x)
  as.numeric(uniqv[which.max(tabulate(match(x, uniqv)))])
}
