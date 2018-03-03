# -*- coding: utf-8 -*-
'''
the function getTweetByIdEv take as parameter the id of a event finds the json file (in the collection) that have the same id.
the json contains tweets related to the event, we then chose randomly 15 tweets from this collection and put the in a list (listResult).
'''
import fnmatch
import json
import os
from tweegle.tweet import Tweet
import random


def getTweetByIdEv(idEvent):
   
        for root, dirnames, filenames in os.walk('../projetLong/tweegle/Collection'):
            for filename in fnmatch.filter(filenames, '*.json'):
                    file_name = os.path.splitext(filename)[0]
                    if int(file_name) == idEvent:
                        with open('../projetLong/tweegle/Collection/' + file_name + '.json', encoding="utf8") as json_data:
                            data = json.load(json_data)
                            listResult = []  
                            tweetAleatoire = random.sample(range(0, len(data) - 1), 15)
                            for i in tweetAleatoire:
                                tweets = Tweet()
                                tweets.idTweet = data[str(i)]
                                tweets.type = data[str(i)]["type"]
                                tweets.description = data[str(i)]["description"]
                                tweets.listOfTweet = []
                                tweets.listOfTweet.append(data[str(i)]["tweets"])                      
                                listResult.append(tweets)
                        return listResult
