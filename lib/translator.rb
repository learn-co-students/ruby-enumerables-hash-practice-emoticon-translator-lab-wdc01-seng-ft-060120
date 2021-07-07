require 'yaml'


def load_library(fp="lib/emoticons.yml")
   yml_hash = YAML.load_file(fp.to_s)
   
   
   yml_hash.each do |key, value|
     
     new_hash = {}
     new_hash[:english] = value[0]
     new_hash[:japanese] = value[1]
     yml_hash[key] = new_hash
     
   end
   yml_hash
end

def get_japanese_emoticon(fp="lib/emoticons.yml", eng)
   
  hash = load_library(fp)
  hash.each do |key, value|
    value.each do |k, v| 
      if (v==eng)
        
        return value[:japanese]
      end
    end
    
  end
  # code goes here
  "Sorry, that emoticon was not found"
end

def get_english_meaning(fp="lib/emoticons.yml", jap)
  
  hash = load_library(fp)
  hash.each do |key, value|
    value.each do |k, v| 
      if (v==jap)
        
        return key
      end
    end
    
  end
  # code goes here
  "Sorry, that emoticon was not found"
end
