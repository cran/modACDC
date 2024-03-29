% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ACDChighdim.R
\name{ACDChighdim}
\alias{ACDChighdim}
\title{ACDChighdim}
\usage{
ACDChighdim(
  moduleIdentifier = 1,
  moduleCols,
  fullData,
  externalVar,
  identifierList = colnames(fullData),
  corrThreshold = 0.75
)
}
\arguments{
\item{moduleIdentifier}{the module identifier given by Partition or other dimension reduction/clustering algorithm; default is 1}

\item{moduleCols}{list containing indices of column locations in fullData that specify features in the module}

\item{fullData}{data frame or matrix with samples as rows, all features as columns; each entry should be numeric gene expression or other molecular data values}

\item{externalVar}{data frame, matrix, or vector containing external variable data to be used for CCA, rows are samples; all elements must be numeric}

\item{identifierList}{optional row vector of identifiers, of the same length and order, corresponding to columns in fullData (ex: HUGO symbols for genes); default value is the column names from fullData}

\item{corrThreshold}{minimum correlation required between two features to be kept in the dataset; 0 \eqn{\leq} corrThreshold \eqn{\leq} 1; default value is 0.75}
}
\value{
Tibble, designed to be row binded with output from other ACDC functions after removing the final column, with columns

\describe{
\item{moduleNum}{module identifier}
\item{colNames}{list of column names from fullData of the features in the module}
\item{features}{list of identifiers from input parameter "identifierList" for all features in the module}
\item{CCA_corr}{list of CCA canonical correlation coefficients}
\item{CCA_pval}{Wilks-Lamda F-test p-value or t-test p-value}
\item{numPairsUsed}{number of feature pairs with correlation above corrThreshold}
}
}
\description{
ACDC detects differential co-expression between a set of genes, such as a module of co-expressed genes, and a set of external features (exposures or responses) by using canonical correlation analysis (CCA) on the external features and module co-expression values. A high-dimensional module is supplied by the user.
}
\details{
If the number of co-expression features in a particular module is larger than the number of samples, CCA will return correlation coefficients of 1, and p-values and BH FDR q-values will not be calculated. This function accepts one of these high dimension modules and reduces the dimensionality by calculating the pairwise correlations for all features and only keeping feature pairs with |correlation| > the user defined corrThreshold with a maximum number of features pairs of \eqn{\lfloor\frac{N}{2}\rfloor}. We posit that these highly correlated pairs are the skeleton structure of the full module and therefore an appropriate approximation. Once this structure is identified, co-expression values are calculated and CCA is performed as in ACDC.

For more information about how the co-expression features are calculated, see the coVar documentation.

Following CCA, which determines linear combinations of the co-expression and external feature vectors that maximize the cross-covariance matrix for each module, a Wilks-Lambda test is performed to determine if the correlation between these linear combinations is significant. If they are significant, that implies there is differential co-expression. If there is only one co-expression value for a module (ie two features in the module) and a single external variable, CCA reduces to a simple correlation test, and the t-distribution is used to test for significant correlation (Widmann, 2005).
}
\examples{
#load CCA package for example dataset
library(CCA)

# load dataset
data("nutrimouse")

# run function for diet and genotype
ACDChighdim(moduleIdentifier = 1,
            moduleCols = list(1:ncol(nutrimouse$lipid)),
            fullData = nutrimouse$lipid,
            externalVar = data.frame(diet=as.numeric(nutrimouse$diet), 
                                     genotype=as.numeric(nutrimouse$genotype)))

}
\references{
Benjamini Y, Hochberg Y. Controlling the false discovery rate: a practical and powerful approach to multiple testing. \emph{Journal of the Royal statistical society: series B (Methodological)} \strong{57} (1995) 289–300.

Martin P, et al. Novel aspects of PPARalpha-mediated regulation of lipid and xenobiotic metabolism revealed through a nutrigenomic study. \emph{Hepatology}, in press, 2007.

Queen K, Nguyen MN, Gilliland F, Chun S, Raby BA, Millstein J. ACDC: a general approach for detecting phenotype or exposure associated co-expression. \emph{Frontiers in Medicine} (2023) 10. doi:10.3389/fmed.2023.1118824..

Widmann M. One-Dimensional CCA and SVD, and Their Relationship to Regression Maps. \emph{Journal of Climate} \strong{18} (2005) 2785–2792. doi:10.1175/jcli3424.1.
}
\author{
Katelyn Queen, \email{kjqueen@usc.edu}
}
