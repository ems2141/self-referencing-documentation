class Dictionary
  def initialize(dictionary_result)
    @dictionary_result = dictionary_result
  end

  def look_up(word)
    # match look up word to key in hash
    # this definition goes into the defition key of the results hash
    # find words in the def that are in brackets
    # search for those words as keys of the dic result hash
    #may need to cut off an s at the end
    # store the links in the see_also key of the restuls hash
    results = {}
    results[word] = @dictionary_result.select { |k, v| k == word }[word]["definition"]
    new_result = results[word].split(" ")
    more_words_to_look_up = []
    new_result.each do |def_word|
      if def_word.include?("{") && def_word.include?("}")
        word_without_bracket = def_word.gsub!('{','').gsub!('}','')
        more_words_to_look_up << word_without_bracket
        results[word].gsub!(def_word, word_without_bracket)
      end
      more_words_to_look_up
      results[word]
    end
      #{"word"=>{"definition"=>"a {collection} of {letters}", "url"=>"//example.com/word"}}
    end
  end