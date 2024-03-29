context("Checking loc_split")

test_that("loc_split gived intended output",{
	
    vect_list_check <- function(x){
        list(is.list = is.list(x),
            type = c(unique(unlist(lapply(x, function(y) class(y)[1])))),
            n = length(x),
            names.null = is.null(names(x))
        )
    }
    
    
    ## character
    x1 <- loc_split(LETTERS, c(4, 10, 16))
    x2 <- loc_split(LETTERS, c(4, 10, 16), c("dog", "cat", "chicken", "rabbit"))
    
    vect_list_check(loc_split(LETTERS, c(4, 10, 16)))
    
    ## numeric
    x3 <- loc_split(1:100, c(33, 66))
    
    ## factor
    p_chng <- head(1 + cumsum(rle(as.character(CO2[["Plant"]]))[[1]]), -1)
    x3 <- loc_split(CO2[["Plant"]], p_chng)
    
    ## list
    set.seed(1)
    x4 <- loc_split(lapply(1:10, function(i) sample(LETTERS, sample(8:12, 1))), c(4, 6, 8))
    
    ## data.frame
    vs_change <- head(1 + cumsum(rle(as.character(mtcars[["vs"]]))[[1]]), -1)
    x5 <- loc_split(mtcars, vs_change)
    
    ## matrix
    mat <- matrix(1:50, nrow=10)
    x6 <- loc_split(mat, c(3, 6, 10))
    
    vect_list <- list(list(is.list = TRUE, type = "character", n = 4L, names.null = TRUE), 
                      list(is.list = TRUE, type = "character", n = 4L, names.null = FALSE), 
                      list(is.list = TRUE, type = "ordered", n = 12L, names.null = TRUE), 
                      list(is.list = TRUE, type = "list", n = 4L, names.null = TRUE), 
                      list(is.list = TRUE, type = "data.frame", n = 14L, names.null = TRUE), 
                      list(is.list = TRUE, type = "matrix", n = 4L, names.null = TRUE))
    
    
    expect_equal(vect_list_check(x1), vect_list[[1]])
    expect_equal(vect_list_check(x2), vect_list[[2]])
    expect_equal(vect_list_check(x3), vect_list[[3]])
    expect_equal(vect_list_check(x4), vect_list[[4]])
    expect_equal(vect_list_check(x5), vect_list[[5]])
    expect_equal(vect_list_check(x6), vect_list[[6]])
    
})
