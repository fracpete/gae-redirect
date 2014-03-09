gae-redirect
============

Simple Google AppEngine (Python) application for redirecting to another URL.

Customizing
-----------

Things to change if you want to use it:

 * app.yaml

   Change the "application" ID to whatever your GAE app is using.

 * main.py

   change the URL argument of the "self.redirect" call.
   Add "permanent=True" as second argument if this is to be permanent (301).


Helper scripts
--------------

There are some helper bash scripts available (use "-h" option to see full list of options):

 * clean.sh

   As the name suggests, it removes temporary files.

 * start.sh

   Starts the developer web server on "localhost:8080", which is useful for testing your app.

   You will have to adjust the paths to Google's AppEngine (-g) and the Python executable (-p).

 * deploy.sh

   Deploys the application to the Google cloud. 
   
   You should use option "-c" to disable cookies. Then you can simply
   copy/paste a confirmation link into your browser to obtain the verification
   code to enter in the console again to initiate the actual deployment.
   This is very useful when working remotely and you only have a text console
   available.


FracPete
