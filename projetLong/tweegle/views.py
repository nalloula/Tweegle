from django.shortcuts import render, render_to_response
from tweegle.models import Event
from django.db.models import Q
import tweegle.importfromcollection as ipm
from django.views.decorators.csrf import csrf_exempt
from django.http import response
from django.http.response import HttpResponse


def index (request):
    return render(request, 'index.html')


def Events (request):
    queryset_list = Event.objects
    img = 0
    vid = 0
    query = request.GET.get("query")
    if query : 
        queryset_list = queryset_list.filter(Q(title__icontains=query))
        for list in queryset_list:
            print(list.id)
            list_results = []
            list_results = ipm.getTweetByIdEv(list.id)
            i = 0
            for tweet in list_results:
                if(tweet.type == "news" or tweet.type == "tweet" or tweet.type == "website"):
                    tweet.idFrame = i
                    tweet.idTweet = tweet.listOfTweet[0][0]
                    i = i + 1
            for tweet in list_results:
                if(tweet.type == "img_upload" or tweet.type == "img_url"):
                    img = 1
                    tweet.idFrame = i
                    tweet.idTweet = tweet.listOfTweet[0][0]
                    i = i + 1   
            for tweet in list_results:
                if(tweet.type == "video"):
                    vid = 1
                    tweet.idFrame = i
                    tweet.idTweet = tweet.listOfTweet[0][0]
                    i = i + 1          
    context_dict = {'tweets' : list_results,
                    'query' : query,
                    'img' : img,
                    'vid' : vid}
    return render(request, 'Events.html', context_dict)


def searchEvents (request):
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
