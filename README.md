# Lonely Planet Coding Exercise

We have two (admittedly not very clean) .xml files from our legacy CMS system - taxonomy.xml holds the information about how destinations are related to each other and destinations.xml holds the actual text content for each destination.

We would like you to create a batch processor that takes these input files and produces an .html file (based on the output template given with this test) for each destination. Each generated web page must have:
  1. Some destination text content. Use your own discretion to decide how much information to display on the destination page.
  2. Navigation that allows the user to browse to destinations that are higher in the taxonomy. For example, Beijing should have a link to China.
  3. Navigation that allows the user to browse to destinations that are lower in the taxonomy. For example, China should have a link to Beijing.

The batch processor should take the location of the two input files and the output directory as parameters.

## Installation

    git clone git@github.com:47primes/lp-destinations.git
    cd lp-destinations
    gem install lp-destinations-0.0.1.gem

## Usage

### In Code

    require 'lp-destinations'

    LP::Destinations::Processor.build_html(path_to_taxonomy, path_to_destinations, output_dir)

### On The Command Line

The gem comes with a handy command-line tool for converting the input files into HTML files.

    lp-build-destinations /path/to/taxonomy/file /path/to/destinations/file [output/dir]

If `output/dir` is ommitted, all HTML files will be written to the current directory.