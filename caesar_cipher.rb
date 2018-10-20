# frozen_string_literal: true

# Encrypts & Decrypts plain text
class CaesarCipher
  attr_reader :lower_case, :upper_case

  def initialize
    @lower_case = ('a'..'z').to_a.join
    @upper_case = ('A'..'Z').to_a.join
  end

  def good_args?(shift:, text:)
    raise ArgumentError unless shift.is_a? Integer
    raise ArgumentError unless text.is_a? String

    true
  end

  def encrypt(shift:, text:)
    good_args?(shift: shift, text: text)

    lower_cipher = make_lower_cipher(shift: shift)
    upper_cipher = make_upper_cipher(shift: shift)

    text = text.tr(@lower_case, lower_cipher)
    text.tr(@upper_case, upper_cipher)
  end

  def decrypt(shift:, text:)
    good_args?(shift: shift, text: text)

    lower_cipher = make_lower_cipher(shift: shift)
    upper_cipher = make_upper_cipher(shift: shift)

    text = text.tr(@lower_case, lower_cipher)
    text.tr(@upper_case, upper_cipher)
  end

  private

  def make_lower_cipher(shift:)
    # duplicate alphabet, create array of chars, rotate(n) times
    # join to make a string
    @lower_case.dup.chars.rotate(shift).join
  end

  def make_upper_cipher(shift:)
    @upper_case.dup.chars.rotate(shift).join
  end
end

# Example:
#
# cc = CaesarCipher.new
# puts cc.encrypt(shift: 1, text: "Hello")
