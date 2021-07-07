require "yaml"
require 'pry'


def load_library(emogies_library)
  emogies_library = YAML.load_file('./lib/emoticons.yml')
   emogies_library
end

def get_english_meaning(emogies_library, emogi)
  
  answer = ""

 library = load_library(emogies_library) 
  
    library.each{|emoginame, innerhash|
      
        if innerhash.value?(emogi)
       answer =  emoginame
        end
        
                 }
         
 if answer == ""
   answer = "Sorry, that emoticon was not found"
   
else
  answer
end
 
 
end

def get_japanese_emoticon(emogies_library,emogi)

answer = ""

 library = load_library(emogies_library) 
  
    library.each{|emoginame, innerhash|
      
       innerhash.each{|language,emote| 
            
            if emote == emogi 
              answer = innerhash[:japanese]
            end
       
       }
                 }
         
 if answer == ""
   answer = "Sorry, that emoticon was not found"
   
else
  answer
end
 
          
end