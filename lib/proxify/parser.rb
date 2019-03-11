require 'nokogiri'

module Proxify
  class Parser
    ROW_XPATH          = '//table/tbody/tr'.freeze
    ADDRESS_XPATH      = 'td[1]//text()'.freeze
    PORT_XPATH         = 'td[2]//text()'.freeze
    CODE_XPATH         = 'td[3]//text()'.freeze
    COUNTRY_XPATH      = 'td[4]//text()'.freeze
    ANONYMITY_XPATH    = 'td[5]//text()'.freeze
    GOOGLE_XPATH       = 'td[6]//text()'.freeze
    HTTPS_XPATH        = 'td[7]//text()'.freeze
    LAST_CHECKED_XPATH = 'td[8]//text()'.freeze

    attr_reader :results, :options

    def initialize
      @results = []
    end

    def self.parse(document)
      new.parse(document)
    end

    def parse(document)
      Nokogiri::HTML(document).xpath(ROW_XPATH).each do |row|
        @results << {
          address: row.xpath(ADDRESS_XPATH).text,
          port: row.xpath(PORT_XPATH).text,
          code: row.xpath(CODE_XPATH).text,
          country: row.xpath(COUNTRY_XPATH).text,
          anonymity: row.xpath(ANONYMITY_XPATH).text,
          google: dehumanize_boolean(row.xpath(GOOGLE_XPATH).text),
          https: dehumanize_boolean(row.xpath(HTTPS_XPATH).text),
          last_checked: row.xpath(LAST_CHECKED_XPATH).text
        }
      end

      self
    end

    private

    def dehumanize_boolean(text)
      text.casecmp('yes').zero?
    end
  end
end
