''' This is the model of our application this model (MVT Django architecture) take care of
the connection with the database and allow us to use some predefined functions to
select, add ... data to the database. Here we defined the model Event which contains
a id(primary key) and a title (a charfield).
'''

from django.db import models


class Event(models.Model):
    """ Class Event represents the object event for Twitter events collection.
    """

    id = models.AutoField(primary_key=True)
    title = models.CharField(max_length=200, unique=True)

    def __str__(self):
        return self.title
