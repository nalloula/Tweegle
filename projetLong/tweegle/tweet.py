# -*- coding: utf-8 -*-
''' this is our class tweet we define in it the components of a regular tweet in our json file
and a variable idFrame that is used in the template to link it to the iframe created
by the twitter API.
'''

class Tweet(object):

    """ Class Tweet to represent tweets.
    """

    def __init__(self, id_tweet=None, description=None, tweet_type=None, tweet_list=None, id_frame=None):

        """ A Tweet has 4 attributes according the event collection.
        - idTweet for the relative position of the tweet in its corresponding event.
        - description for tweet text content.
        - type can be img_upload, img_url, video, news, website or tweet.
        - tweet_list is the list of absolute ids for the tweet in the Twitter API.
        - idFrame is the position of the tweet in function of its type.
        """

        self.id_tweet = id_tweet
        self.description = description
        self.type = tweet_type
        self.tweet_list = tweet_list
        self.id_frame = id_frame
