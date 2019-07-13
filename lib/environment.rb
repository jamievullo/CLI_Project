require 'bundler/setup'
require 'open-uri'
require 'nokogiri'
require 'pry'
require 'colorize'
Bundler.require(:default, :development)


require_relative "./CLI_Project/version"
require_relative './CLI_Project/cli'
require_relative './CLI_Project/scraper'
require_relative './CLI_Project/sightings'

