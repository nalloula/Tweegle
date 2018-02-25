# -*- coding: utf-8 -*-
from django.db import models

class Event(models.Model):
    
    id = models.AutoField(primary_key=True)
    title = models.CharField(max_length=128,unique= True)
    
    def __str__(self):      
        return self.title