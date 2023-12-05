library(mooneyR)
library(imager)
library(magick)
library(tidyverse)


crop_size <- c(500, 500)
path_to_colour <- "assets/img/colour_images/"
path_to_greyscale <- "assets/img/grey_images/"
path_to_mooney <- "assets/img/mooney_images/"

generate_difficulty(3,5,8, length = 1)

greyscale(path_to_colour, path_to_greyscale)

mooney(path_to_greyscale, path_to_mooney)
