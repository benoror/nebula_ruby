require File.expand_path('../../lib/nebula', __FILE__)
require 'rspec'
require 'webmock/rspec'
require 'vcr'
require 'pry'

TOKEN = 'eyJhbGciOiJIUzI1NiJ9'
URL = 'http://localhost'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/fixtures'
  c.hook_into :webmock
  c.configure_rspec_metadata!
end
