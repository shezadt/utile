#' Export a list of charts made in ggplot to Powerpoint
#'
#' This function allows you export a list of charts made in ggplot to Powerpoint.
#' @param listP a list with the ggplot charts
#' @param export_path The path where to export the Powerpoint
#' @param template_path The path of the Powerpoint template
#' @param layout Name of the Powerpoint layout
#' @param master Name of the Powerpoint master
#' @keywords chart, ppt
#' @importFrom officer read_pptx
#' @importFrom officer add_slide
#' @importFrom officer ph_with
#' @importFrom officer ph_location_type
#' @importFrom magrittr %>%
#' @importFrom rvg dml
#' @importFrom gridExtra grid.arrange
#' @export
#' @examples
#' library(ggplot2)
#' listP <- list()
#' listP[["first_chart"]] <- ggplot(data = iris) +
#' geom_point(mapping = aes(Sepal.Length, Petal.Length))
#' export_charts_ppt(listP, export_path = "test.pptx")

export_charts_ppt <-
  function(listP,
           export_path,
           template_path = NULL,
           layout = "Title and Content",
           master = "Office Theme") {
    
    # Read the template PPT
    doc <- read_pptx(path = template_path)
    
    # Print the plots
    for (chart_name in names(listP)) {
      
      # Get the chart
      chart <- listP[[chart_name]]
      
      # Make it editable
      editable_chart <- dml(ggobj = chart)
      
      # Check if it is a ggplot
      if (class(chart)[1] == "gtable") {
        doc <- add_slide(doc, layout = layout, master =  master) %>%
          ph_with(grid.arrange(chart), location = ph_location_type(type = "body"))
      } else {
        doc <- add_slide(doc, layout = layout, master =  master) %>%
          ph_with(editable_chart, location = ph_location_type(type = "body"))
      }
      
    }
    
    # Export the PPT
    print(doc, target = export_path)
  }
