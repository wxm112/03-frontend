# def anagrams_game (word, list)
#     word_letter_array = word.split(//)
#     list_letter_array = []
#     list.each {|w| list_letter_array << w.split(//)}
#     result = []
#     list_letter_array.each do |a|
#         if word_letter_array.sort == a.sort 
#             result << a
#         end
#     end
#     result.map {|w| w.join}
# end



# p anagrams_game("listen", %w(enlists google inlets banana))

    

class AnagramDetector

    def initialize(word, possible_anagrams)
        @word = word
        @possible_anagrams = possible_anagrams
    end


    def anagrams
        matches = @possible_anagrams.select {|word| is_anagram?(word)}
        matches
    end

    private

    def is_anagram?(word)
        # Splits words into characters and sorts them
        @word.chars.sort == word.chars.sort
    end
end

a = AnagramDetector.new("listen" , %w(enlists google inlets banana))
puts a.anagrams    
    
