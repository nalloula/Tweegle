""" Python-Django for project administration.
"""

from django.contrib import admin
from tweegle.models import Event

admin.site.register(Event)
