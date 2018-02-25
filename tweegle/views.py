# -*- coding: utf-8 -*-
from django.shortcuts import render
from tweegle.models import Event
from tweegle.Tweet import Tweet
from django.db.models import Q
from tweegle.importfromcollection import getTweetByIdEvent

def index (request):
    return render(request, 'index.html')

def index2 (request):
    queryset_list=Event.objects
    query = request.GET.get("query")
    if query : 
        print(query)
        queryset_list = queryset_list.filter(Q(title__icontains=query))
        context_dict = {'events' : queryset_list}
        return render(request, 'index2.html',context_dict)
    else:
        return render(request, 'index.html')

def Events (request):
    queryset_list=Event.objects
    query = request.GET.get("query")
    if query : 
        queryset_list = queryset_list.filter(Q(title__icontains=query))
        for list in queryset_list:
            list_results = []
            list_results = getTweetByIdEvent(list.id)
    context_dict = {'tweets' : list_results}
    return render(request, 'Events.html',context_dict)