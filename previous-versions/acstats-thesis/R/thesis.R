#' Creates an R Markdown PDF Thesis document
#'
#' This is a function called in output in the YAML of the driver Rmd file
#' to specify using the Reed College Senior Thesis LaTeX template and cls files.
#'
#' @export
#' @param toc A Boolean (TRUE or FALSE) specifying whether table of contents should be created
#' @param toc_depth A positive integer
#' @param highlight Syntax highlighting style. Supported styles include "default", "tango", "pygments", "kate", "monochrome", "espresso", "zenburn", and "haddock". Pass NULL to prevent syntax highlighting.
#' @return A modified \code{pdf_document} based on the Reed Senior Thesis LaTeX
#'   template
#' @examples
#' \dontrun{
#'  output: thesisdown::thesis_pdf
#' }
thesis_pdf <- function(toc = TRUE, toc_depth = 3, highlight = "default", ...){

  base <- bookdown::pdf_book(template = "template.tex",
    toc = toc,
    toc_depth = toc_depth,
    highlight = highlight,
    keep_tex = TRUE,
    pandoc_args = "--top-level-division=chapter",
    ...)

  # Mostly copied from knitr::render_sweave
  base$knitr$opts_chunk$comment <- "\t"
  #base$knitr$opts_chunk$fig.align <- "center"

  old_opt <- getOption("bookdown.post.latex")
  options(bookdown.post.latex = fix_envs)
  on.exit(options(bookdown.post.late = old_opt))

  base

}

#' Creates an R Markdown gitbook Thesis document
#'
#' This is a function called in output in the YAML of the driver Rmd file
#' to specify the creation of a webpage version of the thesis.
#'
#' @export
#' @return A gitbook webpage
#' @examples
#' \dontrun{
#'  output: thesisdown::thesis_gitbook
#' }
thesis_gitbook <- function(...){

  base <- bookdown::gitbook(
    split_by = "chapter+number",
    config = list(toc = list(collapse = "section",
      before = '<li><a href="./"></a></li>',
      after = '<li><a href="https://github.com/rstudio/bookdown" target="blank">Published with bookdown</a></li>',
      ...)
    )
  )

  # Mostly copied from knitr::render_sweave
  base$knitr$opts_chunk$comment <- "\t"
  base$knitr$opts_chunk$fig.align <- "center"

  base

}

fix_envs = function(x){
  beg_reg <- '^\\s*\\\\begin\\{.*\\}'
  end_reg <- '^\\s*\\\\end\\{.*\\}'
  i3 = if (length(i1 <- grep(beg_reg, x))) (i1 - 1)[grepl("^\\s*$", x[i1 - 1])]

  i3 = c(i3,
         if (length(i2 <- grep(end_reg, x))) (i2 + 1)[grepl("^\\s*$", x[i2 + 1])]
  )
  if (length(i3)) x = x[-i3]
  x
}
