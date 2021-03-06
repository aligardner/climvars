% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/physclimvars.R
\name{tsp}
\alias{tsp}
\title{tsp: Total summer precipitation}
\usage{
tsp(prec, year, startday = 152, endday = 243, r)
}
\arguments{
\item{prec}{a three dimensional array of precipitation values.}

\item{startday}{assumed day of year of start of summer in northen hemisphere in non-leap year. Default is day 152 (1st June).}

\item{endday}{assumed day of year of start of summer in northen hemisphere in non-leap year. Default is day 243 (31st August).}

\item{r}{a raster object of same extent as temp coded as 1 for northern hemisphere and 0 for southern hemisphere.}
}
\value{
a matrix of total summer precipitation values for northern and southern hemisphere.
}
\description{
\code{tsp} calculates total precipitation during the summer season
}
\details{
Seasons are flipped in the southern hemisphere i.e. 1st June (day 152) = day 152+365/2+0.5 = 334 = 1st Dec.
In leap years, 1 day is added.
}
\examples{
prec <- array(10 * sin(c(0:1459) * (pi / -1400)) + runif(1460, 0, 10) +10, dim=c(1,1,1460))
m <- matrix(1, 73, 144)
r <- raster(m, crs="+init=epsg:4326")
extent(r) <- c(-1.25, 358.75, -91.25, 91.25)
enorth<-extent(-1.25,358.75,0,91.25)
esouth<-extent(-1.25,358.75,-91.25,0)
rn<-crop(r,enorth) * 0 + 1
rs<-crop(r,esouth) * 0
r<-mosaic(rn,rs,fun=mean)
tsp(prec, 2010, startday = 152, endday = 243, r)
}
