require 'pry'
require "yaml"
# require modules here

def load_library (file_path)
 
  emoticons = YAML.load_file(file_path)
  
  new_hash = {
   }
emoticons.each  do |key, value|
   new_hash[key] = {}
   new_hash[key][:english] = value[0]
   new_hash[key][:japanese] = value[1]

  #binding.pry

end 
new_hash
#iterate over emoticons, parse out the key and value of emoticons to create a new hash 
  # code goes here
end

def get_japanese_emoticon
  # code goes here
end

def get_english_meaning
  # code goes here
end

