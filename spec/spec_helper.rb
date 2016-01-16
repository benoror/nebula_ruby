require File.expand_path('../../lib/nebula', __FILE__)
require 'rspec'
require 'webmock/rspec'
require 'vcr'
require 'pry'

URL = 'https://api.nebula.com'
TOKEN = 'eyJhbGciOiJIUzI1NiJ9'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/fixtures'
  c.hook_into :webmock
  c.configure_rspec_metadata!
end
