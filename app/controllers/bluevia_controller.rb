require 'oauth'
require 'oauth/signature/hmac/sha1'

##
# This controller handles the two OAuth steps to authenticate an user in BlueVia and authorize an
# application a specific set of BlueVia APIs on behalf of the user.
class BlueviaController < ApplicationController

  # This action handles the OAuth step1: 
  # redirect to BlueVia endpoint with the application credentials and the oauth callback uri as parameters
  def index

    request_token = oauth_consumer.get_request_token({:oauth_callback => redirect_uri})
    
    # Retrieve a set of token, secret to start the OAuth process
    token = request_token.token
    token_secret = request_token.secret
    
    if token.nil? or token.empty? or token_secret.nil? or token_secret.empty?
      raise BlueviaEngine::UnauthorizedError.new("Unable to get a token and token secret from BlueVia")
    end

    # token and secret must be stored temporally, use a cookie
    cookies[:token] = "#{token}|#{token_secret}"
    logger.debug "Retrieve this token from BlueVia: #{token}"
    logger.debug "Retrieve this token_secret from BlueVia: #{token_secret}"
  
    url = "https://connect.bluevia.com/authorise/?oauth_token=#{token}"
    redirect_to(url)
  end

  # This action handles the OAuth step2: 
  # retrieve the code from BlueVia, ask for a valid access token and forward to the configured Rails action
  def code

    token, token_secret = get_token_from_cookie(cookies[:token])
    
    if token.nil? or token.empty? or token_secret.nil? or token_secret.empty?
      raise BlueviaEngine::Error.new("Unable to retrieve the previously saved data")
    end

    logger.debug "Retrieve this token from user cookie: #{token}"
    logger.debug "Retrieve this token_secret from user cookie: #{token_secret}"
    
    # Get the access_token once user has granted the application
    request_token = OAuth::RequestToken.new(oauth_consumer, token, token_secret)

    access_token = request_token.get_access_token(:oauth_verifier => params[:oauth_verifier])

    token, token_secret = access_token.params[:oauth_token], access_token.params[:oauth_token_secret]

    if Rails.application.config.bluevia.forward_action.nil? or !Rails.application.config.bluevia.forward_action.is_a?(String)
      raise BlueviaEngine::InvalidConfig.new("Invalid forward_action value")
    end
        
    url = Rails.application.config.bluevia.forward_action.split("#")

    url.length == 2 or raise BlueviaEngine::InvalidConfig.new("Invalid forward_action value")

    redirect_to ({
      :controller => url.first,
      :action => url.last,
      :token => token,
      :token_secret => token_secret
      })
  end
  
  ##
  # Default action to show the valid user credentials
  def show
    @data = {:token => params[:token], :token_secret => params[:token_secret]}
  end
  
  ##
  # Redirect uri to be sent to BlueVia OAuth mechanism as callback uri
  def redirect_uri
    "#{request.protocol}#{request.host_with_port}/bluevia/code"
  end
  
  private

  ##
  # In the first OAuth step we need to keep this data in a user cookie. Let us retrieve it now!
  # 
  # ==== Parameters
  # * **cookie_token**: previously stored data
  #
  # ==== Return
  # * **token**: user token (not signed yet)
  # * **token_secret**: user token secret (not signed yet)
  def get_token_from_cookie(cookie_token)
    unless cookie_token.nil?
      cookie_token = cookie_token.split("|")
      if cookie_token.size != 2
        raise SyntaxError, "The cookie is not valid"
      end
      return cookie_token[0], cookie_token[1]
    else
      raise SyntaxError, "The cookie is not valid"
    end
  end
  
  ##
  # Get a valid OAuth consumer to send signed requests
  #
  # ==== Return
  # * **oauth_consumer**: HTTP client with basic information about how to sign requests
  def oauth_consumer
    @oauth_consumer ||= OAuth::Consumer.new( Rails.application.config.bluevia.key,
                                              Rails.application.config.bluevia.secret,
                                              {
                                                :site               => "https://api.bluevia.com",
                                                :signature_method   => "HMAC-SHA1",
                                                :request_token_path => "/services/REST/Oauth/getRequestToken",
                                                :access_token_path  => "/services/REST/Oauth/getAccessToken",
                                                :http_method        => :post
                                              })
  end
  
end
