# require modules here
require 'yaml'
require 'pry'

def load_library(file)
    emote_hash = {}
  emoticons = YAML.load_file('./lib/emoticons.yml')
  emoticons.each do |meaning, emotes|
    emote_hash[meaning] = {}
    emote_hash[meaning][:english] = emotes[0]
    emote_hash[meaning][:japanese] = emotes[1]
  end 
  emote_hash
end 

def get_english_meaning(file, jap_emoticon)
  result = "Sorry, that emoticon was not found"
  library = load_library(file)
  library.each do |definition, language|
      if library[definition][:japanese] == jap_emoticon
        result = definition
      end 
      
    end 
  result
end



def get_japanese_emoticon(file, eng_emoticon)
  result = "Sorry, that emoticon was not found"
  library = load_library(file)
  library.each do |definition, language|
    if library[definition][:english] == eng_emoticon
      result = library[definition][:japanese]
    end 
  end 
  
  result

end









