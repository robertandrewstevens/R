# http://sachaepskamp.com/blog/HTMLexamples
# Create HTML page containing all package examples using knitr and markdown

# Yesterday, I was updating my website to include more information about some R packages I am working on.
# I wanted to create a page showing examples of the functionality that is available in each package.
# Now, I usually write a quite extensive amount of examples in the help pages, showing most of the functionality.
# A single page with the examples of each function in the package including the output would be a, although very simply,
# quite nice way to quickly demonstrate the functionality of the package.

# This is not hard to do by hand. Simply copy the examples to an R markdown file, add knitr chunks and a title here and there and
# it should look good. But this seemed like something that would be nice to do every update, so I wanted to automate it.
# The results (which can be seen here http://sachaepskamp.com/semPlot/examples and here http://sachaepskamp.com/qgraph/examples)
# were quite nice, so I figured I maybe others could use these codes as well. Do keep in mind that these codes are hardly tested!
  
# Below is the code for the function examplePage. It scans all of a packages .Rd files for an example section and extracts them.
# The function creates and compiles a markdown document with the following title levels:
# 1. The package name (only at the top)
# 2. The help-file name
# 3. Any line in the example section that contain word characters and either starts with three or more #s or starts with an #
#    and ends with an # or -.
# 4. Any line that starts with (after spaces) exactly ##, followed by word characters and does not end on # or -.

# These titles are chosen specifically such that the control-shift-R command in RStudio or something like 
# #### BIG SECTION ####
# results in a large title.

# Usage:  examplePage has the following arguments:
#   pkg: Path to the package folder, should include a directory man with the Rd files.
#   openChunk: code to open chunks. Defaults to "{r, message=FALSE, warning = FALSE, error = FALSE}".
#     This can be used to enter more knitr options.
#   includeDontshow: Logical stating if don't show environments should be included in the codes. Defaults to FALSE.
#   includeDontrun: Logical stating if don't run environments should be included in the codes. Defaults to TRUE.

# The function:

examplePage <- function(pkg, openChunk = "```{r, message=FALSE, warning = FALSE, error = FALSE}", 
                        includeDontshow = FALSE, includeDontrun = TRUE, exclude) {
  if (!require("knitr"))
    stop("'knitr must be intalled.")
  if (!require("markdown")) 
    stop("'knitr must be intalled.")
  
  # Inner function to find closing brackets:
  findClose <- function(x, openLoc, open = "\\{", close = "\\}") {
    # Find close:
    nest <- 1
    i <- openLoc + 1
    repeat {
      # If open bracket in line:
      if (grepl(open, x[i])) {
        nest <- nest + length(gregexpr(open, x[i])[[1]])
      }
      if (grepl(close, x[i])) {
        nest <- nest - length(gregexpr(close, x[i])[[1]])
      }
      if (nest == 0) 
        break
      i <- i + 1
    }
    return(i)
  }
  
  files <- list.files(paste0(pkg, "/man"), pattern = "\\.Rd$", ignore.case = TRUE, full.names = TRUE)
  
  # Exclude:
  if (!missing(exclude)) 
    files <- files[!grepl(exclude, files)]
  
  # Preparation:
  n <- length(files)
  subs <- character(n)
  
  # For each rd file:
  for (i in seq_along(files)) {
    # Read file:
    txt <- readLines(files[i])
    
    # Only include if there is only one example section:
    if (sum(grepl("\\\\examples\\{", txt)) == 1) {
      # Extract examples section:
      start <- grep("\\\\examples\\{", txt)
      end <- findClose(txt, start)
      txt <- txt[(start + 1):(end - 1)]
      
      # Don't show fields:
      dontshows <- grep("\\\\dontshow\\{", txt)
      if (length(dontshows) > 0) {
        ends <- numeric(length(dontshows))
        for (k in seq_along(dontshows)) {
          ends[k] <- findClose(txt, dontshows[k])
        }
        
        # Remove:
        if (includeDontshow) {
          txt <- txt[-c(dontshows, ends)]
        } else txt <- txt[-do.call(c, mapply(dontshows, ends, FUN = ":", SIMPLIFY = FALSE))]
      }
      
      # Don't run fields:
      dontruns <- grep("\\\\dontrun\\{", txt)
      if (length(dontruns) > 0) {
        ends <- numeric(length(dontruns))
        for (k in seq_along(dontruns)) {
          ends[k] <- findClose(txt, dontruns[k])
        }
        
        # Remove:
        if (includeDontrun) {
          txt <- txt[-c(dontruns, ends)]
        } else txt <- txt[-do.call(c, mapply(dontruns, ends, FUN = ":", SIMPLIFY = FALSE))]
      }
      
      # Enter main title and first R chunk:
      txt <- c(paste("##", gsub("\\.rd$", "", basename(files[i]), ignore.case = TRUE)), openChunk, txt, "```")
      
      # Crawl over lines. If a title is encountered, close chunk and replace
      # title with markdown:
      j <- 3
      repeat {
        # Small section (start with exactly two hashes, does not end with nonword:
        if (grepl("^\\s*##\\s*(\\w|\\s)+$", txt[j])) {
          txt[j] <- gsub("^\\s*##\\s*", "#### ", txt[j])
          txt <- c(txt[1:(j - 1)], "```", txt[j], openChunk, txt[(j + 1):length(txt)])
          j <- j + 2
          # Else large section, starts with #, ends with nonchar, or starts with
          # more than 2 #'s
        } else if (grepl("\\w", txt[j]) & (grepl("^\\s*###", txt[j]) | grepl("^\\s*#.*[#-]\\s*$", txt[j]))) {
          txt[j] <- gsub("^\\W*(?=\\w)", "### ", txt[j], perl = TRUE)
          txt[j] <- gsub("(?<=\\w)\\W*$", "", txt[j], perl = TRUE)
          txt <- c(txt[1:(j - 1)], "```", txt[j], openChunk, txt[(j + 1):length(txt)])
          j <- j + 2
        } else if (grepl("^\\s*#\\W*$", txt[j])) {
          # If start is comment and no words, remove:
          txt <- txt[-j]
          j <- j - 1
        }
        j <- j + 1
        if (j > length(txt)) 
          break
      }
      
      emptySections <- which(txt[-length(txt)] == openChunk & txt[-1] == "```")
      if (length(emptySections) > 0) 
        txt <- txt[-c(emptySections, emptySections + 1)]
      
      txt <- gsub("\\\\%", "%", txt)
      subs[i] <- paste(txt, collapse = "\n")
    }
  }
  
  subs <- subs[order(nchar(subs), decreasing = TRUE)]
  subs <- c(paste0("# ", basename(pkg), "\n\n```{r,echo=FALSE,message=FALSE}\nlibrary(\"", basename(pkg), "\")\n```"), subs)
  
  # Write Rmd:
  RmdFile <- paste0(basename(pkg), ".Rmd")
  write(paste(subs, collapse = "\n\n"), RmdFile)
  
  # Knit:
  mdFile <- gsub("Rmd", "md", RmdFile)
  knit(RmdFile, mdFile)
  
  # Markdown:
  htmlFile <- gsub("Rmd", "html", RmdFile)
  markdownToHTML(mdFile, htmlFile)
  
  browseURL(htmlFile)
  
  return(htmlFile)
}

# see comments for some suggestions/alternatives
