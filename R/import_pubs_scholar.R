#' Import publications from Google Scholar and print them in Markdown format.
#'
#' Import publications from Google Scholar and print them in Markdown format.
#'
#' @details Currently there is a limit of 100 publications to download from Scholar. Only full references with correct fields will be imported and printed. Use return_bib = TRUE to retrieve a BibEntry object with all the references in Scholar (to a limit of 100) that can be edited later.
#' @seealso https://gist.github.com/Pakillo/9647756
#' @export
#' @import RefManageR
#' @author F. Rodriguez-Sanchez
#' @param user Character. The user ID in Google Scholar Citations. Obtain from author's profile in google scholar website.
#' @param ... Further parameters to pass to \code{\link{print.BibEntry}}, such as \code{max.names} (maximum number of names to display before substituting by 'et al.'), or \code{no.print.fields} to specify fields not to be printed (e.g. "doi", "url", "isbn", etc). Other options are fixed by default: \code{style = 'text'}, \code{bib.style = 'authoryear'}, \code{sorting = 'ydnt'}, and \code{first.inits = FALSE}.
#' @param return_bib Logical If TRUE, will return a BibEntry object with all citations retrieved from Scholar so they can be later edited
#' @examples \dontrun{
#' import_pubs_scholar(user="B7vSqZsAAAAJ")
#'
#' # Return BibEntry object with all references (even if defective) so they can be edited later
#' mypubs <- import_pubs_scholar(user="B7vSqZsAAAAJ", return_bib = TRUE)
#'}

import_pubs_scholar <- function(user, ..., return_bib = FALSE){

  refs <- ReadGS(user, sort.by.date = TRUE, check.entries = "drop")

  print(refs, .opts = list(style="text", bib.style="authoryear", sorting = "ydnt", first.inits=FALSE, ...))

  if (return_bib == TRUE){
    allrefs <- ReadGS(user, sort.by.date = TRUE, check.entries = FALSE)
    return(allrefs)
  }
}
