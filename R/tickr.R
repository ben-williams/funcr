#' Adjust axis tick marks and labels
#'
#' @param data = input dataframe
#' @param var = variable of interest e.g., year
#' @param to = step increase desired e.g., every 5 years
#' @param start = adjust the start value
#' @param end = adjust the end vlaue
#' @param min = lowest value to label
#'
#' @return tickr
#' @export tickr
#'
#' @examples
#'
#' data.frame(year = 1970:2019,
#' catch = rnorm(50, 10, 2)) -> df
#'
#' xaxis <- tickr(df, year, 10)
#'
#' df %>%
#'   ggplot(aes(year, catch)) +
#'   geom_point() +
#'   scale_x_continuous(labels = xaxis$labels, breaks = xaxis$breaks)
#'
#' theme_set(theme_report(base_size = 12, base_family = "Bookman"))
#'
tickr <- function(data, var, to = 5, start = NULL, end = NULL, min = NULL){

  data %>%
    dplyr::summarise(min = min({{var}}, na.rm = T),
                     max = max({{var}}, na.rm = T)) -> out

  if(is.null(start) & is.null(end)){

    data.frame(breaks = out$min:out$max) %>%
      dplyr::mutate(labels = ifelse(breaks %in%
                                      seq(to * min(breaks) / to,
                                          max(breaks), by = to), breaks, ""))

  } else if(!is.null(start) & is.null(end) & is.null(min)){

      data.frame(breaks = start:out$max) %>%
        dplyr::mutate(labels = ifelse(breaks %in%
                                        seq(to * start / to, max(breaks),
                                            by = to), breaks, ""))

  } else if(!is.null(start) & is.null(end) & !is.null(min)){
      data.frame(breaks = start:out$max) %>%
        dplyr::mutate(labels = ifelse(breaks %in%
                                        seq(to * start / to, max(breaks),
                                            by = to), breaks, "")) %>%
        dplyr::filter(breaks >= min) -> lb
    lb$labels[1] <- lb$breaks[1]
    lb

  } else if(is.null(start) & !is.null(end)){

    data.frame(breaks = out$min:end) %>%
      dplyr::mutate(labels = ifelse(breaks %in%
                                      seq(to * min(breaks) / to, end, by = to),
                                    breaks, ""))
  } else {

    data.frame(breaks = start:end) %>%
      dplyr::mutate(labels = ifelse(breaks %in%
                                      seq(to * start / to, end, by = to),
                                    breaks, ""))
  }
}
