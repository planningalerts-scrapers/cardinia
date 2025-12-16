# Cardinia Council Scraper

* Server - Unknown
* Cookie tracking - No
* Pagnation - No
* Javascript - No
* Clearly defined data within a row - Yes
* System - Unknown

Enjoy

This is a scraper that runs on [Morph](https://morph.io). To get started [see the documentation](https://morph.io/documentation)

Add any issues to https://github.com/planningalerts-scrapers/issues/issues

## To run the scraper

    bundle exec ruby scraper.rb

### Expected output

    Scraping page...
    Saving record T250023, 250 O'Neil Road, Officer, VIC
    Saving record T250631, Toomuc Valley Road, Pakenham, VIC
    (etc)

Execution time under a minute

## To run style and coding checks

    bundle exec rubocop

## To check for security updates

    gem install bundler-audit
    bundle-audit
