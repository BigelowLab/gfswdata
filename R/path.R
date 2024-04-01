#' Set the GFW data path
#'
#' @export
#' @param path the path that defines the location of GFW data
#' @param filename the name the file to store the path as a single line of text
#' @return NULL invisibly
set_root_path <- function(path = "/mnt/s1/projects/ecocast/coredata/gfw",
                          filename = "~/.gfwdata"){
  cat(path, sep = "\n", file = filename)
  invisible(NULL)
}

#' Get the GFW data path from a user specified file
#'
#' @export
#' @param filename the name the file to store the path as a single line of text
#' @return character data path
root_path <- function(filename = "~/.gfwdata"){
  readLines(filename)
}



#' Retrieve the GFW path, possible building a path
#'
#' @export
#' @param ... further arguments for \code{file.path()}
#' @param root the root path
#' @return character path description
gfw_path <- function(...,
                            root = root_path()) {
  
  file.path(root, ...)
}

#' Given a path - make it if it doesn't exist
#'
#' @export
#' @param path character, the path to check and/or create
#' @param recursive logical, create paths recursively?
#' @param ... other arguments for \code{dir.create}
#' @return logical, TRUE if the path exists or is created
make_path <- function(path, recursive = TRUE, ...){
  ok <- dir.exists(path[1])
  if (!ok){
    ok <- dir.create(path, recursive = recursive, ...)
  }
  ok
}