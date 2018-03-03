'''
this is the model of our application this model take care of the connection with the database and allow us to use some predefined
functions to select, add ... data to the database.
here we defined the model Event which contains a id(primary key) and a title (a charfield)
'''

from django.db import models


class Event(models.Model):
    id = models.AutoField(primary_key=True)
    title = models.CharField(max_length=200,unique= True)

    def __str__(self):      
        return self.title
    


        
        