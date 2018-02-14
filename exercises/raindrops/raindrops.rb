class Raindrops
  DROPS = {3 => "Pling", 5 => "Plang", 7 => "Plong"}
  def self.convert(input)
    result = ""
    DROPS.keys.each do |factor|
      result += DROPS[factor] if input % factor==0
    end
    result = input.to_s if result==""
    result
  end
end

module BookKeeping
  VERSION=3
end