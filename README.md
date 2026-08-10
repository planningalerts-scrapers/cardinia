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

    Injecting configuration and compiling...
    Injecting scraper and running...
    Using Australian proxy: http://***@...
    Using user agent: Ruby/3.2.2 PlanningAlerts scraper for Cardinia Shire Council/1.0 (https://www.planningalerts.org.au/about)
    Scraping page: https://www.cardinia.vic.gov.au/planning-and-building/applying-and-managing-planning-applications-and-permits/current-advertised
    Saving record T250324, 5445 South Gippsland HighwayLang Lang, VIC

    (Sometimes it fixes urls:)
    NOT: Reference: T250582 had an invalid url (https://T250582 PA - Advertising Package - 1340 Westernport Rd, Heath Hill), using list url instead!
    Saving record T250582, 1340 Westernport Road, Heath Hill, VIC
    Saving record T200592-1, 43 Tynong Road, Tynong, VIC
    Saving record T240496, 150 Macclesfield Road, Avonsleigh, VIC
    ...
    Saving record T260120, 3 George Street, Bunyip, VIC
    Saving record T160676-2, 95 Hall Road, Pakenham South, VIC
    Saving record T260459, Commercial Drive, Pakenham, VIC
    Finished! Saved 18 applications.

Execution time under a minute

## To run style and coding checks

    bundle exec rubocop

## To check for security updates

    gem install bundler-audit
    bundle-audit
