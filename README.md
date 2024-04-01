Global Fish Watch
================

[Global Fish Watch](https://globalfishingwatch.org/) makes a wide
variety of [data](https://globalfishingwatch.org/datasets-and-code/)
freely available. Here we provide simple tools for archiving, managing
and reading data manually downloaded.

## Requirements

[R v4.1+](https://www.r-project.org/)

[rlang](https://CRAN.R-project.org/package=rlang)

[readr](https://CRAN.R-project.org/package=readr)

[dplyr](https://CRAN.R-project.org/package=dplyr)

[sf](https://CRAN.R-project.org/package=sf)

[stars](https://CRAN.R-project.org/package=stars)

## Installation

Use the [remotes](https://CRAN.R-project.org/package=remotes) package to
install directly from github.

    remotes::install("BigelowLab/remotes)

### Download data

At this time downloading data is a manual process, but if you need
something more dynamic you can use GFW’s
[APIs](https://globalfishingwatch.org/our-apis/) which are not supported
by this package (yet.) Data you download may be compressed; you’ll need
to decompress it and save it to a “data directory”.

The organization of the code is important. Here’s what ours looks like
(abbreviated)…

    /Users/ben/Library/CloudStorage/Dropbox/data/gfw
    ├── README-known-issues-v2.txt
    ├── README-mmsi-v2.txt
    ├── fishing-vessels
    │   └── fishing-vessels-v2.csv
    ├── mmsi-daily-csvs-10-v2-2020
    │   ├── 2020-01-01.csv
    │   ├── 2020-01-02.csv
    │   ├── 2020-01-03.csv
    │   ├── 2020-01-04.csv
    │   ├── 2020-01-05.csv
    │   ├── 2020-01-06.csv
            .
            .
            .
    │   ├── 2020-12-28.csv
    │   ├── 2020-12-29.csv
    │   ├── 2020-12-30.csv
    │   └── 2020-12-31.csv
    └── raster
        └── distance-from-shore.tif

You can see that all of the `mmsi-daily-csvs-10-v2-2020` files are
sequestered into their own directory. While this is generally the case
(one dataset: one directory), note that it is not a requirement.

## Usage

### Set the data path

The data is significant in size so it is not possible to include it in
the package. Instead, the package assumes that you have set a data
directory. We help you do that by providing a function to “hide” the
declared data path in a hidden file within your home directory. Assuming
that you use good password/security hygiene then your path information
will be secure.
