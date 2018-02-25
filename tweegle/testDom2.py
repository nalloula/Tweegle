# -*- coding: utf-8 -*-

'''
Created on 12 f�vr. 2018

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
            
            
            

            
def printHtmlPage():
    f = open('testJson.html','w')
    tweetsL=getTweetByIdEvent(2)
    message="""<html>
                <head>
                <script type="text/javascript" src="widgets.js"></script>
                
                  
                </head>
                <body>"""
                
    for tweet in tweetsL:     
            if tweet.type=="video" or tweet.type=="news" or tweet.type=="img_upload" :
                message=message+"""
                <script src="http://code.jquery.com/jquery-3.3.1.min.js"></script>
                    <script>"
                    $(document).ready(function() {
                    
                    });    
                    window.setTimeout(function(){
                    $("iframe#twitter-widget-0").contents().find('div.Tweet-header').remove();
                    $("iframe#twitter-widget-0").contents().find('p.Tweet-text').remove();
                    $("iframe#twitter-widget-0").contents().find('div.Tweet-metadata').remove();
                    $("iframe#twitter-widget-0").contents().find('ul.Tweet-actions').remove();
                    $("iframe#twitter-widget-0").contents().find('.twitter-timeline').remove();
                    $("body").show();
                    }, 400);
                    </script>
                    
                    <div id="container"></div>
                    <script>
                    twttr.widgets.createTweet('"""+str(tweet.listOfTweet[0][0])+"""',document.getElementById('container'),{theme: 'white', cards: 'visible'});
                    </script>"""
            else:
              
                     message=message+"""
                    <div id="container"></div>
                    <script>
                    twttr.widgets.createTweet('"""+str(tweet.listOfTweet[0][0])+"""',document.getElementById('container'),{theme: 'white', cards: 'visible'});
                    </script>"""
    message=message+"""
                </body>
                </html>
                    """
    f.write(message)
    f.close()
    
    
    
    
          
                    
if __name__ == '__main__':
    printHtmlPage()
    webbrowser.open_new_tab('testJson.html')

    