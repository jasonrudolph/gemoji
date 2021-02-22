module Emoji
  class Glyph
    attr_reader :name

    def initialize(name)
      @name = name
    end

    def skin_tone_modifier?
      name.match?(/\.[1-5](\.[MW])?\z/)
    end
  end
end
