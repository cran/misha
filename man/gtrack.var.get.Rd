% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/track-var.R
\name{gtrack.var.get}
\alias{gtrack.var.get}
\title{Returns value of a track variable}
\usage{
gtrack.var.get(track = NULL, var = NULL)
}
\arguments{
\item{track}{track name}

\item{var}{track variable name}
}
\value{
Track variable value.
}
\description{
Returns value of a track variable.
}
\details{
This function returns the value of a track variable. If the variable does
not exist an error is reported.
}
\examples{
\dontshow{
options(gmax.processes = 2)
}

gdb.init_examples()
gtrack.var.set("sparse_track", "test_var", 1:10)
gtrack.var.get("sparse_track", "test_var")
gtrack.var.rm("sparse_track", "test_var")

}
\seealso{
\code{\link{gtrack.var.set}}, \code{\link{gtrack.var.ls}},
\code{\link{gtrack.var.rm}}
}
\keyword{~variable}
