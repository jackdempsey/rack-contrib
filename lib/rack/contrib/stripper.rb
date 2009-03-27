module Rack

  # A Rack middleware for stripping values out of params
  #
  # TODO: Find a better name.
  #
  class Stripper

    # Constants
    #
    CONTENT_TYPE = 'CONTENT_TYPE'.freeze
    POST_BODY = 'rack.input'.freeze
    FORM_INPUT = 'rack.request.form_input'.freeze
    FORM_HASH = 'rack.request.form_hash'.freeze

    def initialize(app)
      @app = app
    end

    def call(env)
      y env
      #env.update(FORM_HASH => env[POST_BODY].read), FORM_INPUT => env[POST_BODY])
      @app.call(env)
    end

  end
end
