#' Plot number of citations per year (in Google Scholar).
#'
#' Generate a ggplot2 figure of the number of total citations for a given researcher along time (years). Data from Google Scholar.
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
cites_year_plot <- function(user, fsize=18){
  citdf <- get_citation_history(user)
  require(ggplot2)
  citesplot <- ggplot(data=citdf, aes(x=year, y=cites)) + geom_bar(stat="identity") +
    labs(x="Year", y="Number of cites") +
    ggtitle("Citations per year") +
    theme_bw(base_size = fsize)
    #theme_classic(base_size = 18, base_family = "Helvetica")
  citesplot
}
