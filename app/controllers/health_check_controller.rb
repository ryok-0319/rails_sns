class HealthCheckController < ApplicationController
    def authenticate!
      # nothing
    end
    
    def index
      render json: {}
    end
end
