# -*- coding: utf-8 -*-

'''
Created on 12 févr. 2018

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
    tweetsL=getTweetByIdEvent(1)
    message="""<html>
                <head>
                <script type="text/javascript" src="widgets.js"></script>
                </head>
                <body>"""
    for tweet in tweetsL:      
                              
                message=message+"""
                    <div id="container"></div>
                    <script>
                    twttr.widgets.createTweet('256346650132508673',document.getElementById('container'),{theme: 'white', cards: 'visible'});
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