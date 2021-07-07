# # require modules here
# require "yaml"
#
#
# def load_library
#   YAML::load(file.open('./lib/emoticons.yml'))
#   #YAML.load_file('./lib/emoticons.yml')
#   #:emoticons_name => {:english => e_symbol, :japanese => j_symbol}
#   load_library
#   # code goes here
# end
#
# def get_japanese_emoticon
#   # code goes here
# end
#
# def get_english_meaning(load_library)(file_path)
#   engl_icon = YAML.load_file(file_path)
#   load_library(file_path)
#
#   engl_icon.each do |key, value|
#
#     if engl_icon[key][value][1]
#
#     else
#   end
# end
# end


def load_library(yaml_file)
   output = Hash.new
   response = {:english=> {}, :japanese=> {}}
   library = YAML.load_file(yaml_file)
   library.each do |key, value|

   response[:english] = value[0]
   response[:japanese] = value[1]
  output[key] = response
  end
output
end
