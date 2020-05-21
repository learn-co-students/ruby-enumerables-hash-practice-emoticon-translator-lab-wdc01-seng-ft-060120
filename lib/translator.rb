# require modules here
require 'pry'
require "yaml"

def load_library(file_path)
  # code goes here
  emoticon_library = YAML.load_file(file_path)
  # binding.pry
  
  emoticon_library.each_with_object({}) do |(key, value), final_hash|
    # binding.pry
    final_hash[key] = {
      :english => value[0],
      :japanese => value[1]
    }
    # binding.pry
  end
end




def get_english_meaning (file_path, emoticon)
  # code goes here
  emoticon_hash = load_library(file_path)
  emoticon_hash.each do |key, value|
    #binding.pry
    if emoticon == value[:japanese] 
    return key
    end
    end
  return "Sorry, that emoticon was not found"
end

def get_japanese_emoticon (file_path, emoticon)
  # code goes here
  emoticon_hash = load_library(file_path) 
  emoticon_hash.each do |key, value|
    #binding.pry
    if emoticon == value[:english] 
    return value[:japanese]
    end
    end
  return "Sorry, that emoticon was not found"
end