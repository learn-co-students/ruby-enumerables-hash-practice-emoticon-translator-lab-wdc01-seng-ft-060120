require 'pry'
require "yaml"
# require modules here

def load_library (file_path)
  emoticons = YAML.load_file(file_path) # creates emoticons variable and loads YAML file
  new_hash = {} #made new hash
emoticons.each  do |key, value| #iterates through emoticons 
   new_hash[key] = {} #makes new hash inside of "new_hash" with a key of the emoticons.yml names
   new_hash[key][:english] = value[0] #creates the first key inside the new hash from the first value index in emoticons.yml
   new_hash[key][:japanese] = value[1] #creates the second key inside the new hash from the second value index in emoticons.yml
   
end 
new_hash #calls new_hash
end


def get_japanese_emoticon (file_path, emoticon)
  result = load_library (file_path) #makes variable result and loads the above method with an argument
  meaning = result.keys.find   do |key| #meaning is the "happy", "sad"
  result[key][:english]==emoticon
  end
  if meaning  
    return result[meaning][:japanese]
  end
  "Sorry, that emoticon was not found"
end



def get_english_meaning (file_path, emoticon)
  result = load_library (file_path)
  meaning = result.keys.find   do |key|
    result[key][:japanese]==emoticon  
    end
    if meaning  
      return meaning
    end
    "Sorry, that emoticon was not found"
end

