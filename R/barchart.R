#' Create a bar chart with labels
#'
#' This function allows you to create a bar chart and display the labels
#' @param df A data frame with the observations
#' @param x The name of the x-axis
#' @param y The name of the y-axis
#' @param label The labels to display
#' @param x_label The label of the x-axis
#' @param y_label The label of the y-axis
#' @param title The title of the plot
#' @param vjust To adjust vertically the labels
#' @param hjust To adjust horizontally the labels
#' @keywords plot, label
#' @importFrom rlang enquo
#' @importFrom magrittr %>%
#' @importFrom ggplot2 ggplot
#' @importFrom ggplot2 aes
#' @importFrom ggplot2 geom_col
#' @importFrom ggplot2 geom_text
#' @importFrom ggplot2 labs
#' @export
#' @examples
#' library(ggplot2)
#' df_gg <- count_percentage(iris, Species)
#' barchart(df = df_gg, x = Species, y = percentage, label = percentage, x_label = "Species",
#' y_label = "Percentage", title = "Distribution of Species in Iris dataset",
#' vjust = -0.25)

barchart <- function(df,
                     x,
                     y,
                     label,
                     x_label,
                     y_label,
                     title,
                     vjust = 0.5,
                     hjust = 0.5) {
  # Enquo the aesthetics
  x <- enquo(x)
  y <- enquo(y)
  label <- enquo(label)
  
  # Create the plot
  df %>%
    ggplot(aes(x = !!x, y = !!y)) +
    geom_col() +
    geom_text(aes(label = !!label), vjust = vjust, hjust = hjust) +
    labs(x = x_label, y = y_label, title = title)
  
}
