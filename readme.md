# Getting Started with Apple Music and RubyMotion

This is a project that I wrote to learn how to code an iPhone app to play music
from my Apple Music subscription using [RubyMotion](http://www.rubymotion.com/).

I documented what I learned on Medium. 

> I love my Apple Music subscription but, like everyone else, I hate the Apple Music app. The app can’t decide whether it wants to be great for streaming or great for playing your own music and does neither very well. There are a bunch of third party apps that are better for playing music that you’ve purchased but none that I could find that try make streaming more pleasant. Time to write my own.

> Apple released a new API, MusicKit, last year that gives you access to search and play music from your Apple Music subscription. Would it work with RubyMotion? Here’s where we find out.

The first instalment is here:

 1. [Getting Started with Apple Music and RubyMotion](https://medium.com/@kevlaw/getting-started-with-apple-music-and-rubymotion-418310162ff2) 


## Build and deploy

To build using the default simulator:
 
    rake simulator

You'll need to deploy to a real iOS device to play music though. 
To deploy to you phone, you'll need to:

1. Create a mobile provisioning certificate.
2. Edit the Rakefile sections with your App ID & the name of the file continaing the certificate. 

Then:

    rake device


## Join the RubyMotion Slack Channel #

[Here is the link.](http://motioneers.herokuapp.com/) Come and say hello!
