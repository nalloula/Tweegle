""" This module defines the views (equivalent of Controler in a JavaEE MVC architecture).
The views interact with the model (models.py) and the templates (files in templates folder).
"""

from django.http.response import HttpResponse
from django.shortcuts import render
from django.db.models import Q
from django.views.decorators.csrf import ensure_csrf_cookie
from tweegle.models import Event
import tweegle.importfromcollection as ipm

@ensure_csrf_cookie
def index(request):
    """ This function returns the index html page.
    """

    return render(request, 'index.html')

@ensure_csrf_cookie
def events(request):
    """ This function interacts with events.html template. It takes a request (event selection
    from the dropdown list and returns its corresponding tweets.
    """

    queryset_list = Event.objects
    img = 0
    vid = 0
    query = request.GET.get("query")
    if query:
        queryset_list = queryset_list.filter(Q(title__icontains=query))
        for lst in queryset_list:
            list_results = []
            list_results = ipm.get_tweet_by_id_event(lst.id)
            i = 0
            # Every tweet has a different id_frame.
            for tweet in list_results:
                if(tweet.type == "news" or tweet.type == "tweet" or tweet.type == "website"):
                    tweet.id_frame = i
                    tweet.id_tweet = tweet.tweet_list[0][0]
                    i = i + 1
            for tweet in list_results:
                if(tweet.type == "img_upload" or tweet.type == "img_url"):
                    img = 1
                    tweet.id_frame = i
                    tweet.id_tweet = tweet.tweet_list[0][0]
                    i = i + 1
            for tweet in list_results:
                if tweet.type == "video":
                    vid = 1
                    tweet.id_frame = i
                    tweet.id_tweet = tweet.tweet_list[0][0]
                    i = i + 1
    context_dict = {'tweets' : list_results,
                    'query' : query,
                    'img' : img,
                    'vid' : vid}
    return render(request, 'Events.html', context_dict)

@ensure_csrf_cookie
def search_events(request):
    """ This function looks for and returns 10 events containing keywords present in user request.
    """

    response = ""
    query = request.POST.get("val")
    queryset_list = Event.objects
    queryset_list = queryset_list.filter(Q(title__icontains=query))
    key = 0
    for event in queryset_list:
        if key < 10:
            response += event.title + "***.***"
        key += 1
    return HttpResponse(response)
