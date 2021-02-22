module Emoji
  class Glyph
    attr_reader :name

    def initialize(name)
      @name = name
    end

    def image_filename
      # Strip out any neutral skin tone indicators
      basename = name.sub(/\.0(?<gender-modifier>\.[MW])?\z/, '\k<gender-modifier>')

      # Translate gender codepoints
      basename =
        basename
        .sub(/\.W\z/, '-2640')
        .sub(/\.M\z/, '-2642')

      # Strip out the unicode prefixes and join dashes instead of underscores
      basename =
        basename
        .delete_prefix('u')
        .sub('_u', '-').downcase

      "#{basename}.png"
    end

    def skin_tone_modifier?
      name.match?(/\.[1-5](\.[MW])?\z/)
    end
  end
end
