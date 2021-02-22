require 'test_helper'
require 'emoji/glyph'

class GlyphTest < TestCase
  test "#skin_tone_modifier? returns true for emoji with skin tone modifiers" do
    %w[
      u1F9D1_u1F9AF.1
      u1F9D1_u1F9AF.2
      u1F9D1_u1F9AF.3
      u1F9D1_u1F9AF.4
      u1F9D1_u1F9AF.5
      u1F9B9.1
      u1F9B9.1.M
      u1F9B9.1.W
      u1F9B9.2
      u1F9B9.2.M
      u1F9B9.2.W
      u1F9B9.3
      u1F9B9.3.M
      u1F9B9.3.W
      u1F9B9.4
      u1F9B9.4.M
      u1F9B9.4.W
      u1F9B9.5
      u1F9B9.5.M
      u1F9B9.5.W
    ].each do |name|
      assert_predicate Emoji::Glyph.new(name), :skin_tone_modifier?
    end
  end

  test "#skin_tone_modifier? returns false for emoji without skin tone modifiers" do
    %w[
      u1FA82
      u1F3F4_uE0067_uE0062_uE0065_uE006E_uE0067_uE007F
      u1F1E6_u1F1E9
      u1F9D6.0
      u1F9D6.0.M
      u1F9D6.0.W
    ].each do |name|
      refute_predicate Emoji::Glyph.new(name), :skin_tone_modifier?
    end
  end
end
