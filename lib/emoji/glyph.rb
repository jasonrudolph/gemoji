module Emoji
  class Glyph
    attr_reader :name

    def initialize(name)
      @name = name
    end

    def image_filename
      # Strip out any neutral skin tone indicators
      without_skintone = name.sub(/\.0(?<gender-modifier>\.[MW])?\z/, '\k<gender-modifier>')

      # Translate gender codepoints
      without_skintone_or_gender =
        without_skintone
        .sub(/\.W\z/, '-2640')
        .sub(/\.M\z/, '-2642')

      codepoints =
        without_skintone_or_gender
        .split('_')
        .map { |codepoint|
          codepoint
            .delete_prefix('u')
            .sub(/\A0*/, '') # remove leading zeros
            .downcase
        }

      "#{codepoints.join('-')}.png"
    end

    def skin_tone_modifier?
      name.match?(/\.[1-5](\.[MW])?\z/)
    end
  end
end
