class Complement
  DNA_RNA_COMPLEMENTS = {:C => 'G', :G => 'C', :T => 'A', :A => 'U'}
  
  def self.of_dna(dna_strand)
    rna_strand = dna_strand.chars.map{|c| DNA_RNA_COMPLEMENTS[c.to_sym] }.join
    rna_strand.size == dna_strand.size ? rna_strand : ""
  end
end

module BookKeeping
  VERSION=4
end