% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/GCTA_parPlot.R
\name{GCTA_parPlot}
\alias{GCTA_parPlot}
\title{GCTA_parPlot}
\usage{
GCTA_parPlot(df, dataName = "", summaryType)
}
\arguments{
\item{df}{output from GCTA_par function with permutations}

\item{dataName}{string of name of data for graph labels; default is blank}

\item{summaryType}{one of "coexpression" or "covariance"; how modules were summarized for GCTA calculations}
}
\value{
ggplot object
}
\description{
GCTA_parPlot creates a graph of the output from the GCTA_par function, plotting average heritability of the first principal component of either co-expression or covariance of gene modules against information lost/percent reduction for both observed and permuted data.
}
\details{
Genome-wide Complex Trait Analysis (GCTA) is a suite of C++ functions. In order to use the GCTA functions, the user must specify the absolute path to the GCTA software, which can be downloaded from the Yang Lab website \href{https://yanglab.westlake.edu.cn/software/gcta/#Download}{here}.

In GCTA_par, we use GCTA's Genomics REstricted Maximum Likelihood (GREML) method to estimate the average heritability of the first principal component of either co-expression or covariance of gene modules. The produced plot shows these heritability estimates at varying levels of dataset reduction, calculated for observed data in blue and permuted data in red. An information loss value of 0 represents the unreduced dataset, and an information loss level of 100 represents the data being reduced to the average expression of all features.
}
\examples{

# run OSCA_par and save output; input absolute path to OSCA software before running
\dontrun{par <- GCTA_par(df = geneExpressionData, 
          ILCincrement = 0.25, 
          fileLoc = "pathHere",
          gctaPath = "pathHere",
          summaryType = "coexpression",
          permute = TRUE,
          numNodes = 1)}

# run function
\dontrun{GCTA_parPlot(df=par, dataName = "Example Data", summaryType = "coexpression")}

}
\references{
Millstein J, Battaglin F, Barrett M, Cao S, Zhang W, Stintzing S, et al. Partition: a surjective mapping approach for dimensionality reduction. \emph{Bioinformatics} \strong{36} (2019) 676–681. doi:10.1093/bioinformatics/ btz661.

Yang J, Lee SH, Goddard ME, Visscher PM. GCTA: a tool for genome-wide complex trait analysis. Am J Hum Genet. 2011 Jan 7;88(1):76-82. doi: 10.1016/j.ajhg.2010.11.011. Epub 2010 Dec 17. PMID: 21167468; PMCID: PMC3014363.
}
\seealso{
GCTA software - \url{https://yanglab.westlake.edu.cn/software/gcta/#Overview}
}
\author{
Katelyn Queen, \email{kjqueen@usc.edu}
}
