# -*- coding: utf-8 -*-

'''
Created on 18 f�vr. 2018

@author: hp
'''



import json
import glob,os
from tweegle.Tweet import Tweet
import random

#for html
import webbrowser


def getTweetByIdEvent(idEvent):
   
        for id in glob.glob1("Collection", "*.json"):
            file_name=os.path.splitext(id)[0]
            if int(file_name)==idEvent:
                with open('Collection/'+file_name+'.json') as json_data:
                    data=json.load(json_data)
                    listResult=[]  
                    tweetAleatoire=random.sample(range(0, 200), 15)
                    for i in tweetAleatoire:
                        tweets=Tweet()
                        tweets.idTweet=data[str(i)]
                        tweets.type=data[str(i)]["type"]
                        tweets.description=data[str(i)]["description"]
                        tweets.listOfTweet=[]
                        tweets.listOfTweet.append(data[str(i)]["tweets"])                      
                        listResult.append(tweets)
                return listResult
            
            
            
def image_video(fout,i):
    fout.write("<script src=\"http://code.jquery.com/jquery-3.2.1.min.js\"></script>")
    fout.write("<script>\n")
    fout.write("$(document).ready(function() {\n")   
    fout.write("});\n")
    fout.write("window.setTimeout(function(){\n")
    fout.write("$(\"iframe#twitter-widget-"+str(i)+"\").contents().find('div.EmbeddedTweet-tweet').remove();\n")    
    fout.write("}, 3000);\n")
    fout.write("</script>\n")
    

def news_website_tweet(fout,i):
    fout.write("<script src=\"http://code.jquery.com/jquery-3.2.1.min.js\"></script>")
    fout.write("<script>\n")
    fout.write("$(document).ready(function() {\n")   
    fout.write("});\n")
    fout.write("window.setTimeout(function(){\n")
    fout.write("if ($(\"iframe#twitter-widget-"+str(i)+"\").contents().find('div.Tweet-card').length>0 ) {\n")    
    fout.write("$(\"iframe#twitter-widget-"+str(i)+"\").contents().find('div.Tweet-header').remove();\n")
    fout.write("$(\"iframe#twitter-widget-"+str(i)+"\").contents().find('p.Tweet-text').remove();\n")    
    fout.write("$(\"iframe#twitter-widget-"+str(i)+"\").contents().find('ul.Tweet-action--newsActions').remove();\n")    
    fout.write("} else{\n")
    fout.write("$(\"iframe#twitter-widget-"+str(i)+"\").contents().find('ul.Tweet-action--newsActions').remove();\n")
    fout.write("}}, 3000);\n")
    fout.write("</script>\n")
    

def printHtmlPage():
    f = open('testJson.html','w')
    tweetsL=getTweetByIdEvent(1)
    message="""<html>
                <head>
                <meta charset=utf-8 />
                <script src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
                <script type="text/javascript" src="http://platform.twitter.com/widgets.js"></script>
                </head>
                <body>"""
    i=0
    for tweet in tweetsL:                 
                message=message+"""                 
                <div id=" """+str(i)+""" "></div>
                <script>
                twttr.widgets.createTweet('"""+str(tweet.listOfTweet[0][0])+"""',document.getElementById(' """+str(i)+""" '),{theme: 'white'});
                </script>"""
                if(tweet.type=="video" or tweet.type=="img_upload"):                    
                    image_video(f, i)                 
                if(tweet.type=="news" or tweet.type=="website" or tweet.type=="tweet"):
                    news_website_tweet(f,i)
                i=i+1
    message=message+"""
                </body>
                </html>
                """
    f.write(message)
    f.close()
       
    
             
                    
if __name__ == '__main__':
    printHtmlPage()
    webbrowser.open_new_tab('testJson.html')

    