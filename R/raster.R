#' Read a GFW raster file
#' 
#' @export
#' @param name char, the name of the file to read
#' @param path char, the path to the dataset
#' @return stars object
read_gfw_raster = function(name = "distance-from-shore",
                           path = gfw_path("raster")){
  
  filename = file.path(path, paste0(name, ".tif"))
  stars::read_stars(filename)
}
