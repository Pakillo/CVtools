#' Import publications from a BibTeX file and print them in Markdown format.
#'
#' Import publications from a BibTeX file and print them in Markdown format.
#'
#' @export
#' @import RefManageR
#' @author F. Rodriguez-Sanchez
#' @param file Character. Path to bibtex file containing the references.
#' @param ... Further parameters to pass to \code{\link{print.BibEntry}}, such as \code{max.names} (maximum number of names to display before substituting by 'et al.'), or \code{no.print.fields} to specify fields not to be printed (e.g. "doi", "url", "isbn", etc). Other options are fixed by default: \code{style} = 'text', \code{bib.style} = 'authoryear', \code{sorting} = 'ydnt', and \code{first.inits} = FALSE.
#'

import_pubs_bibtex <- function(file, ...){

  refs <- ReadBib(file, check = "warn")
  print(refs, .opts = list(style="text", bib.style="authoryear", sorting = "ydnt", first.inits=FALSE, ...))

}
