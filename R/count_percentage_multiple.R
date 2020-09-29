#' Count and compute percentage on multiple columns
#'
#' This function allows you to count the observations per group on multiple columns
#' and compute the associated percentage.
#' @param df A data frame with the observations
#' @param ... The name of the columns containing the observations
#' @param digits The number of decimals needed for the percentage
#' @keywords count, percentage
#' @importFrom rlang quos
#' @importFrom magrittr %>%
#' @importFrom tidyr drop_na
#' @importFrom dplyr group_by_at
#' @importFrom dplyr vars
#' @importFrom dplyr ungroup
#' @importFrom dplyr summarise
#' @importFrom dplyr n
#' @importFrom dplyr mutate
#' @export
#' @examples
#' count_percentage_multiple(iris, Species)

count_percentage_multiple <- function(df, ..., digits = 1) {
  # Enquo the column name
  col_vars <- quos(...)
  
  # Count the observations and compute the percentage
  df  %>%
    drop_na(!!!col_vars)  %>% #remove the NAs
    group_by_at(vars(!!!col_vars)) %>%
    summarise(n = n()) %>% #count the observations
    ungroup() %>%
    mutate(percentage = round(n * 100 / sum(n), digits = digits)) #percentage
}
