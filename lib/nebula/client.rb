require 'faraday'
require 'faraday_middleware'

module Nebula
  class Client
    attr_accessor :request, :url

    def initialize(options={})
      @token = options[:token]
      @url = options[:url]
      @base_path = options[:base_path]
    end

    def request(type, path, params={})
      block = Proc.new do |request|
        request.url "#{base_path}#{path}"
        request.headers['Authorization'] = "Token #{token}"
        request.headers['Content-Type'] = 'application/json'
      end

      send("#{type}_request", path, params, &block)
    end

    private
    def put_request(path, params={}, &block)
      connection.put do |request|
        yield(request)
        request.body = params.to_json
      end
      .body
    end

    def post_request(path, params={}, &block)
      connection.post do |request|
        yield(request)
        request.body = params.to_json
      end
      .body
    end

    def get_request(path, params={}, &block)
      connection.get do |request|
        yield(request)
        params.each { |key, val| request.params[key] = val }
      end
      .body
    end

    def token
      @token
    end

    def url
      @url
    end

    def base_path
      @base_path
    end

    def connection
      @connection ||= Faraday.new(url: url) do |b|
        b.adapter Faraday.default_adapter
        b.use Faraday::Response::RaiseError
        b.response :json, content_type: /\bjson$/
      end
    end
  end
end
