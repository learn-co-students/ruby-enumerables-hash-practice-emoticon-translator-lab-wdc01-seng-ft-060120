# require modules here
require 'pry'
require 'yaml'


def load_library(emoti)
  new_hash = Hash.new
  emoti = YAML.load_file('./lib/emoticons.yml')
  emoti.each do |key,value| 
    new_hash[key] = {}
    new_hash[key][:english] = value[0]
    new_hash[key][:japanese] = value[1]
   end
 new_hash
end

def get_japanese_emoticon(link,emot_eng)
  # code goes here
  japanese_emot = "Sorry, that emoticon was not found"
  yml_hash = load_library(link)
  yml_hash.each do |key,value| 
     if value[:english] == emot_eng
      japanese_emot =   value[:japanese]
      end
  end
   japanese_emot
end

def get_english_meaning(link,emot_jap)
  # code goes here
  eng_meaning = "Sorry, that emoticon was not found"
  yml_hash = load_library(link)
  yml_hash.each do |key,value| 
     if value[:japanese] == emot_jap
      eng_meaning = key 
      end
  end
   eng_meaning 
end

