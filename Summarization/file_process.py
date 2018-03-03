# -*- coding: utf-8 -*-
""" This script is useful to extract and filter Tweets from the event
collections. The result of this treatment is saved in the folder called
'CollectionResult' with following naming convention: x.txt to stand for
the sentences generated for the event whose id is x.
"""

import os
import json
import glob

if __name__ == "__main__":
    try:
        os.system("mkdir FinalCollection")
    except Exception:
        pass
    for id_event in glob.glob1("Collection", "*.json"):
        event_path = 'Collection/'+id_event
        with open(event_path, encoding="utf8") as input_file:
            data = json.load(input_file)
        file_name = os.path.splitext(id_event)[0]
        file = open('FinalCollection/'+file_name+'.txt', "wb")
        for d in data:
            desc = data[d]["description"]
            desc = desc.replace(".", " ")
            id_tweet = data[d]["tweets"]
            file.write(((desc+str(id_tweet)+"."+"\r\n")).encode('utf-8', 'ignore'))
        file.close()
