import webapp2

class MainPage(webapp2.RequestHandler):

    def get(self):
        self.redirect("http://open.fracpete.de/")

application = webapp2.WSGIApplication([
    ('/', MainPage),
], debug=True)

