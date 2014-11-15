\name{packageAdd}
\alias{packageAdd}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
packageAdd(pkg, files, path = ".", document = TRUE)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{pkg}{
%%     ~~Describe \code{pkg} here~~
}
  \item{files}{
%%     ~~Describe \code{files} here~~
}
  \item{path}{
%%     ~~Describe \code{path} here~~
}
  \item{document}{
%%     ~~Describe \code{document} here~~
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
%%  ~~who you are~~
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (pkg, files, path = ".", document = TRUE) 
{
    findPkg <- function(pkg) {
        ev = .GlobalEnv
        pkgName <- paste("package", pkg, sep = ":")
        while (!is.null(ev)) {
            ev = parent.env(ev)
            if (identical(pkgName, attr(ev, "name"))) 
                break
        }
        ev
    }
    evPkg <- findPkg(pkg)
    if (is.null(evPkg)) {
        require(pkg, character.only = TRUE)
        evPkg <- findPkg(pkg)
        if (is.null(evPkg)) 
            stop("Package \"", pkg, "\" should be available when packageAdd() is called")
    }
    topenvPrev <- options("topLevelEnvironment")
    on.exit(options(topenvPrev))
    for (file in files) {
        ev = new.env(parent = evPkg)
        assign(".packageName", pkg, envir = ev)
        options(topLevelEnvironment = ev)
        exprs <- parse(file)
        eval(exprs, envir = ev)
        sourceFile = basename(file)
        manDir = file.path(path, pkg, "man")
        what <- objects(ev, all.names = TRUE)
        if (document) {
            docCommon <- character()
            for (name in what) {
                obj <- get(name, envir = ev)
                if (is(obj, "MethodsList")) {
                  fName <- metaNameUndo(name)
                  packageSlot(fName) <- pkg
                  fileName <- file.path(manDir, paste(.topicName("methods", 
                    fName), "Rd", sep = "."))
                  promptMethods(fName, fileName, obj)
                }
                else if (is(obj, "classRepresentation")) {
                  clName <- as.character(metaNameUndo(name, "C"))
                  fileName <- file.path(manDir, paste(.topicName("class", 
                    clName), "Rd", sep = "."))
                  promptClass(clName, fileName, where = ev)
                }
                else docCommon <- c(docCommon, name)
            }
            if (length(docCommon)) {
                fileName <- file.path(manDir, paste(docCommon[[1]], 
                  "Rd", sep = "."))
                promptAll(docCommon, fileName)
            }
        }
        sourceCopyFile <- file.path(path, pkg, "R", sourceFile)
        file.copy(file, sourceCopyFile)
        message("Copied file ", file, " to ", sourceCopyFile)
    }
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line
