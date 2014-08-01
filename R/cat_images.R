#' Get a random cat image
#' 
#' Grabs a random cat image from \url{http://theoldreader.com/kittens} and returns it as 
#' an RGB array.
#' @param width Width in pixels of the requested image
#' @param height Height in pixels of the requested image
#' @return An height by width by 3 array containing RGB values between 0 and 1
#' @keywords cats
#' @import httr
#' @import jpeg
#' @export
#' @examples
#' # Give me RGB
#' get_cat(10, 10) 
#' # Or make me a picture
#' plot(1:2, type='n', axes = FALSE)
#' rasterImage(get_cat(), 1, 1, 2, 2)
get_cat <- function(width = 400, height = 400){
  r <- GET(paste("http://theoldreader.com/kittens", width, height, sep = "/"))
  stop_for_status(r)
  content(r)
}

#' Call a kitty to your R session
#' 
#' Grabs a random cat image from \url{http://theoldreader.com/kittens} and displays it.
#' @param ... Arguments passed to \code{\link{get_cat}}, i.e. \code{height} and \code{width}
#' @keywords cats
#' @export
#' @examples
#' here_kitty()
here_kitty <- function(...){
  plot(1:2, type='n', axes = F, ann = FALSE)
  cat(cat_noise())
  rasterImage(get_cat(...), 1, 1, 2, 2)
}

#' Add a kitty to your ggplot2 plot
#' 
#' Grabs a random cat image from \url{http://theoldreader.com/kittens} and creates a 
#' \code{\link{annotation_raster}} layer to add to your ggplot2 plot.
#' @param ... Arguments passed to \code{\link{get_cat}}, i.e. \code{height} and \code{width}
#' @param lighten Number between 0 (no adjustment) and 1 (all white) to lighten the image
#' @param bw Logical, the image should be displayed in grey-scale (\code{FALSE} = full colour)
#' @keywords cats
#' @import ggplot2
#' @export
#' @examples
#' library(ggplot2)
#' ggplot(mpg, aes(cty, hwy)) +
#'  add_cat() +
#'  geom_point()
#'  
#' # In glorious kitty colours
#' ggplot(mpg, aes(cty, hwy)) +
#'  add_cat(bw = FALSE) +
#'  geom_point()
add_cat <- function(..., lighten = 0.7, bw = TRUE){
  img <- get_cat(...)
  if(bw) img <- 0.2989*img[,,1] + 0.5870*img[,,2] + 0.1140*img[,,3]
  lighter <- img + (lighten * (1-img))
  annotation_raster(lighter, xmin=-Inf, xmax=Inf, ymin=-Inf, ymax=Inf)
}

cat_noise <- function(){
  sample(c("mew", "meow", "purrr", "mrow", "mrrrrowwww", "chirrr", "hissst"),
    1, 
    prob = c(0.2, 0.2, 0.2, 0.1, 0.1, 0.1, 0.1))
}

