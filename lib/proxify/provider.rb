module Proxify
  class UnknownProviderError < StandardError; end

  class Provider
    AVAILABLE = {
      default: { url: 'https://free-proxy-list.net/' },
      us: { url: 'https://www.us-proxy.org/' },
      uk: { url: 'https://free-proxy-list.net/uk-proxy.html' },
      web: { url: 'https://free-proxy-list.net/web-proxy.html' },
      anonymous: { url: 'https://free-proxy-list.net/anonymous-proxy.html' },
      google: { url: 'http://www.google-proxy.net/' },
      socks: { url: 'https://www.socks-proxy.net/' },
      ssl: { url: 'https://www.sslproxies.org/' }
    }.freeze

    attr_accessor :provider

    def initialize(code)
      self.provider = AVAILABLE[code]
      raise UnknownProviderError if provider.nil?
    end

    def url
      provider[:url]
    end
  end
end
