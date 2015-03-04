#' Citing articles in Google Scholar.
#'
#' Get URL of Scholar page with articles citing a given paper.
#'
#' @param doi DOI of the paper.
#' @export
#' @return A URL as character.
#' @examples \dontrun{
#' citing_scholar("http://dx.doi.org/10.1016/j.quascirev.2008.08.006")
#' }
citing_scholar <- function(doi){
  # in the future, output could also be dataframe of citing articles
  link <- paste0("http://scholar.google.com/scholar?hl=en&lr=&cites=", doi)
  return(link)
}

