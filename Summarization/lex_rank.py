# -*- coding: utf-8 -*-
""" This module is the application of Lexrank summarization method
on the event collections. The summaries are indexed by event IDs and
are generated the folder called 'LexrankResult'.
"""

import os
import glob
from sumy.parsers.plaintext import PlaintextParser
from sumy.nlp.tokenizers import Tokenizer
from sumy.summarizers.lex_rank import LexRankSummarizer

def lex_rank(nb_sentences):

    """ Lexrank function for automatic summarization.

    INPUT:
    -----
    nb_sentences    the number of sentences for the final event summaries.

    OUTPUT:
    ------
    Done    It means that the methods has finished and the result is available
            in the folder called 'LexrankResult'.
    """

    # Create the final folder that will contain event summaries
    try:
        path = "LexrankResult/"+str(nb_sentences)
        os.system("mkdir LexrankResult")
        os.mkdir(path)
    except OSError:
        print("Folder LexrankResult already created !")
    # Construct the path to the post-processed events collection
    event_collection = glob.glob1("FinalCollection", "*.txt")
    event_collection = ["FinalCollection/"+event for event in event_collection]
    for event in event_collection:
        # Define a Plaintext parser for event text files
        parser = PlaintextParser.from_file(event, Tokenizer("english"))
        # Get the event id
        var = os.path.splitext(event)[0]
        id_event = var.replace("FinalCollection/", "")
        # Get the event total number of lines (sentences)
        with open("FinalCollection/"+id_event+".txt", encoding="utf-8") as file:
            nb_lines = len(file.readlines())
        # Summarize the document using Lexrank method. We keep at the end nb_sentences sentences.
        summarizer = LexRankSummarizer()
        summary = summarizer(parser.document, min(nb_sentences, nb_lines))
        event_summary = open('LexrankResult/'+str(nb_sentences)+'/'+id_event+'.txt', "wb")
        for sentence in summary:
            event_summary.write(((str(sentence)+"\r\n")).encode('utf-8', 'ignore'))
        event_summary.close()
    return "Done"

if __name__ == "__main__":
    NB_SENTENCES = 0
    try:
        CHOICE = input("Please give a positive number of sentences for the resume, by default 7: ")
        if CHOICE == "":
            NB_SENTENCES = 7
        elif  int(CHOICE) <= 0:
            NB_SENTENCES = 7
        else:
            NB_SENTENCES = int(CHOICE)
    except ValueError as error_message:
        print(error_message)
    lex_rank(NB_SENTENCES)
