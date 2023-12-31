% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/intervals.R
\name{gintervals.2d}
\alias{gintervals.2d}
\title{Creates a set of 2D intervals}
\usage{
gintervals.2d(
  chroms1 = NULL,
  starts1 = 0,
  ends1 = -1,
  chroms2 = NULL,
  starts2 = 0,
  ends2 = -1
)
}
\arguments{
\item{chroms1}{chromosomes1 - an array of strings with or without "chr"
prefixes or an array of integers (like: '1' for "chr1")}

\item{starts1}{an array of start1 coordinates}

\item{ends1}{an array of end1 coordinates. If '-1' chromosome size is
assumed.}

\item{chroms2}{chromosomes2 - an array of strings with or without "chr"
prefixes or an array of integers (like: '1' for "chr1"). If 'NULL',
'chroms2' is assumed to be equal to 'chroms1'.}

\item{starts2}{an array of start2 coordinates}

\item{ends2}{an array of end2 coordinates. If '-1' chromosome size is
assumed.}
}
\value{
A data frame representing the intervals.
}
\description{
Creates a set of 2D intervals.
}
\details{
This function returns a set of two-dimensional intervals. The returned value
can be used in all functions that accept 'intervals' argument.

Two-dimensional intervals is a data frame whose first six columns are
'chrom1', 'start1', 'end1', 'chrom2', 'start2' and 'end2'. Each row of the
data frame represents two genomic intervals from two chromosomes in the
range of [start, end). Additional columns can be presented in 2D intervals
object yet these columns must be added after the six obligatory ones.
}
\examples{
\dontshow{
options(gmax.processes = 2)
}

gdb.init_examples()

## the following 3 calls produce identical results
gintervals.2d(1)
gintervals.2d("1")
gintervals.2d("chrX")

gintervals.2d(1, 1000, 2000, "chrX", 400, 800)
gintervals.2d(c("chr2", "chrX"), 10, c(3000, 5000), 1)

}
\seealso{
\code{\link{gintervals}}, \code{\link{gintervals.force_range}}
}
\keyword{~intervals}
