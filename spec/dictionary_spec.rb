require 'spec_helper'
require_relative '../lib/dictionary'

describe Dictionary do
  it "do stuff" do
    data = {
        "word" => {
        "definition" => "a {collection} of letters",
        "url" => "//example.com/word"
    },
        "letter" => {
        "definition" => "a character representing one or more of the sounds used in speech; any of the symbols of an alphabet",
        "url" => "//example.com/letter"
    },
        "collection" => {
        "definition" => "a group of things or people",
        "url" => "//example.com/collection"
    }
    }

    definition = Dictionary.new(data).look_up("word")

    expect(definition).to eq({
                                 definition: "a collection of letters",
                                 see_also: [
                                     "//example.com/collection"
                                 ]
                             })

  end
end