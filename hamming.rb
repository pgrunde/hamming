require_relative "testing_library"

def hamming(strand_1, strand_2)
  hamming = 0
  arr_1 = strand_1.split(//)
  arr_2 = strand_2.split(//)

  if arr_1.length < arr_2.length
    shortest_length = arr_1.length
  else
    shortest_length = arr_2.length
  end

  iter = 0
  shortest_length.times do
    hamming += 1 if arr_1[iter] != arr_2[iter]
    iter += 1
  end

  hamming
end



check("Hamming distance between identical strands",
      hamming("A", "A") == 0)

check("Hamming distance for single nucleotide strand",
      hamming("A", "G") == 1)

check("Hamming distance between small strands",
      hamming("AG", "CT") == 2)

check("Hamming distance between two other small strands",
      hamming("AT", "CT") == 1)

check("Hamming distance in longer strands",
      hamming("GGACG", "GGTCG") == 1)

check("Ignoring extra length in the first strand when it's longer",
      hamming("AAAG", "AAA") == 0)

check("Ignoring extra length in the second strand when it's longer",
      hamming("AAA", "AAAG") == 0)