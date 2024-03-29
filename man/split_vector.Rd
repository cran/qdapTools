% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/split_vector.R
\name{split_vector}
\alias{split_vector}
\title{Split a Vector By Split Points}
\usage{
split_vector(x, split = "", include = FALSE, regex = FALSE, ...)
}
\arguments{
\item{x}{A vector with split points.}

\item{split}{A vector of places (elements) to split on or a regular 
expression if \code{regex} argument is \code{TRUE}.}

\item{include}{An integer of \code{1} (\code{split} character(s) are not 
included in the output), \code{2} (\code{split} character(s) are included at 
the beginning of the output), or \code{3} (\code{split} character(s) are 
included at the end of the output).}

\item{regex}{logical.  If \code{TRUE} regular expressions will be enabled for
\code{split} argument.}

\item{\ldots}{other arguments passed to \code{\link[base]{grep}} and
\code{\link[base]{grepl}}.}
}
\value{
Returns a list of vectors.
}
\description{
Splits a \code{vector} into a list of vectors based on split points.
}
\examples{
set.seed(15)
x <- sample(c("", LETTERS[1:10]), 25, TRUE, prob=c(.2, rep(.08, 10)))

split_vector(x)
split_vector(x, "C")
split_vector(x, c("", "C"))

split_vector(x, include = 0)
split_vector(x, include = 1)
split_vector(x, include = 2)

set.seed(15)
x <- sample(1:11, 25, TRUE, prob=c(.2, rep(.08, 10)))
split_vector(x, 1)

## relationship to `loc_split`
all.equal(
    split_vector(x, include = 1),
    loc_split(x, which(x == ""), names=1:6)
)
}
\references{
\url{https://stackoverflow.com/a/24319217/1000343}
}
\seealso{
\code{\link[qdapTools]{loc_split}},
\code{\link[qdapTools]{run_split}}
}
\author{
Matthew Flickinger and Tyler Rinker <tyler.rinker@gmail.com>.
}
