'''
this file is used to link our web pages to our methodes defined in our view.py module this file is essential to respect the MVT model of
Django.
'''
from django.conf.urls import url
from tweegle import views

urlpatterns = [
    url(r'^$', views.index, name='index'),
    url(r'Event$', views.events,name='Events'),
    url(r'searchE$', views.search_events),
]
