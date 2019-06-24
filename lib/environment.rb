require 'open-uri'
require 'nokogiri'
require 'pry'
require_relative "./CLI_Project/version"

module CLIProject
  class Error < StandardError; end
  # Your code goes here...
end

require_relative './cli'
require_relative './scraper'

