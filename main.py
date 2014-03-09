import webapp2

class MainPage(webapp2.RequestHandler):

    def get(self):
        self.redirect("https://weka.waikato.ac.nz/")

application = webapp2.WSGIApplication([
    ('/', MainPage),
], debug=True)

