# require modules here
require 'yaml'
require 'pry'

def load_library(file_path)
  # code goes here
  emoticons = YAML.load_file(file_path)

  emoticon_hash = {}

  emoticons.each do |(key, values)|
    emoticon_hash[key] = {}
    emoticon_hash[key][:english] = values[0]
    emoticon_hash[key][:japanese] = values[1]
  end

  return emoticon_hash
end

def get_japanese_emoticon(file_path, emoticon)
  # code goes here
  emotes = load_library(file_path)

  emotes.each do |key, value|
    if emotes[key][:english] == emoticon
      return emotes[key][:japanese]
    end
  end

  return "Sorry, that emoticon was not found"
end

def get_english_meaning(file_path, emoticon)
  # code goes here
  emotes = load_library(file_path)

  emotes.each do |key, value|
    if emotes[key][:japanese] == emoticon
      return key
    end
  end

  return "Sorry, that emoticon was not found"
end
