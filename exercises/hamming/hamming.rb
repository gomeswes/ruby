class Hamming 
  def self.compute(first_dna_strand, second_dna_strand)
    raise ArgumentError if first_dna_strand.size != second_dna_strand.size
    diff = 0
    for i in 0..first_dna_strand.size
      diff += 1 if first_dna_strand[i] != second_dna_strand[i]
    end
    diff
  end
end

module BookKeeping
  VERSION=3
end