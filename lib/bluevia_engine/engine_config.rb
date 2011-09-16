module BlueviaEngine
  # Array of elements that should be configured by the user
  # See the initializer for further information about each parameter
  bluevia_engine_config = [:key, :secret, :application_id, :forward_action]

  class EngineConfig  < Struct.new(*bluevia_engine_config)
  end
  
end