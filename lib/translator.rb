require "yaml"

#loads file to hash. creates new hash of hashes with outer hash keys the
#english meanings and inner hash keys the language, with inner values 
#being the corresponding emoticons.
def load_library(file)
  emo = YAML.load_file(file)
  new_hash = {}
  emo.each_pair do |name, array|
    new_hash.store(name, {:english => array[0], :japanese => array[1]})
  end
  new_hash
end

#populates a hash of hashes using load_library, then searches the resulting 
#hash for the input english emoticon, returning the corresponding japanese
#one if found, and an apology if not 
def get_japanese_emoticon(file, english_emoticon)
  emo = load_library(file)
  apology = "Sorry, that emoticon was not found"
  emo.each_pair do |meaning, emoticons|
    if emoticons.has_value?(english_emoticon)
      return emoticons[:japanese]
    end
  end
  apology
end

#see above. returns meaning instaed of corresponding japanese emoticon
def get_english_meaning(file, emoticon)
  emo = load_library(file)
  apology = "Sorry, that emoticon was not found"
  emo.each_pair do |meaning, emoticons|
    if emoticons.has_value?(emoticon)
      return meaning
    end
  end
  apology
end
