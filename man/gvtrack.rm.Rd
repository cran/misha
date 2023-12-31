% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/vtrack.R
\name{gvtrack.rm}
\alias{gvtrack.rm}
\title{Deletes a virtual track}
\usage{
gvtrack.rm(vtrack = NULL)
}
\arguments{
\item{vtrack}{virtual track name}
}
\value{
None.
}
\description{
Deletes a virtual track.
}
\details{
This function deletes a virtual track from current R environment.
}
\examples{
\dontshow{
options(gmax.processes = 2)
}

gdb.init_examples()
gvtrack.create("vtrack1", "dense_track", "max")
gvtrack.create("vtrack2", "dense_track", "quantile", 0.5)
gvtrack.ls()
gvtrack.rm("vtrack1")
gvtrack.ls()

}
\seealso{
\code{\link{gvtrack.create}}, \code{\link{gvtrack.ls}}
}
\keyword{~virtual}
