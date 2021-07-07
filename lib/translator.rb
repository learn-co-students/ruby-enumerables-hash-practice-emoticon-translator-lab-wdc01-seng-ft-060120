require 'pry'
require 'yaml'
def load_library (file_path)
  emoj_icon = YAML.load_file(file_path)
 emotions_hash = { }
 emoj_icon.each do |key, value|
 
    if !emotions_hash[key]
      emotions_hash[key] = { :english => value[0], :japanese => value[1], }
    end
  end
  emotions_hash
end


def get_english_meaning(file_path, engl_icon)
  hash = load_library(file_path)
  
  hash.each do |key, value|

    if engl_icon == value[:japanese]
    return key
    end
  end
    "Sorry, that emoticon was not found"
end


def get_japanese_emoticon(file_path, west_icon)
  
 dictionary = load_library(file_path)
 dictionary.each do |key, value|
   if west_icon == value[:english]
     return value[:japanese]
   end
 end
 "Sorry, that emoticon was not found"
end