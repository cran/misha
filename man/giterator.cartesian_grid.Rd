% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/intervals.R
\name{giterator.cartesian_grid}
\alias{giterator.cartesian_grid}
\title{Creates a cartesian-grid iterator}
\usage{
giterator.cartesian_grid(
  intervals1 = NULL,
  expansion1 = NULL,
  intervals2 = NULL,
  expansion2 = NULL,
  min.band.idx = NULL,
  max.band.idx = NULL
)
}
\arguments{
\item{intervals1}{one-dimensional intervals}

\item{expansion1}{an array of integers that define expansion around
intervals1 centers}

\item{intervals2}{one-dimensional intervals. If 'NULL' then 'intervals2' is
considered to be equal to 'intervals1'}

\item{expansion2}{an array of integers that define expansion around
intervals2 centers. If 'NULL' then 'expansion2' is considered to be equal to
'expansion1'}

\item{min.band.idx, max.band.idx}{integers that limit iterator intervals to
band}
}
\value{
A list containing the definition of cartesian iterator.
}
\description{
Creates a cartesian grid two-dimensional iterator that can be used by any
function that accepts an iterator argument.
}
\details{
This function creates and returns a cartesian grid two-dimensional iterator
that can be used by any function that accepts an iterator argument.

Assume 'centers1' and 'centers2' to be the central points of each interval
from 'intervals1' and 'intervals2', and 'C1', 'C2' to be two points from
'centers1', 'centers2' accordingly. Assume also that the values in
'expansion1' and 'expansion2' are unique and sorted.

'giterator.cartesian_grid' creates a set of all possible unique and
non-overlapping two-dimensional intervals of form: '(chrom1, start1, end1,
chrom2, start2, end2)'. Each '(chrom1, start1, end1)' is created by taking a
point 'C1' - '(chrom1, coord1)' and converting it to 'start1' and 'end1'
such that 'start1 == coord1+E1[i]', 'end1 == coord1+E1[i+1]', where 'E1[i]'
is one of the sorted 'expansion1' values. Overlaps between rectangles or
expansion beyond the limits of chromosome are avoided.

'min.band.idx' and 'max.band.idx' parameters control whether a pair of 'C1'
and 'C2' is skipped or not. If both of these parameters are not 'NULL' AND
if both 'C1' and 'C2' share the same chromosome AND the delta of indices of
'C1' and 'C2' ('C1 index - C2 index') lays within '[min.band.idx,
max.band.idx]' range - only then the pair will be used to create the
intervals. Otherwise 'C1-C2' pair is filtered out. Note: if 'min.band.idx'
and 'max.band.idx' are not 'NULL', i.e. band indices filtering is applied,
then 'intervals2' parameter must be set to 'NULL'.
}
\examples{
\dontshow{
options(gmax.processes = 2)
}

gdb.init_examples()

intervs1 <- gintervals(
    c(1, 1, 2), c(100, 300, 200),
    c(300, 500, 300)
)
intervs2 <- gintervals(
    c(1, 2, 2), c(400, 1000, 3000),
    c(800, 2000, 4000)
)
itr <- giterator.cartesian_grid(
    intervs1, c(-20, 100), intervs2,
    c(-40, -10, 50)
)
giterator.intervals(iterator = itr)

itr <- giterator.cartesian_grid(intervs1, c(-20, 50, 100))
giterator.intervals(iterator = itr)

itr <- giterator.cartesian_grid(intervs1, c(-20, 50, 100),
    min.band.idx = -1,
    max.band.idx = 0
)
giterator.intervals(iterator = itr)

}
\seealso{
\code{\link{giterator.intervals}}
}
\keyword{~cartesian}
\keyword{~iterator}
