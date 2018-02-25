# -*- coding: utf-8 -*-
from django.conf.urls import url
from tweegle import views

urlpatterns = [
    url(r'^$',views.index ,name='index'),
    url(r'index2$',views.index2 ,name='index2'),
    url(r'Events$',views.index2 ,name='Events')
]