# require modules here
require "yaml"
require 'pry'

def load_library(file_path)
  # code 
  emoticon = YAML.load_file(file_path)
  
  final_result = {}
  emoticon.each do |inner_key, value|
    final_result[inner_key] = {:english => "", :japanese => ""} 
    final_result[inner_key][:english] = value[0]
    final_result[inner_key][:japanese] = value[1]
    
    #binding.pry
  end
  emoticon = final_result
 #binding.pry
end
#load_library('./lib/emoticons.yml')

def get_japanese_emoticon(file_path, emot)
  # code goes here
  result = ""
  wrong_thing = "Sorry, that emoticon was not found"
  
    load_library('./lib/emoticons.yml').each do |key, value|
     if emot == value[:english]
       result = value[:japanese]
       break
     end
     if emot != value[:english]
       result = wrong_thing
     end
    #binding.pry
    end
    result
   #binding.pry
end
  


def get_english_meaning(file_path, emot)
  # code goes here
  result = ""
  wrong_thing = "Sorry, that emoticon was not found"
  
    load_library('./lib/emoticons.yml').each do |key, value|
     if emot == value[:japanese]
       result = key
       break
     end
     if emot != value[:japanese]
       result = wrong_thing
     end
    #binding.pry
    end
    result
   #binding.pry
end