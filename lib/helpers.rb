# frozen_string_literal: true

module XmlParser
  # Helpers for the XmlParser module
  module Helpers
    module_function

    # @param [Integer] duration must be one of PHYSICAL_DIRECTIONS
    # @return [String]
    def duration_as_h_m_string(duration)
      hours = duration / 3600
      minutes = (duration % 3600) / 60
      "#{hours}h #{minutes}m"
    end
  end
end
