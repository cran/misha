% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/intervals.R
\name{gintervals.canonic}
\alias{gintervals.canonic}
\title{Converts intervals to canonic form}
\usage{
gintervals.canonic(intervals = NULL, unify_touching_intervals = TRUE)
}
\arguments{
\item{intervals}{intervals to be converted}

\item{unify_touching_intervals}{if 'TRUE', touching one-dimensional
intervals are unified}
}
\value{
A data frame representing the canonic intervals and an attribute
'mapping' that maps the original intervals to the resulted ones.
}
\description{
Converts intervals to canonic form.
}
\details{
This function converts 'intervals' into a "canonic" form: properly sorted
with no overlaps. The result can be used later in the functions that require
the intervals to be in canonic form. Use 'unify_touching_intervals' to
control whether the intervals that touch each other (i.e. the end coordinate
of one equals to the start coordinate of the other) are unified.
'unify_touching_intervals' is ignored if two-dimensional intervals are used.

Since 'gintervals.canonic' unifies overlapping or touching intervals, the
number of the returned intervals might be less than the number of the
original intervals. To allow the user to find the origin of the new interval
'mapping' attribute is attached to the result. It maps between the original
intervals and the resulted intervals. Use 'attr(retv_of_gintervals.canonic,
"mapping")' to retrieve the map.
}
\examples{
\dontshow{
options(gmax.processes = 2)
}

gdb.init_examples()

## Create intervals manually by using 'data.frame'.
## Note that we add an additional column 'data'.
## Return value:
##   chrom start   end data
## 1  chr1 11000 12000   10
## 2  chr1   100   200   20
## 3  chr1 10000 13000   30
## 4  chr1 10500 10600   40
intervs <- data.frame(
    chrom = "chr1",
    start = c(11000, 100, 10000, 10500),
    end = c(12000, 200, 13000, 10600),
    data = c(10, 20, 30, 40)
)

## Convert the intervals into the canonic form.
## The function discards any columns besides chrom, start and end.
## Return value:
##  chrom start   end
## 1  chr1   100   200
## 2  chr1 10000 13000
res <- gintervals.canonic(intervs)

## By inspecting mapping attribute we can see how the new
## intervals were created: "2 1 2 2" means that the first
## interval in the result was created from the second interval in
## the original set (we look for the indices in mapping where "1"
## appears). Likewise the second interval in the result was
## created from 3 intervals in the original set. Their indices are
## 1, 3 and 4 (once again we look for the indices in mapping where
## "2" appears).
## Return value:
## 2 1 2 2
attr(res, "mapping")

## Finally (and that is the most useful part of 'mapping'
## attribute): we add a new column 'data' to our result which is
## the mean value of the original data column. The trick is done
## using 'tapply' on par with 'mapping' attribute. For example,
## 20.00000 equals is a result of 'mean(intervs[2,]$data' while
## 26.66667 is a result of 'mean(intervs[c(1,3,4),]$data)'.
## 'res' after the following call:
##  chrom start   end     data
## 1  chr1   100   200 20.00000
## 2  chr1 10000 13000 26.66667
res$data <- tapply(intervs$data, attr(res, "mapping"), mean)

}
\seealso{
\code{\link{gintervals}}, \code{\link{gintervals.2d}}
}
\keyword{~canonic}
\keyword{~intervals}
