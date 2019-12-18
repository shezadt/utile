#' Count and compute percentage
#'
#' This function allows you to count the observations per group
#' and compute the associated percentage.
#' @param df A data frame with the observations
#' @param col_name The name of the column containing the observations
#' @param digits The number of decimals needed for the percentage
#' @keywords count, percentage
#' @importFrom rlang enquo
#' @importFrom magrittr %>%
#' @importFrom tidyr drop_na
#' @importFrom dplyr group_by
#' @importFrom dplyr summarise
#' @importFrom dplyr n
#' @importFrom dplyr mutate
#' @export
#' @examples
#' count_percentage(iris, Species)

count_percentage <- function(df,
                             col_name,
                             digits = 1) {
  # Enquo the column name
  col_name <- enquo(col_name)

  # Count the observations and compute the percentage
  df  %>%
    drop_na(!!col_name)  %>% #remove the NAs
    group_by(!!col_name)  %>%
    summarise(n = n())  %>% #count the observations
    mutate(percentage = round(n * 100 / sum(n), digits)) #percentage
}
