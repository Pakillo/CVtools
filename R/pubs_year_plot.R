#' Plot number of publications per year (in Google Scholar).
#'
#' Generate a ggplot2 figure of the number of papers published per year. Data from Google Scholar.
#'
#' @import scholar
#' @import ggplot2
#' @param user Google Scholar user ID.
#' @param fontsize Numeric. Font size for the plot.
#' @export
#' @return A plot.
#' @examples \dontrun{
#' cites_year_plot(user="B7vSqZsAAAAJ")
#'}
pubs_year_plot <- function(user, fontsize=18){
  pubsdf <- get_publications(user)
  pubsdf$year <- as.integer(pubsdf$year)
  require(ggplot2)
  pubsplot <- ggplot(data=pubsdf, aes(x=year)) + geom_bar(binwidth=0.8) +
    labs(x="Year", y="Number of publications") +
    ggtitle("Publications per year") +
    theme_bw(base_size = fsize)
    #theme_classic(base_size = 18, base_family = "Helvetica")
  pubsplot
}
