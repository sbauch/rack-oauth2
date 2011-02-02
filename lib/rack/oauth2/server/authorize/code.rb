module Rack
  module OAuth2
    module Server
      class Authorize
        class Code < Abstract::Handler

          def call(env)
            @request  = Request.new(env)
            @response = Response.new(request)
            super
          end

          class Request < Authorize::Request
            def initialize(env)
              super
              @response_type = :code
              attr_missing!
            end
          end

          class Response < Authorize::Response
            attr_required :code

            def protocol_params
              super.merge(:code => code)
            end
          end

        end
      end
    end
  end
end