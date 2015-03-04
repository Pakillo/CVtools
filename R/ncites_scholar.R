#' Retrieve number of citations of a paper in Google Scholar
#'
#' This function retrieves the number of citations of a given paper in Google Scholar.
#'
#' @param user character vector. The user ID in Google Scholar Citations. Obtain from author's profile in google scholar website.
#' @param paper character vector. The paper ID in Google Scholar Citations. Copy from publication list in author's profile website.
#' @author F. Rodriguez-Sanchez
#' @examples
#' ncites_scholar(user="B7vSqZsAAAAJ", paper="d1gkVwhDpl0C")
#'
ncites_scholar <- function(user, paper){

  require(XML)
  require(stringr)

  URL <- paste0("http://scholar.google.com/citations?user=", user,
                "&view_op=view_citation&hl=en&citation_for_view=", user, ":", paper)

  doc <- htmlParse(URL, encoding="UTF-8")
  #citeschunk<- paste(xpathSApply(doc, "//div[@class='cit-dd']", xmlValue), collapse=" ")
  citeschunk<- paste(xpathSApply(doc, "//div[@class='gsc_value']", xmlValue), collapse=" ")
  cites <- unlist(str_extract_all(citeschunk, "Cited by \\d+"))[2]
  ncites <- ifelse (!is.na(cites), as.integer(str_extract(cites, "\\d+")), 0)

  return(ncites)


}



