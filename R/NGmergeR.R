## 
# Usage: NGmerge {-1 <file> -2 <file> -o <file>}  [optional arguments]
# Required arguments:
#   -1  <file>       Input FASTQ file with reads from forward direction
#   -2  <file>       Input FASTQ file with reads from reverse direction
#   -o  <file>       Output FASTQ file(s):
#                    - in 'stitch' mode (def.), the file of merged reads
#                    - in 'adapter-removal' mode (-a), the output files
#                      will be <file>_1.fastq and <file>_2.fastq
# Alignment parameters:
#   -m  <int>        Minimum overlap of the paired-end reads (def. 20)
#   -p  <float>      Mismatches to allow in the overlapped region
#                      (a fraction of the overlap length; def. 0.10)
#   -a               Use 'adapter-removal' mode (also sets -d option)
#   -d               Option to check for dovetailing (with 3' overhangs)
#   -e  <int>        Minimum overlap of dovetailed alignments (def. 50)
#   -s               Option to produce shortest stitched read
# I/O options:
#   -l  <file>       Log file for stitching results of each read pair
#   -f  <file>       FASTQ files for reads that failed stitching
#                      (output as <file>_1.fastq and <file>_2.fastq)
#   -c  <file>       Log file for dovetailed reads (adapter sequences)
#   -j  <file>       Log file for formatted alignments of merged reads
#   -z/-y            Option to gzip (-z) or not (-y) FASTQ output(s)
#   -i               Option to produce interleaved FASTQ output(s)
#   -w  <file>       Use given error profile for merged qual scores
#   -g               Use 'fastq-join' method for merged qual scores
#   -q  <int>        FASTQ quality offset (def. 33)
#   -u  <int>        Maximum input quality score (0-based; def. 40)
#   -n  <int>        Number of threads to use (def. 1)
#   -v               Option to print status updates/counts to stderr

## Helper function that return a description of the intended usage for NGmerge
# NGmerge_usage <- function(){
#   print(.NGmergeBin(args="--help"))
# }


## A helper function to call the NGmerge binaries with additional arguments.
.NGmergeBin <- function(args="")
{
    if(is.null(args) || args=="")
        stop("The NGmerge binaries need to be called with additional arguments")
    args <- gsub("^ *| *$", "", args)
    call <- paste(shQuote(file.path(system.file(package="NGmergeR"), "NGmerge")), args)
    return(system(call, intern=TRUE))
}


## The direct binary call function
.execute <- function(callstr, ...){
  call <- file.path(shQuote(system.file(package="NGmergeR")), callstr)
  return(system(call, ...))
}


