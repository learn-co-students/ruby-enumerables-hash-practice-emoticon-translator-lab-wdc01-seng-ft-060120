# require modules here
require 'yaml'
require 'pry'
def load_library (file)
  library = YAML.load_file(file)
  library.each_with_object ({}) do |(key, value), final_library|
    final_library[key] = {:english => "", :japanese => ""}
    final_library[key][:english] = library[key][0]
    final_library[key][:japanese] = library[key][1]
  end
end

def get_japanese_emoticon(file, english_emoticon)
  emoticon_library = load_library(file)
  test_array = []
  emoticon_library.each do |english_meaning, hash_of_emoticons|
    if hash_of_emoticons.value?(english_emoticon)
      return hash_of_emoticons[:japanese]
    else 
      test_array << "x"
    end
  end
  if test_array.length == emoticon_library.size
    return "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file, japanese_emoticon)
  emoticon_library = load_library(file)
  test_array = []
  emoticon_library.each do |english_meaning, hash_of_emoticons|
    if hash_of_emoticons.value?(japanese_emoticon)
      return english_meaning
    else 
      test_array << "x"
    end
  end
  if test_array.length == emoticon_library.size
    return "Sorry, that emoticon was not found"
  end
end