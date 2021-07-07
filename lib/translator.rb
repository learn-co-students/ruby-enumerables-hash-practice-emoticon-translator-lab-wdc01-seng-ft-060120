require 'pry'
require "yaml"

def load_library(filename)
  emoticons = YAML.load_file(filename)
  emoticons.reduce({}){|new, (key,valueArray)|
    new[key] = {:english => valueArray[0], :japanese => valueArray[1]}
    new 
  }
  
  
  
end

def get_japanese_emoticon(filename, eng_vers)
  #default message if not found
  jap_vers = "Sorry, that emoticon was not found"
  
  hash = load_library(filename)
  hash.each{|(key_out, val_out)|
      if(val_out[:english] == eng_vers)
        jap_vers = val_out[:japanese]
        found = true
      end 
    }
  jap_vers  
 end

def get_english_meaning(filename, emoticon)
  eng_meaning = "Sorry, that emoticon was not found"
  
  hash = load_library(filename)
  
  hash.each{|key, val|
    if(val[:japanese] == emoticon)
      eng_meaning = key.to_s 
    end
  }
  eng_meaning
end