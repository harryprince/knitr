\name{kable}
\alias{kable}
\title{Create tables in LaTeX, HTML, Markdown and reStructuredText}
\usage{
kable(x, format, digits = getOption("digits"), row.names = NA, col.names = colnames(x), 
    align, caption = NULL, ...)
}
\arguments{
\item{x}{an R object (typically a matrix or data frame)}

\item{format}{a character string; possible values are \code{latex},
\code{html}, \code{markdown}, \code{pandoc}, and \code{rst}; this will be
automatically determined if the function is called within \pkg{knitr}; it
can also be set in the global option \code{knitr.table.format}}

\item{digits}{the maximum number of digits for numeric columns (passed to
\code{round()}); it can also be a vector of length \code{ncol(x)} to set
the number of digits for individual columns}

\item{row.names}{a logical value indicating whether to include row names; by
default, row names are included if \code{rownames(x)} is neither
\code{NULL} nor identical to \code{1:nrow(x)}}

\item{col.names}{a character vector of column names to be used in the table}

\item{align}{the alignment of columns: a character vector consisting of
\code{'l'} (left), \code{'c'} (center) and/or \code{'r'} (right); by
default, numeric columns are right-aligned, and other columns are
left-aligned; if \code{align = NULL}, the default alignment is used}

\item{caption}{the table caption}

\item{...}{other arguments (see examples)}
}
\value{
A character vector of the table source code. When \code{output =
  TRUE}, the results are also written into the console as a side-effect.
}
\description{
This is a very simple table generator. It is simple by design. It is not
intended to replace any other R packages for making tables.
}
\note{
The tables for \code{format = 'markdown'} also work for Pandoc when the
  \code{pipe_tables} extension is enabled (this is the default behavior for
  Pandoc >= 1.10).

  When using this function inside a \pkg{knitr} document (e.g. R Markdown or
  R LaTeX), you will need the chunk option \code{results='asis'}.
}
\examples{
kable(head(iris), format = "latex")
kable(head(iris), format = "html")
kable(head(iris), format = "latex", caption = "Title of the table")
kable(head(iris), format = "html", caption = "Title of the table")
# use the booktabs package
kable(mtcars, format = "latex", booktabs = TRUE)
# use the longtable package
kable(matrix(1000, ncol = 5), format = "latex", digits = 2, longtable = TRUE)
# add some table attributes
kable(head(iris), format = "html", table.attr = "id=\"mytable\"")
# reST output
kable(head(mtcars), format = "rst")
# no row names
kable(head(mtcars), format = "rst", row.names = FALSE)
# R Markdown/Github Markdown tables
kable(head(mtcars[, 1:5]), format = "markdown")
# no inner padding
kable(head(mtcars), format = "markdown", padding = 0)
# more padding
kable(head(mtcars), format = "markdown", padding = 2)
# Pandoc tables
kable(head(mtcars), format = "pandoc", caption = "Title of the table")
# save the value
x = kable(mtcars, format = "html")
cat(x, sep = "\\n")
# can also set options(knitr.table.format = 'html') so that the output is HTML
}
\references{
See
  \url{https://github.com/yihui/knitr-examples/blob/master/091-knitr-table.Rnw}
   for some examples in LaTeX, but they also apply to other document formats.
}
\seealso{
Other R packages such as \pkg{xtable} and \pkg{tables} for HTML and
  LaTeX tables, and \pkg{ascii} and \pkg{pander} for different flavors of
  markdown output and some advanced features and table styles.
}
