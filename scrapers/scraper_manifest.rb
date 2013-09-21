#!/usr/bin/env ruby

require './esquire_scraper'
require './enigma'


class ScraperManifest
  def initialize
    @esquire = EsquireScraper.new
  # @other = OtherScraper.new
  end

  def run
    @esquire.scrape
  # @other.scrape
  end

end

s = ScraperManifest.new
s.run

