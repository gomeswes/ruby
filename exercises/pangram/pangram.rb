class Pangram
  def self.pangram?(sentence)
    alphabet_amount_chars = 26
    sentence = sentence.downcase.chars.uniq
    sentence = sentence.select do |c|
      c =~ /[A-Za-z]/
    end
    sentence.size == alphabet_amount_chars
  end
end

module BookKeeping
  VERSION=6
end