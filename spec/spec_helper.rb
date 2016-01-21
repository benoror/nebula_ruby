require File.expand_path('../../lib/nebula', __FILE__)
require 'rspec'
require 'webmock/rspec'
require 'vcr'
require 'pry'

URL = 'http://69.16.245.56:8080'
TOKEN = 'eyJhbGciOiJIUzI1NiJ9.eyJpYXQiOjE0NTMzMjg1NDgsInN1YiI6IkNvcnJlY3RvIiwiaXNzIjoiTmVidWxhIiwiYXBwIjoiMyJ9.0E1SPwKauD9v6Nq6cOpg6SromgHB6GA2IT68Gcyn9yE'
BASE_PATH = '/NebulaTest/rest'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/fixtures'
  c.hook_into :webmock
  c.default_cassette_options = { match_requests_on: [:method] }
  c.configure_rspec_metadata!
end
