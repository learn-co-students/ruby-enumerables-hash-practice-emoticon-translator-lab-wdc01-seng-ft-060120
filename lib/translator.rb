# require modules here
require "yaml"
require 'pry'

def load_library(emoticons_file)
  emoticons = YAML.load_file(emoticons_file)
  
  emoticons.transform_values do |value|
    value = {:english => value[0], :japanese => value[1]}
  end
end

def get_japanese_emoticon(emoticons_file, emoticon_to_find)
  library = load_library(emoticons_file)
  
  found_emoticon = ""
  
  library.each do |meaning, language_hash|
    if language_hash[:english] == emoticon_to_find
      found_emoticon = language_hash[:japanese]
    end
  end
  
  if found_emoticon == ""
    found_emoticon = "Sorry, that emoticon was not found"
  end
  
  found_emoticon
end

def get_english_meaning(emoticons_file, emoticon_to_find)
  library = load_library(emoticons_file)
  
  found_meaning = ""
  
  library.each do |meaning, language_hash|
    if language_hash[:japanese] == emoticon_to_find
      found_meaning = meaning
    end
  end
  
  if found_meaning == ""
    found_meaning = "Sorry, that emoticon was not found"
  end
  
  found_meaning
end