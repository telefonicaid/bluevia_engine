module BlueviaEngine

  ##
  # This class is the base class that handles any error related to the OAuth mechanism
  class Error < StandardError
  end
  
  ##
  # This exception is used when the application config is not recognized by Bluevia
  class UnauthorizedError < Error
  end
  
  ##
  # This exception is used when the application config is invalid
  class InvalidConfig < Error
  end
end