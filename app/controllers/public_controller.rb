class PublicController < ApplicationController
    def index
      if current_user
        render json: { message: "Welcome back, #{current_user[:username]}! You’re successfully logged in." }
      else
        render json: { message: "Hello, Guest! It looks like you’re not logged in yet." }
      end
    end
end
