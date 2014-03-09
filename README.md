gae-redirect
============

Simple Google AppEngine (Python) application for redirecting to another URL.

Things to change if you want to use it:

 * app.yaml

   Change the "application" ID to whatever your GAE app is using.

 * main.py

   change the URL argument of the "self.redirect" call. Add "permanent=True" as second argument if this is to be permanent (301).


FracPete
