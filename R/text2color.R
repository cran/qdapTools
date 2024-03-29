#' Map Words to Colors
#' 
#' A dictionary lookup that maps words to colors.
#' 
#' @param words A vector of words.
#' @param recode.words A vector of unique words or a list of unique word vectors 
#' that will be matched against corresponding colors.
#' @param colors A vector of colors of equal in length to recode.words +1 (the 
#' +1 is for unmatched words).
#' @return Returns a vector of mapped colors equal in length to the words vector.
#' @seealso \code{\link[qdapTools]{lookup}}
#' @export
#' @examples
#' x <- structure(list(X1 = structure(c(3L, 1L, 8L, 4L, 7L, 2L, 2L, 2L, 
#'     4L, 8L, 4L, 3L, 5L, 3L, 1L, 8L, 7L, 2L, 1L, 6L), .Label = c("a", 
#'     "and", "in", "is", "of", "that", "the", "to"), class = "factor")), 
#'     .Names = "X1", row.names = c(NA, -20L), class = "data.frame")
#' 
#' #blue was recycled
#' text2color(x$X1, c("the", "and", "is"), c("red", "green", "blue")) 
#' text2color(x$X1, c("the", "and", "is"), c("red", "green", "blue", "white"))
#' x$X2 <- text2color(x$X1, list(c("the", "and", "is"), "that"), 
#'     c("red", "green", "white"))
#' x
text2color <-
function(words, recode.words, colors) {
  nc <- length(colors)
  if ((nc -1) != length(recode.words)) {
      warning("length of colors should be 1 more than length of recode.words")
  }
  nomatch <- colors[nc]
  colors <- colors[-nc]
  nulls <- sapply(recode.words, function(x) identical(x, character(0)))
  recode.words[nulls] <- ""
  lookup <- lapply(seq_along(recode.words), function(n) 
    cbind(recode.words[[n]], colors[n]))
  lookup <- do.call("rbind.data.frame", lookup)
  lookup <- apply(lookup, 2, as.character)
  recode <- lookup[match(words, lookup[, 1]), 2]
  recode[is.na(recode)] <- nomatch
  return(recode)
}


