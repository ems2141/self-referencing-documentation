class Dictionary
  def initialize(data)
    @data = data
  end

  def look_up(term)
    result = {}
    definition = @data[term]["definition"]

    result[:definition] = definition.gsub(/\{|\}/, "")

    referenced_terms = definition.scan(/{(.*?)}/).flatten.map { |other_word|
      @data[other_word]
    }

    result[:see_also] = referenced_terms.map { |referenced_term|
      referenced_term["url"]
    }

    result
  end
end