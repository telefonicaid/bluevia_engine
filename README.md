# Description

This Rails Engine provides the easiest way to handle OAuth authentication mechanism with BlueVia API in a Rails application.

If you want to use any other BlueVia API, please go to [Bluevia portal SDKs sections](https://bluevia.com/en/knowledge/sdks.Ruby) and check for the latest available gem.

# Installation

After creating a Rails 3 application...

* Use Gemfile as usual to define the bluevia_engine dependency


    gem 'bluevia-engine'


* Run the generator to copy the configuration file template into your rails application initializers folder

    rails generate  bluevia_engine:install


# How to use

## Configuration

* Define your BlueVia application credentials in the file config/initializers/bluevia\_engine\_initializer.rb

    \# Application unique identifier. Actually its not needed at all
    
    Rails.application.config.bluevia.application_id = "your-bluevia-application-id"

    \# Application key. This is the first element to authenticate an application
    
    Rails.application.config.bluevia.key = "your-bluevia-application-key"

    \# Application secret. This is the second element to authenticate an application
    
    Rails.application.config.bluevia.secret = "your-bluevia-application-secret"

* Define the controller#action where you would like to receive the OAuth response data. You'll get two parameters: **token** and **token\_secret\_** that you should handle accordingly.

    \# Where to forward the OAuth response data
    
    \# By default is configured an action include in the Engine that prints the token and secret got from BlueVia
    
    Rails.application.config.bluevia.forward_action = "bluevia#show"

## Launch OAuth process

* Create a link in one of your views to the path that launches the BlueVia OAuth process:

    <%=link_to t("launch\_bluevia\_oauth"), bluevia\_index\_path%>

# License

Check the [License](LICENSE.txt) file.


# Author

* Juan de Bravo (jdbd at tid dot es)