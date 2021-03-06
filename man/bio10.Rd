% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/bioclimvars.R
\name{bio10}
\alias{bio10}
\title{bio10: Calculates mean temperature of the Warmest quarter}
\usage{
bio10(temps, tme, method = "")
}
\arguments{
\item{temps}{a vector of temperatures, normally for one year (see details).}

\item{tme}{a \code{POSIXlt} object representing the date and time of each \code{temps} value.}

\item{method}{An optional character string describing the method used to
calculate mean temperature of the warmest quarter. Options are "anuclim" or
unspecified (see details).}
}
\value{
a single numeric value of mean temperature in the warmest quarter of
the year.
}
\description{
\code{bio10} is used to calculate the mean temperature of the warmest
quarter (three months) of the year
}
\details{
If method is "anuclim", warmest quarter is determined to the nearest
week. Mean monthly temperature values are calculated and spline interpolated
to a weekly time period. Precipitation values are summed for all months and
then spline interpolated to a weekly time period. Otherwise, the mean
temperature of the warmest 3-month period is calculated from annual values.
}
\examples{
temps <- 10 * sin(c(0:1459) / (pi * 150)) + rnorm(1460)
tme <- tmecreate(2010, 6)
plot(temps~as.POSIXct(tme), type = "l", xlab = "Month", ylab = "Temperature")
bio10(temps, tme)
bio10(temps, tme, method = "anuclim")

}
\seealso{
the \code{\link[=tmecreate]{tmecreate()}} function can be used to create a POSIXlt object.
}
