%w(
  destination/children
  destination
  processor
  template
  version
).each { |file| require "lp/destinations/#{file}" }