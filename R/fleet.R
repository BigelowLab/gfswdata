#' Read a single fleet daily CSV file.
#' 
#' fleet-daily-csvs-100-v2-2020
#' 
#' @export
#' @param date Date, POSIXt or (character as YYYY-mm-dd) to read
#' @param path char, the path to the data
#' @param form char, one of 'raw', 'sf' or 'stars'
#' @return table (tibble), sf POINT or stars object depending upon \code{form}
read_mmsi_daily = function(date = "2020-01-01",
                           path = gfw_path("fleet-daily-csvs-100-v2-2020"),
                           form = c('raw', 'sf', 'stars')[1]){
  if (!inherits(date, "character")) date  = format(date, "%Y-%m-%d")
  filename = file.path(path, paste0(date, ".csv"))
  
  x = readr::read_csv(filename, 
                      col_types = readr::cols(
                        date = readr::col_date(format = ""),
                        cell_ll_lat = readr::col_double(),
                        cell_ll_lon = readr::col_double(),
                        flag = readr::col_character(),
                        geartype = readr::col_character(),
                        hours = readr::col_double(),
                        fishing_hours = readr::col_double(),
                        mmsi_present = readr::col_double()
                      ))
  
  if (tolower(form[1]) %in% c("sf", "stars")){
    x = sf::st_as_sf(x, 
                     coords = c("cell_ll_lon", "cell_ll_lat"),
                     crs = 4326)
    if (tolower(form[1]) ==  "stars"){
      x = stars::st_rasterize(dplyr::select(x, -dplyr::all_of("date")))
    }
  }
  
  x
}