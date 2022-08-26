# frozen_string_literal: true

module XmlParser
  # class XmlParser::Fare
  #
  # Represent a fare
  class Fare
    attr_reader :name, :price

    # @param name [String]
    # @param price [Float]
    def initialize(name:, price:)
      @name = name
      @price = price
    end

    def to_s
      "#{name} - Price: #{price} GDB"
    end
  end
end
