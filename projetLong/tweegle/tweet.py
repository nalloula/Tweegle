# -*- coding: utf-8 -*-
'''
this is our class tweet we define in it the components of a regular tweet in our json file plus a variable idFrame that is used in the 
template to link it to the iframe created by the twitter API.
'''
class Tweet(object):

    def __init__(self,idTweet=None, description=None, type=None, listOfTweet=None, idFrame =None):
        self.idTweet=idTweet
        self.description=description
        self.type=type
        self.listOfTweet=listOfTweet
        self.idFrame=idFrame