def anagrams_game (word, list)
    word_letter_array = word.split(//)
    list_letter_array = []
    list.each {|w| list_letter_array << w.split(//)}
    result = []
    list_letter_array.each do |a|
        if word_letter_array.sort == a.sort 
            result << a
        end
    end
    result.map {|w| w.join}
end



p anagrams_game("listen", %w(enlists google inlets banana))

    

    
    
