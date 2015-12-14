require 'base64'

module Cryptography
  class Cryptographer

    attr_reader :bytes

    def initialize(hex_string: )
      self.bytes = hex_string_to_bytes(hex_string)
    end

    def to_s
      bytes.map(&:chr).join
    end

    def to_base64
      ::Base64.strict_encode64 to_s
    end

    private

    attr_writer :bytes

    def hex_string_to_bytes(hex_string)
      hex_string.scan(/../).map(&:hex)
    end
  end
end
