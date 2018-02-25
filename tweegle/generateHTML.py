import os, sys
import json
import numpy as np
from pprint import pprint

# -----------------------------------------------
# -----------------------------------------------
# FUNCTIONS
# -----------------------------------------------
# -----------------------------------------------


# define the function blocks
def tweet(fout):
    print "Tweet.\n"
    #fout.write("Tweet")

def video(fout):
    print "Video\n"
    fout.write("<script src=\"http://code.jquery.com/jquery-3.2.1.min.js\"></script>")
    fout.write("<script>\n")
    fout.write("$(document).ready(function() {\n")
    fout.write("$(\"body\").hide();\n")
    fout.write("});\n")
    fout.write("window.setTimeout(function(){\n")
    fout.write("$(\"iframe#twitter-widget-0\").contents().find('div.Tweet-header').remove();\n")
    fout.write("$(\"iframe#twitter-widget-0\").contents().find('p.Tweet-text').remove();\n")
    fout.write("$(\"iframe#twitter-widget-0\").contents().find('div.Tweet-metadata').remove();\n")
    fout.write("$(\"iframe#twitter-widget-0\").contents().find('ul.Tweet-actions').remove();\n")
    fout.write("$(\"body\").show();\n")
    fout.write("}, 400);\n")
    fout.write("</script>\n")

def image(fout):
    print "Image\n"
    fout.write("<script src=\"http://code.jquery.com/jquery-3.2.1.min.js\"></script>")
    fout.write("<script>\n")
    fout.write("$(document).ready(function() {\n")
    fout.write("$(\"body\").hide();\n")
    fout.write("});\n")
    fout.write("window.setTimeout(function(){\n")
    fout.write("$(\"iframe#twitter-widget-0\").contents().find('div.Tweet-header').remove();\n")
    fout.write("$(\"iframe#twitter-widget-0\").contents().find('p.Tweet-text').remove();\n")
    fout.write("$(\"iframe#twitter-widget-0\").contents().find('div.Tweet-metadata').remove();\n")
    fout.write("$(\"iframe#twitter-widget-0\").contents().find('ul.Tweet-actions').remove();\n")
    fout.write("$(\"body\").show();\n")
    fout.write("}, 400);\n")
    fout.write("</script>\n")

def website(fout):
    print "Website\n"

def news(fout):
    print "News\n"
    fout.write("<script src=\"http://code.jquery.com/jquery-3.2.1.min.js\"></script>")
    fout.write("<script>\n")
    fout.write("$(document).ready(function() {\n")
    fout.write("$(\"body\").hide();\n")
    fout.write("});\n")
    fout.write("window.setTimeout(function(){\n")
    fout.write("$(\"iframe#twitter-widget-0\").contents().find('div.Tweet-header').remove();\n")
    fout.write("$(\"iframe#twitter-widget-0\").contents().find('p.Tweet-text').remove();\n")
    fout.write("$(\"iframe#twitter-widget-0\").contents().find('div.Tweet-metadata').remove();\n")
    fout.write("$(\"iframe#twitter-widget-0\").contents().find('ul.Tweet-actions').remove();\n")
    fout.write("$(\"body\").show();\n")
    fout.write("}, 400);\n")
    fout.write("</script>\n")


# -----------------------------------------------
# -----------------------------------------------
# MAIN
# -----------------------------------------------
# -----------------------------------------------

pathMappingGenerique = "Raw/{idEvent}/mapping/mapping.json"
pathEvent = "Raw/"
pathOutput = "Html/"
pathWidget = "Html/widget.js"

# map the inputs to the function blocks
options = {"tweet" : tweet,
           "video" : video,
           "img_url" : image,
           "website" : website, 
           "news" : news,
           "img_upload" : image,          
}


# Load data into a list (one list per event)
for idEvent in os.listdir(pathEvent) :
  if os.path.exists(pathOutput+idEvent) :
    os.system('rm -r '+pathOutput+idEvent)

  os.system('mkdir '+pathOutput+idEvent)
  print "Evenement :"+idEvent
  
  pathMapping = pathMappingGenerique.format(idEvent=idEvent)
  with open(pathMapping, "r") as fmap :
    mappingJson = json.load(fmap)
    #print(mappingJson)
    for idDoc in mappingJson :
      print "--idDoc :"+idDoc
      pathOutputClustering = pathOutput+idEvent+"/"+idDoc+".html"
      docType=mappingJson[idDoc]["type"]
      print docType
      for tweet in mappingJson[idDoc]["tweets"]:
        print tweet
        with open(pathOutputClustering,"w") as fout:
          fout.write("<html><head><title>"+idDoc+"</title>\n")
          fout.write("<script type=\"text/javascript\" src=\"../widgets.js\"></script>")
          options[docType](fout)
          fout.write(" </head>\n")
          fout.write("<body>\n")
          fout.write("<div id=\"container\"></div>")
          fout.write("<script>")
          fout.write("twttr.widgets.createTweet('"+tweet+"',document.getElementById('container'),{theme: 'white'});")
          fout.write("</script>")

          fout.write("</body>")
          fout.write("</html>")
          #print options["tweet"]
          
          
      
        break
        #keep only the first tweet for a given idDoc
      #break  
  #break

      

  
  
    







