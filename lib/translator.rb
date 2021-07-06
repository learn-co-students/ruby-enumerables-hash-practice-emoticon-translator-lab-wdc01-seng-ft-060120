# require modules here
require "yaml"
require 'pry'

def load_library(library)
  # code goes here
  emoticons_library = YAML.load_file(library)
  emoticons_library.each_with_object({}) do |(emoticon_name, emoticons), final_hash|
    emoticons.each do |english, japanese|
      final_hash[emoticon_name] = {:english => emoticons[0], :japanese => emoticons[1]}
    end
  end
end


def get_english_meaning(library, japanese_emoticon)
  # code goes here
  # input = "japanese_emoticon", output = emoticon_name
  english_meaning = " "
  library_hash = load_library(library)
  library_hash.each do |emoticon_name, emoticon_language|
    emoticon_language.each do |key, value|
      if value == japanese_emoticon
        english_meaning = emoticon_name
      end
    end
  end
  if english_meaning == " "
    english_meaning = "Sorry, that emoticon was not found"
  end
  english_meaning
end
  
  
def get_japanese_emoticon(library, english_emoticon)
  # code goes here
  # input "english_emoticon", output = "japanese_emoticon"
  japanese_emoticon = " "
  library_hash = load_library(library)
  library_hash.each do |emoticon_name, emoticon_language|
    emoticon_language.each do |key, value|
      if value == english_emoticon
        japanese_emoticon = library_hash[emoticon_name][:japanese]
      end
    end
  end
  if japanese_emoticon == " "
    japanese_emoticon = "Sorry, that emoticon was not found"
  end
  japanese_emoticon
end