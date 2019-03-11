require 'proxify/version'
require 'proxify/provider'
require 'proxify/parser'

require 'open-uri'

module Proxify
  class List
    def initialize(provider = :default)
      @provider = Proxify::Provider.new(provider)
    end

    def proxies
      @proxies ||= fetch
    end

    def refresh!
      @proxies = fetch
    end

    def elite_proxies
      proxies.select { |proxy| proxy[:anonymity] == 'elite proxy' }
    end

    def anonymous_proxies
      proxies.select { |proxy| proxy[:anonymity] == 'anonymous' }
    end

    private

    def fetch
      Proxify::Parser.parse(URI.open(@provider.url).read).results
    end
  end
end
