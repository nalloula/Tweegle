# -*- coding: utf-8 -*-

import json
import glob,os
from tweegle.Tweet import Tweet
import random

def getTweetByIdEvent(idEvent):
   
    for id in glob.glob1("Collection", "*.json"):
        file_name=os.path.splitext(id)[0]
        if int(file_name)==idEvent:
            with open('Collection/'+file_name+'.json', encoding="utf8") as json_data:
                data=json.load(json_data)
                listResult=[]
                indices = random.sample(range(0,200), 15)
                indices = [str(index) for index in indices]
                print(indices)
                for index in indices:             
                    tweets=Tweet()
                    tweets.idTweet=data[index]
                    tweets.type=data[index]["type"]
                    tweets.description=data[index]["description"]
                    tweets.listOfTweet=[]
                    tweets.listOfTweet.append(data[index]["tweets"])                      
                    listResult.append(tweets)
            return listResult
                
if __name__ == '__main__':
    tweetsL=getTweetByIdEvent(0)
    for tweet in tweetsL:
        print(tweet.description)
