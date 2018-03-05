# -*- coding: utf-8 -*-
''' The function get_tweet_by_id_event take as parameter the id of a event finds the json file
(in the collection) that have the same id. A json file contains tweets related to the event,
we then chose randomly 15 tweets from this collection and put the in a list (listResult).
'''

import os
import fnmatch
import json
import random
from tweegle.tweet import Tweet

def get_tweet_by_id_event(id_event):
    """ This function is an auxiliary function that returns 15 tweets corresponding
    to an event whose id is specified in the parameters.

    INPUT:
    ------
    id_events is the event id.

    OUTPUT:
    -------
    result_list a list of 15 tweet selected randomly for the event.
    """

    # os.walk return 3 fields, we are only interested in filenames attribute.
    for root, dirnames, filenames in os.walk('../projetLong/tweegle/Collection'):
        for filename in fnmatch.filter(filenames, '*.json'):
            # Get file prefix, that is the event id as well.
            file_name = os.path.splitext(filename)[0]
            # We keep only the file corresponding to the givent event id.
            if int(file_name) == id_event:
                with open('../projetLong/tweegle/Collection/' + file_name + '.json', encoding="utf8") as json_data:
                    data = json.load(json_data)
                    result_list = []
                    random_ids = random.sample(range(0, len(data) - 1), 15)
                    for i in random_ids:
                        tweets = Tweet()
                        tweets.id_tweet = data[str(i)]
                        tweets.type = data[str(i)]["type"]
                        tweets.description = data[str(i)]["description"]
                        tweets.tweet_list = []
                        tweets.tweet_list.append(data[str(i)]["tweets"])
                        result_list.append(tweets)
                return result_list
