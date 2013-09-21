#!/usr/bin/env ruby

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


require_relative 'esquire_scraper'
#require_relative 'other_scraper'
s = ScraperManifest.new
s.run

